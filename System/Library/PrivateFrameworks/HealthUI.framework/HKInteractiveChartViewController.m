@implementation HKInteractiveChartViewController

- (HKInteractiveChartViewController)initWithStackedDisplayTypes:(id)a3 primaryDisplayTypeStackIndex:(id)a4 stackedDisplayTypeHeights:(id)a5 healthStore:(id)a6 unitPreferenceController:(id)a7 dateCache:(id)a8 chartDataCacheController:(id)a9 selectedTimeScopeController:(id)a10 sampleTypeDateRangeController:(id)a11 initialXValue:(id)a12 currentCalendarOverride:(id)a13 options:(unint64_t)a14 timeScopeRanges:(id)a15
{
  id v20;
  id v21;
  id v22;
  HKInteractiveChartViewController *v23;
  HKInteractiveChartViewController *v24;
  uint64_t v25;
  NSDate *creationDate;
  uint64_t v27;
  HKDisplayTypeController *displayTypeController;
  NSMutableArray *v29;
  NSMutableArray *observers;
  HKGraphSeriesConfigurationManager *v31;
  uint64_t v32;
  NSArray *allGraphSeriesConfigurationManagers;
  uint64_t v34;
  UIFont *majorSelectedPointFont;
  uint64_t v36;
  UIFont *minorSelectedPointFont;
  NSDictionary *timeScopeRanges;
  id chartHasDataCompletion;
  void *v40;
  int64_t v41;
  void *v42;
  void *v43;
  HKSelectedRangeFormatter *v44;
  void *v45;
  HKSelectedRangeFormatter *v46;
  _TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager *v47;
  _TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager *analyticsManager;
  id v50;
  id v51;
  id v52;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  objc_super v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v61 = a4;
  v51 = a5;
  v60 = a5;
  v20 = a6;
  v59 = a7;
  v50 = a8;
  v58 = a8;
  v57 = a9;
  v56 = a10;
  v55 = a11;
  v54 = a12;
  v21 = a13;
  v22 = a15;
  v62.receiver = self;
  v62.super_class = (Class)HKInteractiveChartViewController;
  v23 = -[HKInteractiveChartViewController init](&v62, sel_init);
  v24 = v23;
  if (v23)
  {
    v23->_displayState = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v25 = objc_claimAutoreleasedReturnValue();
    creationDate = v24->_creationDate;
    v24->_creationDate = (NSDate *)v25;

    v24->_options = a14;
    objc_storeStrong((id *)&v24->_healthStore, a6);
    objc_storeStrong((id *)&v24->_unitPreferenceController, a7);
    objc_storeStrong((id *)&v24->_dateCache, v50);
    objc_storeStrong((id *)&v24->_chartDataCacheController, a9);
    objc_storeStrong((id *)&v24->_selectedTimeScopeController, a10);
    objc_storeWeak((id *)&v24->_currentValueViewHandler, v24);
    +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v20);
    v27 = objc_claimAutoreleasedReturnValue();
    displayTypeController = v24->_displayTypeController;
    v24->_displayTypeController = (HKDisplayTypeController *)v27;

    objc_storeStrong((id *)&v24->_sampleTypeDateRangeController, a11);
    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    observers = v24->_observers;
    v24->_observers = v29;

    v31 = objc_alloc_init(HKGraphSeriesConfigurationManager);
    v63[0] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
    v32 = objc_claimAutoreleasedReturnValue();
    allGraphSeriesConfigurationManagers = v24->_allGraphSeriesConfigurationManagers;
    v24->_allGraphSeriesConfigurationManagers = (NSArray *)v32;

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 16.0);
    v34 = objc_claimAutoreleasedReturnValue();
    majorSelectedPointFont = v24->_majorSelectedPointFont;
    v24->_majorSelectedPointFont = (UIFont *)v34;

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1438]);
    v36 = objc_claimAutoreleasedReturnValue();
    minorSelectedPointFont = v24->_minorSelectedPointFont;
    v24->_minorSelectedPointFont = (UIFont *)v36;

    timeScopeRanges = v24->_timeScopeRanges;
    v24->_timeScopeRanges = 0;

    chartHasDataCompletion = v24->_chartHasDataCompletion;
    v24->_chartHasDataCompletion = 0;

    v24->_lastDateValueRangeUpdate = 0.0;
    objc_storeStrong(&v24->_initialXValue, a12);
    v24->_firstSampleDateRangeUpdate = 1;
    v24->_delayedAutoscaleRequestCount = 0;
    v24->_delayedAutoscaleActualCount = 0;
    v40 = v21;
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v24->_currentCalendar, v40);
    if (!v21)

    if (v61)
      v41 = (int)objc_msgSend(v61, "intValue");
    else
      v41 = 0;
    v24->_primaryDisplayTypeStackIndex = v41;
    +[HKInteractiveChartViewController _validateStackedHeights:](HKInteractiveChartViewController, "_validateStackedHeights:", v60, a6);
    objc_storeStrong((id *)&v24->_stackedDisplayTypeHeights, v51);
    -[HKInteractiveChartViewController setDisplayTypeStack:](v24, "setDisplayTypeStack:", v52);
    if (-[HKInteractiveChartViewController _chartHasDateAxis](v24, "_chartHasDateAxis"))
    {
      -[HKInteractiveChartViewController sampleTypeDateRangeController](v24, "sampleTypeDateRangeController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObserver:", v24);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObserver:selector:name:object:", v24, sel__unitPreferencesDidUpdate_, CFSTR("HKUnitPreferenceControllerUnitPreferencesDidChangeNotification"), 0);

    -[HKInteractiveChartViewController _setVisibleDisplayTypes:](v24, "_setVisibleDisplayTypes:", v52);
    -[HKInteractiveChartViewController _createAndPrepareFeedbackGenerator](v24, "_createAndPrepareFeedbackGenerator");
    v44 = [HKSelectedRangeFormatter alloc];
    -[HKInteractiveChartViewController unitPreferenceController](v24, "unitPreferenceController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[HKSelectedRangeFormatter initWithUnitPreferenceController:](v44, "initWithUnitPreferenceController:", v45);
    -[HKInteractiveChartViewController setSelectedRangeFormatter:](v24, "setSelectedRangeFormatter:", v46);

    v24->_disableCurrentValueViewForInitialLollipop = 0;
    v24->_hasInitialDateRangeAndTimeScope = 1;
    objc_storeStrong((id *)&v24->_timeScopeRanges, a15);
    v24->_annotationDataSourceFirstWeekday = -1;
    v47 = -[HKInteractiveChartInteractionAnalyticsManager initWithHealthStore:]([_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager alloc], "initWithHealthStore:", v20);
    analyticsManager = v24->_analyticsManager;
    v24->_analyticsManager = v47;

  }
  return v24;
}

- (HKInteractiveChartViewController)initWithDisplayTypes:(id)a3 healthStore:(id)a4 unitPreferenceController:(id)a5 dateCache:(id)a6 chartDataCacheController:(id)a7 selectedTimeScopeController:(id)a8 sampleTypeDateRangeController:(id)a9 initialXValue:(id)a10 currentCalendarOverride:(id)a11 options:(unint64_t)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  HKInteractiveChartViewController *v28;
  void *v30;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v32[0] = a3;
  v30 = (void *)MEMORY[0x1E0C99D20];
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v26 = a3;
  objc_msgSend(v30, "arrayWithObjects:count:", v32, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = -[HKInteractiveChartViewController initWithStackedDisplayTypes:primaryDisplayTypeStackIndex:stackedDisplayTypeHeights:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:timeScopeRanges:](self, "initWithStackedDisplayTypes:primaryDisplayTypeStackIndex:stackedDisplayTypeHeights:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:timeScopeRanges:", v27, 0, 0, v25, v24, v23, v22, v21, v20, v19, v18, a12, 0);
  return v28;
}

- (void)setStackedDisplayTypeHeights:(id)a3
{
  NSArray *v4;
  NSArray *stackedDisplayTypeHeights;

  v4 = (NSArray *)a3;
  +[HKInteractiveChartViewController _validateStackedHeights:](HKInteractiveChartViewController, "_validateStackedHeights:", v4);
  stackedDisplayTypeHeights = self->_stackedDisplayTypeHeights;
  self->_stackedDisplayTypeHeights = v4;

}

+ (void)_validateStackedHeights:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v21;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (!objc_msgSend(v10, "kind"))
        {
          objc_msgSend(v10, "heightValue");
          v8 = v8 + v11;
          ++v6;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
    if (v6 >= 1 && fabs(v8 + -1.0) >= 0.000001)
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
        +[HKInteractiveChartViewController _validateStackedHeights:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }

}

- (void)interactiveChartHasData:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;

  v4 = (void (**)(_QWORD))a3;
  if (!-[HKInteractiveChartViewController chartDataIsAvailable](self, "chartDataIsAvailable"))
  {
    -[HKInteractiveChartViewController chartHasDataCompletion](self, "chartHasDataCompletion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[HKInteractiveChartViewController setChartHasDataCompletion:](self, "setChartHasDataCompletion:", v4);
      goto LABEL_6;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      -[HKInteractiveChartViewController interactiveChartHasData:].cold.1();
  }
  v4[2](v4);
LABEL_6:

}

- (BOOL)chartDataIsAvailable
{
  void *v2;
  void *v3;
  char v4;

  -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "graphView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "allSeriesHaveDataAvailable");
  else
    v4 = 0;

  return v4;
}

- (id)supportedTimeScopes
{
  unint64_t options;
  void *v3;
  void *v4;

  options = self->_options;
  -[HKInteractiveChartViewController timeScopeRanges](self, "timeScopeRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKInteractiveChartViewController _timeScopesWithOptions:timeScopeRanges:](HKInteractiveChartViewController, "_timeScopesWithOptions:timeScopeRanges:", options, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)currentValueViewAsString
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;

  -[HKInteractiveChartViewController updateCurrentValueViewWithVisibleRange](self, "updateCurrentValueViewWithVisibleRange");
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKInteractiveChartViewController dataSourceForCurrentValueViewString](self, "dataSourceForCurrentValueViewString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_currentValueView)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    objc_msgSend(v3, "addObject:", CFSTR("Unable to determine current value view content"));
  }
  else
  {
    objc_msgSend(v4, "dateViewWithOrientation:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController _valueViewToString:](self, "_valueViewToString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

    v9 = objc_msgSend(v5, "numberOfValuesForAnnotationView:", self->_currentValueView);
    if (v9 < 1)
    {
      objc_msgSend(v3, "addObject:", CFSTR("No Data"));
    }
    else
    {
      v10 = v9;
      for (i = 0; i != v10; ++i)
      {
        objc_msgSend(v5, "valueViewForColumnAtIndex:orientation:", i, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKInteractiveChartViewController _valueViewToString:](self, "_valueViewToString:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

      }
    }

  }
  -[HKInteractiveChartViewController _assembleValueViewString:](self, "_assembleValueViewString:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_valueViewToString:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  _QWORD v11[5];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "text");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("NilLabelText");
    if (v5)
      v7 = (__CFString *)v5;
    v8 = v7;
  }
  else
  {
    objc_msgSend(v4, "subviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__HKInteractiveChartViewController__valueViewToString___block_invoke;
    v11[3] = &unk_1E9C442E8;
    v11[4] = self;
    objc_msgSend(v6, "hk_map:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController _assembleValueViewString:](self, "_assembleValueViewString:", v9);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t __55__HKInteractiveChartViewController__valueViewToString___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_valueViewToString:", a2);
}

- (id)_assembleValueViewString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("|"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("(%@)"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("None");
  }

  return v6;
}

- (id)accessibilityDataForChart
{
  id v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  HKAccessibilityData *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[HKTimeScopeControl selectedTimeScope](self->_radioButtons, "selectedTimeScope");
  -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "graphView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController trendAccessibilityDelegate](self, "trendAccessibilityDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trendAccessibilitySeries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    -[HKInteractiveChartViewController descriptionSeriesForGraphView:](self, "descriptionSeriesForGraphView:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v11 = objc_msgSend(v9, "resolutionForTimeScope:traitResolution:", v4, objc_msgSend(v6, "resolutionFromTraitCollectionAttributes"));
  v12 = (void *)MEMORY[0x1E0C9AA70];
  if (v5 && v10)
  {
    v13 = v11;
    objc_msgSend(v6, "hardLeftMarginWidth");
    v15 = v14;
    -[HKInteractiveChartViewController descriptionSpansForGraphView:timeScope:](self, "descriptionSpansForGraphView:timeScope:", v6, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __61__HKInteractiveChartViewController_accessibilityDataForChart__block_invoke;
    v19[3] = &unk_1E9C44310;
    v19[4] = self;
    v23 = v4;
    v24 = v13;
    v20 = v6;
    v21 = v8;
    v25 = v15;
    v22 = v3;
    objc_msgSend(v20, "enumerateVisibleCoordinatesForSeries:block:", v10, v19);

  }
  if (v8)
  {
    v16 = -[HKAccessibilityData initWithPointData:accessibilitySpans:]([HKAccessibilityData alloc], "initWithPointData:accessibilitySpans:", v3, v12);
  }
  else
  {
    -[HKInteractiveChartViewController addNoDataEntries:timeScope:targetSeries:](self, "addNoDataEntries:timeScope:targetSeries:", v3, v4, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HKAccessibilityData initWithPointData:accessibilitySpans:]([HKAccessibilityData alloc], "initWithPointData:accessibilitySpans:", v17, v12);

  }
  return v16;
}

void __61__HKInteractiveChartViewController_accessibilityDataForChart__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  HKAccessibilityPointData *v23;
  id v24;

  v24 = a2;
  v5 = a3;
  objc_msgSend(v24, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1F0170730))
  {
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "descriptionForChartData:timeScope:", v7, *(_QWORD *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "count"))
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v24, "startXValue");
      v12 = v11;
      objc_msgSend(v24, "endXValue");
      objc_msgSend(v10, "descriptionForStartX:endX:chartData:timeScope:resolution:graphView:", v7, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_QWORD *)(a1 + 48))
      {
        v15 = *(void **)(a1 + 32);
        objc_msgSend(v24, "startXValue");
        v17 = v16;
        objc_msgSend(v24, "endXValue");
        objc_msgSend(v15, "_trendCoordinateDescriptionForStartX:endX:timeScope:graphView:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), v17, v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v19;
      }
      v20 = *(void **)(a1 + 32);
      objc_msgSend(v24, "startXValue");
      objc_msgSend(v20, "dateForXCoordinate:graphView:", *(_QWORD *)(a1 + 40));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startXValue");
      v23 = -[HKAccessibilityPointData initWithHorizontalScreenCoordinate:horizontalTimeCoordinate:horizontalDate:values:]([HKAccessibilityPointData alloc], "initWithHorizontalScreenCoordinate:horizontalTimeCoordinate:horizontalDate:values:", v14, v21, v9, v22 + *(double *)(a1 + 80));
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v23);

    }
  }

}

- (id)_trendCoordinateDescriptionForStartX:(double)a3 endX:(double)a4 timeScope:(int64_t)a5 graphView:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v10 = a6;
  -[HKInteractiveChartViewController dateForXCoordinate:graphView:](self, "dateForXCoordinate:graphView:", v10, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController dateForXCoordinate:graphView:](self, "dateForXCoordinate:graphView:", v10, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 == 3)
  {
    -[HKInteractiveChartViewController currentCalendar](self, "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "firstWeekday");

    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithValueRange:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hk_weeksContainingInterval:firstWeekday:", v17, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v21;
  }
  -[HKInteractiveChartViewController stringForValueRange:timeScope:](self, "stringForValueRange:timeScope:", v13, a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController replaceRangeClause:](self, "replaceRangeClause:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)addNoDataEntries:(id)a3 timeScope:(int64_t)a4 targetSeries:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  HKAccessibilityPointData *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  int64_t v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  id v45;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  HKInteractiveChartViewController *v57;

  v8 = a3;
  v9 = a5;
  v57 = self;
  -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && v10)
  {
    v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v51 = v11;
    objc_msgSend(v11, "graphView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "xAxis");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v8, "count");
    objc_msgSend(v12, "effectiveVisibleRangeActive");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transform");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "coordinateForValue:", v17);
    v20 = v19;

    v50 = v13;
    objc_msgSend(v13, "pointTransform");
    v23 = HKLinearTransformValue(v21, v22, v20);
    v52 = v9;
    v24 = objc_msgSend(v9, "resolutionForTimeScope:traitResolution:", a4, objc_msgSend(v12, "resolutionFromTraitCollectionAttributes"));
    v49 = v15;
    objc_msgSend(v15, "seriesPointIntervalComponentsAtResolution:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dateByAddingComponents:toDate:options:", v25, v17, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    HKDateMidpoint(v17, v48);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v14;
    objc_msgSend(v14, "endDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v26, "hk_isBeforeOrEqualToDate:", v27);

    v53 = v8;
    if ((_DWORD)v15)
    {
      v55 = v24;
      v28 = 0;
      while (1)
      {
        if (v28 < v47)
        {
          objc_msgSend(v53, "objectAtIndexedSubscript:", v28);
          v29 = (HKAccessibilityPointData *)objc_claimAutoreleasedReturnValue();
          -[HKAccessibilityPointData horizontalDate](v29, "horizontalDate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[HKInteractiveChartViewController _date:closeToDate:epsilonDateComponents:calendar:](v57, "_date:closeToDate:epsilonDateComponents:calendar:", v26, v30, v25, v16))
          {
            ++v28;

            if (v29)
              goto LABEL_11;
          }
          else
          {

          }
        }
        objc_msgSend(v12, "xAxis");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "transform");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "coordinateForValue:", v26);
        v34 = v33;

        objc_msgSend(v31, "pointTransform");
        v37 = HKLinearTransformValue(v35, v36, v34) - v23;
        objc_msgSend(v12, "hardLeftMarginWidth");
        v39 = v37 + v38;
        -[HKInteractiveChartViewController descriptionForStartX:endX:chartData:timeScope:resolution:graphView:](v57, "descriptionForStartX:endX:chartData:timeScope:resolution:graphView:", 0, a4, v55, v12, v34, v34);
        v40 = a4;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[HKAccessibilityPointData initWithHorizontalScreenCoordinate:horizontalTimeCoordinate:horizontalDate:values:]([HKAccessibilityPointData alloc], "initWithHorizontalScreenCoordinate:horizontalTimeCoordinate:horizontalDate:values:", v41, v26, 0, v39);

        a4 = v40;
        if (v29)
        {
LABEL_11:
          objc_msgSend(v54, "addObject:", v29);

        }
        objc_msgSend(v16, "dateByAddingComponents:toDate:options:", v25, v26, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v56, "endDate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v42, "hk_isBeforeOrEqualToDate:", v43);

        v26 = v42;
        if ((v44 & 1) == 0)
          goto LABEL_16;
      }
    }
    v42 = v26;
LABEL_16:

    v9 = v52;
    v8 = v53;
    v11 = v51;
    v45 = v54;
  }
  else
  {
    v45 = v8;
  }

  return v45;
}

- (BOOL)_date:(id)a3 closeToDate:(id)a4 epsilonDateComponents:(id)a5 calendar:(id)a6
{
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v9 = a4;
  v10 = a3;
  objc_msgSend(a6, "dateByAddingComponents:toDate:options:", a5, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v10);
  v13 = v12 * 0.5;
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  v15 = v14;

  return fabs(v15) < v13;
}

- (id)descriptionSeriesForGraphView:(id)a3
{
  return (id)objc_msgSend(a3, "primarySeries");
}

- (id)descriptionSpansForGraphView:(id)a3 timeScope:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HKAccessibilitySpan *v16;
  void *v17;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[HKInteractiveChartViewController descriptionSeriesForGraphView:](self, "descriptionSeriesForGraphView:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleValueRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController _rangeValueAsNumber:](self, "_rangeValueAsNumber:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "maxValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController _rangeValueAsNumber:](self, "_rangeValueAsNumber:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("HKBarSeries"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = 2;
  else
    v11 = 1;
  -[HKInteractiveChartViewController _displayTypeForSeries:](self, "_displayTypeForSeries:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController _displayNameForDisplayType:](self, "_displayNameForDisplayType:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController unitPreferenceController](self, "unitPreferenceController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedDisplayNameForDisplayType:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[HKAccessibilitySpan initWithTitle:seriesType:dataComprehensionMinYValue:dataComprehensionMaxYValue:dataComprehensionUnitForChart:]([HKAccessibilitySpan alloc], "initWithTitle:seriesType:dataComprehensionMinYValue:dataComprehensionMaxYValue:dataComprehensionUnitForChart:", v13, v11, v8, v10, v15);
  v19 = v13;
  v20[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_rangeValueAsNumber:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)descriptionForStartX:(double)a3 endX:(double)a4 chartData:(id)a5 timeScope:(int64_t)a6 resolution:(int64_t)a7 graphView:(id)a8
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  __CFString *v19;

  v11 = a8;
  -[HKInteractiveChartViewController dateForXCoordinate:graphView:](self, "dateForXCoordinate:graphView:", v11, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "components:fromDate:", 126, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HKCombinedStringForAnnotationDateWithTimeScope((uint64_t)v14, v15, -[HKTimeScopeControl selectedTimeScope](self->_radioButtons, "selectedTimeScope"), a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController replaceRangeClause:](self, "replaceRangeClause:", v16);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKInteractiveChartViewController _numberForXCoordinate:graphView:](self, "_numberForXCoordinate:graphView:", v11, a3);
    v18 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v18;
    v19 = &stru_1E9C4C428;
    if (v18)
      v19 = (__CFString *)v18;
    v17 = v19;
  }

  return v17;
}

- (id)dateForXCoordinate:(double)a3 graphView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a4, "xAxis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForCoordinate:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (id)_numberForXCoordinate:(double)a3 graphView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(a4, "xAxis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForCoordinate:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v8, "setNumberStyle:", 1);
    objc_msgSend(v8, "setUsesSignificantDigits:", 1);
    objc_msgSend(v8, "stringFromNumber:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)replaceRangeClause:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("–"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v3;
  }
  else
  {
    v7 = v4;
    v8 = v5;
    objc_msgSend(v3, "substringWithRange:", 0, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringWithRange:", v7 + v8, objc_msgSend(v3, "length") - (v7 + v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("RANGE_CLAUSE_%@_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v13, v9, v10);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)descriptionForChartData:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  HKAccessibilityValue *v28;
  void *v29;
  void *v30;
  HKInteractiveChartViewController *v31;
  void *v32;
  void *v33;
  HKAccessibilityValue *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id obj;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v39 = v7;
    objc_msgSend(v7, "graphView");
    v8 = objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController descriptionSeriesForGraphView:](self, "descriptionSeriesForGraphView:", v8);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController _displayTypeForSeries:](self, "_displayTypeForSeries:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_interactiveChartsFormatterForTimeScope:", -[HKTimeScopeControl selectedTimeScope](self->_radioButtons, "selectedTimeScope"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartLollipopValueFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMajorFont:", v11);

    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartLollipopKeyFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMinorFont:", v12);

    objc_msgSend(v10, "setDisplayType:", v9);
    -[HKInteractiveChartViewController unitPreferenceController](self, "unitPreferenceController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUnitController:", v13);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "objectType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v16 = v10;
        objc_msgSend(v9, "objectType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "configureFormatterForDisplayType:quantityType:chartRangeProvider:timeScope:context:", v9, v17, v8, a4, 0);

      }
    }
    v38 = (void *)v8;
    v40 = v6;
    v53[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v10;
    objc_msgSend(v10, "formattedSelectedRangeLabelDataWithChartData:context:", v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v19;
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v45)
    {
      v42 = *(_QWORD *)v49;
      v43 = v9;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v49 != v42)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v20);
          objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
          v22 = objc_claimAutoreleasedReturnValue();
          +[HKSelectedRangeLabel standardPrefixColorForSelectedRangeData:defaultColor:](HKSelectedRangeLabel, "standardPrefixColorForSelectedRangeData:defaultColor:", v21, v22);
          v23 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[HKSelectedRangeLabel attributedStringForSelectedRangeData:font:foregroundColor:prefixColor:prefersImageAffixes:embedded:](HKSelectedRangeLabel, "attributedStringForSelectedRangeData:font:foregroundColor:prefixColor:prefersImageAffixes:embedded:", v21, v24, v22, v23, 0, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          -[HKInteractiveChartViewController _displayNameForDisplayType:](self, "_displayNameForDisplayType:", v9);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)v23;
          v47 = (void *)v22;
          if (v25)
          {
            objc_msgSend(v25, "string");
            v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v27 = &stru_1E9C4C428;
          }
          v28 = [HKAccessibilityValue alloc];
          objc_msgSend(v21, "attributedString");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "string");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKInteractiveChartViewController replaceRangeClause:](self, "replaceRangeClause:", v30);
          v31 = self;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "valueAsNumber");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[HKAccessibilityValue initWithValueTitle:valueType:valueDescription:valueAsNumber:](v28, "initWithValueTitle:valueType:valueDescription:valueAsNumber:", v26, v27, v32, v33);

          self = v31;
          objc_msgSend(v44, "addObject:", v34);

          ++v20;
          v9 = v43;
        }
        while (v45 != v20);
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v45);
    }

    v7 = v39;
    v6 = v40;
  }

  return v44;
}

- (void)addChartViewObserver:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_63);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filterUsingPredicate:](self->_observers, "filterUsingPredicate:", v5);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "observer", (_QWORD)v12);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4)
        break;
      if (v8 == ++v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v6 = -[_HKInteractiveChartWeakObserverWrapper initWithObserver:]([_HKInteractiveChartWeakObserverWrapper alloc], "initWithObserver:", v4);
    -[NSMutableArray addObject:](self->_observers, "addObject:", v6);
  }

}

BOOL __57__HKInteractiveChartViewController_addChartViewObserver___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)removeChartViewObserver:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  if (-[NSMutableArray count](self->_observers, "count"))
  {
    v4 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_observers, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "observer");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6 == v7)
        break;

      if (++v4 >= (unint64_t)-[NSMutableArray count](self->_observers, "count"))
        goto LABEL_7;
    }
    -[NSMutableArray removeObjectAtIndex:](self->_observers, "removeObjectAtIndex:", v4);

  }
LABEL_7:

}

- (void)replaceCurrentDisplayTypesWithTypes:(id)a3 stackOffset:(int64_t)a4 resetDateRange:(BOOL)a5 automaticAutoScale:(BOOL)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _BOOL4 v26;
  _BOOL4 v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v26 = a5;
  v27 = a6;
  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[NSArray objectAtIndexedSubscript:](self->_allGraphSeriesConfigurationManagers, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController primaryGraphSeriesForTimeScope:](self, "primaryGraphSeriesForTimeScope:", -[HKInteractiveChartViewController _dateZoom](self, "_dateZoom"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visibleValueRange");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v9, "allDisplayTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v9, "removeConfigurationsForDisplayType:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v13);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v16);
        v40 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        v21 = v40;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKInteractiveChartViewController _addDisplayTypeToConfiguration:allDisplayTypes:configurationManager:](self, "_addDisplayTypeToConfiguration:allDisplayTypes:configurationManager:", v21, v22, v9);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v18);
  }

  -[HKInteractiveChartViewController _updateAfterConfigurationChangeIncludeDateAxis:](self, "_updateAfterConfigurationChangeIncludeDateAxis:", v26);
  if (v27)
  {
    -[HKGraphViewController graphView](self->_primaryGraphViewController, "graphView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __118__HKInteractiveChartViewController_replaceCurrentDisplayTypesWithTypes_stackOffset_resetDateRange_automaticAutoScale___block_invoke;
    v29[3] = &unk_1E9C3FB90;
    v29[4] = self;
    v30 = v23;
    v31 = v28;
    v24 = v23;
    objc_msgSend(v24, "autoscaleYAxesAnimated:specificRange:onlyIfNeeded:completion:", 1, 0, 0, v29);

  }
  -[HKInteractiveChartViewController lollipopController](self, "lollipopController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setInvisibleAnimated:", 1);

  -[HKInteractiveChartViewController _setSelectedGraphSeries:animated:](self, "_setSelectedGraphSeries:animated:", 0, 1);
}

void __118__HKInteractiveChartViewController_replaceCurrentDisplayTypesWithTypes_stackOffset_resetDateRange_automaticAutoScale___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "updateCurrentValueViewWithVisibleRange");
  objc_msgSend(*(id *)(a1 + 32), "primaryGraphSeriesForTimeScope:", objc_msgSend(*(id *)(a1 + 32), "_dateZoom"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleValueRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(a1 + 40), "autoscaleYAxesAnimated:specificRange:onlyIfNeeded:completion:", 0, *(_QWORD *)(a1 + 48), 0, 0);

}

- (void)addOverlayDisplayType:(id)a3 stackOffset:(int64_t)a4
{
  NSArray *allGraphSeriesConfigurationManagers;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  allGraphSeriesConfigurationManagers = self->_allGraphSeriesConfigurationManagers;
  v7 = a3;
  -[NSArray objectAtIndexedSubscript:](allGraphSeriesConfigurationManagers, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController _addDisplayTypeToConfiguration:allDisplayTypes:configurationManager:](self, "_addDisplayTypeToConfiguration:allDisplayTypes:configurationManager:", v7, v9, v8);

  -[HKInteractiveChartViewController _updateAfterConfigurationChangeIncludeDateAxis:](self, "_updateAfterConfigurationChangeIncludeDateAxis:", 0);
  -[HKInteractiveChartViewController updateCurrentValueViewWithVisibleRange](self, "updateCurrentValueViewWithVisibleRange");
  -[HKInteractiveChartViewController _automaticAutoScale](self, "_automaticAutoScale");

}

- (void)removeOverlayDisplayType:(id)a3 stackOffset:(int64_t)a4
{
  -[HKInteractiveChartViewController removeOverlayDisplayType:stackOffset:automaticAutoscale:](self, "removeOverlayDisplayType:stackOffset:automaticAutoscale:", a3, a4, 1);
}

- (void)removeOverlayDisplayType:(id)a3 stackOffset:(int64_t)a4 automaticAutoscale:(BOOL)a5
{
  _BOOL4 v5;
  NSArray *allGraphSeriesConfigurationManagers;
  id v9;
  id v10;

  v5 = a5;
  allGraphSeriesConfigurationManagers = self->_allGraphSeriesConfigurationManagers;
  v9 = a3;
  -[NSArray objectAtIndexedSubscript:](allGraphSeriesConfigurationManagers, "objectAtIndexedSubscript:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeConfigurationsForDisplayType:", v9);

  -[HKInteractiveChartViewController _updateAfterConfigurationChangeIncludeDateAxis:](self, "_updateAfterConfigurationChangeIncludeDateAxis:", 0);
  -[HKInteractiveChartViewController updateCurrentValueViewWithVisibleRange](self, "updateCurrentValueViewWithVisibleRange");
  if (v5)
    -[HKInteractiveChartViewController _automaticAutoScale](self, "_automaticAutoScale");

}

- (id)currentDisplayTypesForStackOffset:(int64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndexedSubscript:](self->_allGraphSeriesConfigurationManagers, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allDisplayTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)graphSeriesForDisplayType:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5
{
  NSArray *allGraphSeriesConfigurationManagers;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  allGraphSeriesConfigurationManagers = self->_allGraphSeriesConfigurationManagers;
  v8 = a3;
  -[NSArray objectAtIndexedSubscript:](allGraphSeriesConfigurationManagers, "objectAtIndexedSubscript:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configurationForDisplayType:zoom:", v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "graphSeries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)primaryGraphSeriesForTimeScope:(int64_t)a3
{
  void *v5;
  void *v6;

  -[HKInteractiveChartViewController _primaryDisplayType](self, "_primaryDisplayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController graphSeriesForDisplayType:timeScope:stackOffset:](self, "graphSeriesForDisplayType:timeScope:stackOffset:", v5, a3, -[HKInteractiveChartViewController primaryDisplayTypeStackIndex](self, "primaryDisplayTypeStackIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setDetailView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailView:", v4);

}

- (int64_t)stackOffsetCount
{
  return -[NSArray count](self->_allGraphSeriesConfigurationManagers, "count");
}

- (double)minimumHeightForChart
{
  return 420.0;
}

- (double)minimumHeightForWidth:(double)a3 chartWidthToHeightRatio:(double)a4
{
  return a3 / a4 + 122.0;
}

- (double)heightForChartHeight:(double)a3
{
  return a3 + 122.0;
}

- (BOOL)_chartHasDateAxis
{
  return (self->_options & 2) == 0;
}

- (BOOL)_selectedDateRangeLabelEnabled
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)_headerLineEnabled
{
  return (LOBYTE(self->_options) >> 4) & 1;
}

- (BOOL)_timeScopeEnabled
{
  return (self->_options & 0x20) == 0;
}

- (BOOL)_currentValueEnabled
{
  return (self->_options & 0x40) == 0;
}

- (double)dateSelectorHeight
{
  return 36.0;
}

- (BOOL)_tilingDisabled
{
  return (BYTE1(self->_options) >> 3) & 1;
}

- (BOOL)_prefersOpaqueLegends
{
  return BYTE2(self->_options) & 1;
}

- (BOOL)_drawsGridlinesPerSeriesGroup
{
  return (self->_options & 0x40000) == 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HKInteractiveChartViewController sampleTypeDateRangeController](self, "sampleTypeDateRangeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)HKInteractiveChartViewController;
  -[HKInteractiveChartViewController dealloc](&v5, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  HKMinimumSizeView *v5;

  v5 = -[HKMinimumSizeView initWithFrame:]([HKMinimumSizeView alloc], "initWithFrame:", 0.0, 0.0, 320.0, 100.0);
  -[HKInteractiveChartViewController minimumHeightForChart](self, "minimumHeightForChart");
  -[HKMinimumSizeView setMinimumHeight:](v5, "setMinimumHeight:");
  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartAccessibilityIdentifier:", CFSTR("Top"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMinimumSizeView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v3);

  -[HKInteractiveChartViewController setView:](self, "setView:", v5);
  -[HKInteractiveChartViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreservesSuperviewLayoutMargins:", 1);

}

- (double)_effectiveHorizontalMargin
{
  void *v3;
  double v4;
  int64_t v5;
  double v6;
  double result;
  void *v8;
  double v9;
  double v10;

  if (-[HKInteractiveChartViewController _applyHorizontalMarginsToEntireView](self, "_applyHorizontalMarginsToEntireView"))
  {
    -[HKInteractiveChartViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = +[HKWidthDesignationProvider widthDesignationFromViewWidth:](HKWidthDesignationProvider, "widthDesignationFromViewWidth:", v4);

    +[HKCollectionViewLayoutEngineDefaults edgeInsetsForWidthDesignation:](HKCollectionViewLayoutEngineDefaults, "edgeInsetsForWidthDesignation:", v5);
    return v6;
  }
  else
  {
    -[HKInteractiveChartViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutMargins");
    v10 = v9;

    result = v10 + -4.0;
    if (v10 <= 16.0)
      return 12.0;
  }
  return result;
}

- (BOOL)_applyHorizontalMarginsToEntireView
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isiPad");

  return v3;
}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double Width;
  void *v7;
  double Height;
  _BOOL4 v9;
  _BOOL4 v10;
  double v11;
  double v12;
  _BOOL4 v13;
  uint64_t v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  HKTimeScopeControl *radioButtons;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double bannerBottom;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  objc_super v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v45.receiver = self;
  v45.super_class = (Class)HKInteractiveChartViewController;
  -[HKInteractiveChartViewController viewWillLayoutSubviews](&v45, sel_viewWillLayoutSubviews);
  -[HKInteractiveChartViewController _effectiveHorizontalMargin](self, "_effectiveHorizontalMargin");
  v4 = v3;
  -[HKInteractiveChartViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  Width = CGRectGetWidth(v46);

  -[HKInteractiveChartViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  Height = CGRectGetHeight(v47);

  if (-[HKInteractiveChartViewController _headerLineEnabled](self, "_headerLineEnabled"))
    -[HKInteractiveChartViewController _layoutHeader](self, "_layoutHeader");
  else
    -[HKInteractiveChartViewController _omitLayoutHeader](self, "_omitLayoutHeader");
  v9 = -[HKInteractiveChartViewController _timeScopeEnabled](self, "_timeScopeEnabled");
  v10 = -[HKInteractiveChartViewController _applyHorizontalMarginsToEntireView](self, "_applyHorizontalMarginsToEntireView");
  v11 = 0.0;
  if (v9)
    v12 = 42.0;
  else
    v12 = 0.0;
  v13 = -[HKInteractiveChartViewController _currentValueEnabled](self, "_currentValueEnabled");
  if ((objc_msgSend(MEMORY[0x1E0DC3BF8], "hk_currentDeviceHas4InchScreen") & 1) != 0)
  {
    *(double *)&v14 = 76.0;
LABEL_14:
    v16 = *(double *)&v14;
    goto LABEL_15;
  }
  if (!objc_msgSend(MEMORY[0x1E0DC3BF8], "hk_currentDeviceHas4Point7InchScreen"))
  {
    *(double *)&v14 = 80.0;
    goto LABEL_14;
  }
  v15 = objc_msgSend(MEMORY[0x1E0DC3BF8], "hk_currentDeviceHasDisplayZoomedEnabled");
  v16 = 80.0;
  if (v15)
    v16 = 76.0;
LABEL_15:
  v43 = v16;
  if (!v13)
    v16 = 0.0;
  v17 = v16 + v12 + self->_bannerBottom;
  v18 = v17;
  if (!v13)
  {
    -[HKInteractiveChartViewController dateSelectorHeight](self, "dateSelectorHeight", v17);
    v11 = v19;
    v18 = v12 + self->_bannerBottom;
  }
  v44 = v18;
  v20 = Height - (v17 + v11);
  -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "graphView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leftMarginViewRect");
  v24 = v23;

  v25 = v4 - v24;
  if (v10)
    v26 = Width + v24 + v4 * -2.0;
  else
    v26 = Width;
  if (!v10)
    v25 = 0.0;
  v42 = v25;
  -[UIView setFrame:](self->_primaryGraphViewWrapper, "setFrame:");
  -[HKGraphViewController view](self->_primaryGraphViewController, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", 0.0, 0.0, v26, v20);

  radioButtons = self->_radioButtons;
  if (v9)
  {
    v41 = v12;
    -[HKTimeScopeControl minimumWidth](radioButtons, "minimumWidth");
    v30 = fmax(v29, 550.0);
    -[HKTimeScopeControl frame](self->_radioButtons, "frame");
    v31 = Width + v4 * -2.0;
    if (Width <= v30)
      v32 = v4;
    else
      v32 = (Width - v30) * 0.5;
    if (Width <= v30)
      v33 = Width + v4 * -2.0;
    else
      v33 = v30;
    bannerBottom = self->_bannerBottom;
    -[HKTimeScopeControl frame](self->_radioButtons, "frame");
    v49.origin.x = v35;
    v49.origin.y = v36;
    v49.size.width = v37;
    v49.size.height = v38;
    v48.origin.x = v32;
    v48.origin.y = bannerBottom;
    v48.size.width = v33;
    v48.size.height = 42.0;
    if (!CGRectEqualToRect(v48, v49))
      -[HKTimeScopeControl setFrame:](self->_radioButtons, "setFrame:", v32, bannerBottom, v33, 42.0);
    v12 = v41;
  }
  else
  {
    -[HKTimeScopeControl setHidden:](radioButtons, "setHidden:", 1);
    v31 = Width + v4 * -2.0;
  }
  -[HKInteractiveChartViewController dateSelectorHeight](self, "dateSelectorHeight");
  -[HKCurrentTimeView setFrame:](self->_currentTimeView, "setFrame:", v4, v44, v31, v39);
  if (v13)
  {
    -[HKCurrentTimeView removeFromSuperview](self->_currentTimeView, "removeFromSuperview");
    -[UIView setHidden:](self->_currentValueView, "setHidden:", 0);
    if (v10)
      v40 = v31 + v24;
    else
      v40 = Width;
    -[UIView setFrame:](self->_currentValueView, "setFrame:", v42, v12 + self->_bannerBottom, v40, v43);
  }
  else
  {
    -[UIView setHidden:](self->_currentValueView, "setHidden:", 1);
  }
  -[HKInteractiveChartViewController _layoutDividerViews](self, "_layoutDividerViews");
  -[HKInteractiveChartViewController _layoutDashboardEmptyLabelsIfNecessary](self, "_layoutDashboardEmptyLabelsIfNecessary");
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  void *v3;
  void *v4;

  -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "graphView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetAndRedraw");

  -[HKInteractiveChartViewController updateCurrentValueViewWithVisibleRange](self, "updateCurrentValueViewWithVisibleRange");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKInteractiveChartViewController;
  v4 = a3;
  -[HKInteractiveChartViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[HKInteractiveChartViewController traitCollection](self, "traitCollection", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "graphView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resetAndRedraw");

    -[HKInteractiveChartViewController updateCurrentValueViewWithVisibleRange](self, "updateCurrentValueViewWithVisibleRange");
  }
}

- (double)_annotationViewCenterY
{
  _BOOL4 v3;
  double v4;

  v3 = -[HKInteractiveChartViewController _timeScopeEnabled](self, "_timeScopeEnabled");
  v4 = 42.0;
  if (!v3)
    v4 = 0.0;
  return v4 + self->_bannerBottom;
}

- (BOOL)_inPointSelectionMode
{
  return self->_displayState == 1;
}

- (void)_layoutHeader
{
  double v3;
  double v4;
  void *v5;
  double Width;
  void *v7;
  double v8;
  UILabel *selectedSeriesUnitLabel;
  void *v10;
  UILabel **v11;
  uint64_t v12;
  void *v13;
  UILabel *v14;
  void *v15;
  UILabel **p_selectedSeriesLabel;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  double v33;
  double v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  double v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  UILabel *v52;
  _QWORD v53[2];
  UILabel *v54;
  UILabel *selectedSeriesLabel;
  UILabel *v56;
  _QWORD v57[3];
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v57[2] = *MEMORY[0x1E0C80C00];
  -[HKInteractiveChartViewController _effectiveHorizontalMargin](self, "_effectiveHorizontalMargin");
  v4 = v3;
  -[HKInteractiveChartViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  Width = CGRectGetWidth(v58);

  -[HKInteractiveChartViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = CGRectGetWidth(v59);

  if (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", 0) == 1)
  {
    if (-[HKInteractiveChartViewController _selectedDateRangeLabelEnabled](self, "_selectedDateRangeLabelEnabled"))
    {
      selectedSeriesUnitLabel = self->_selectedSeriesUnitLabel;
      v57[0] = self->_selectedPointDateLabel;
      v57[1] = selectedSeriesUnitLabel;
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = (UILabel **)v57;
      v12 = 2;
    }
    else
    {
      v56 = self->_selectedSeriesUnitLabel;
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = &v56;
      v12 = 1;
    }
    objc_msgSend(v10, "arrayWithObjects:count:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    selectedSeriesLabel = self->_selectedSeriesLabel;
    v15 = (void *)MEMORY[0x1E0C99D20];
    p_selectedSeriesLabel = &selectedSeriesLabel;
    goto LABEL_9;
  }
  v54 = self->_selectedSeriesLabel;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[HKInteractiveChartViewController _selectedDateRangeLabelEnabled](self, "_selectedDateRangeLabelEnabled"))
  {
    v52 = self->_selectedSeriesUnitLabel;
    v15 = (void *)MEMORY[0x1E0C99D20];
    p_selectedSeriesLabel = &v52;
LABEL_9:
    v17 = 1;
    goto LABEL_10;
  }
  v14 = self->_selectedSeriesUnitLabel;
  v53[0] = self->_selectedPointDateLabel;
  v53[1] = v14;
  v15 = (void *)MEMORY[0x1E0C99D20];
  p_selectedSeriesLabel = (UILabel **)v53;
  v17 = 2;
LABEL_10:
  objc_msgSend(v15, "arrayWithObjects:count:", p_selectedSeriesLabel, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = Width - v4;
  v20 = 32.0;
  do
  {
    v21 = v20;
    if (v20 >= v8)
      break;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v22 = v13;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v47;
      v26 = 0.0;
      v27 = 0.0;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v47 != v25)
            objc_enumerationMutation(v22);
          v29 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v29, "sizeToFit");
          objc_msgSend(v29, "frame");
          objc_msgSend(v29, "setFrame:");
          objc_msgSend(v29, "sizeToFit");
          objc_msgSend(v29, "frame");
          if (v26 < v33)
            v26 = v33;
          v34 = v4 + CGRectGetWidth(*(CGRect *)&v30);
          if (v27 < v34)
            v27 = v34;
          objc_msgSend(v29, "setFrame:", v4, 0.0, v34 - v4, v21);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v24);
    }
    else
    {
      v26 = 0.0;
      v27 = 0.0;
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v35 = v18;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v43 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          objc_msgSend(v40, "sizeToFit");
          objc_msgSend(v40, "frame");
          v41 = v19 - CGRectGetWidth(v60);
          if (v27 >= v41)
            v41 = v27;
          objc_msgSend(v40, "setFrame:", v41, 0.0, v19 - v41, v21);
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v37);
    }

    v20 = v21 + 32.0;
  }
  while (v26 >= v21);
  self->_bannerBottom = v21;

}

- (void)_omitLayoutHeader
{
  -[UILabel setHidden:](self->_selectedSeriesLabel, "setHidden:", 1);
  -[UILabel setHidden:](self->_selectedSeriesUnitLabel, "setHidden:", 1);
  -[HKUIDateLabel setHidden:](self->_selectedPointDateLabel, "setHidden:", 1);
  self->_bannerBottom = 0.0;
}

- (void)_layoutDividerViews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double Width;
  double v13;
  void *v14;
  id v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  -[UIView frame](self->_primaryGraphViewWrapper, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HKInteractiveChartViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  Width = CGRectGetWidth(v16);

  v13 = HKUIOnePixel();
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  CGRectGetMinY(v17);
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  -[UIView setFrame:](self->_graphTopDividerView, "setFrame:", 0.0, CGRectGetMinY(v18), Width, v13);
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  -[UIView setFrame:](self->_graphBottomDividerView, "setFrame:", 0.0, CGRectGetMaxY(v19) + -25.0, Width, v13);
  -[HKInteractiveChartViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bringSubviewToFront:", self->_graphTopDividerView);

  -[HKInteractiveChartViewController view](self, "view");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bringSubviewToFront:", self->_graphBottomDividerView);

}

- (void)_layoutDashboardEmptyLabelsIfNecessary
{
  void *v3;
  double Width;
  double v5;
  double v6;
  double Height;
  double v8;
  double v9;
  double MinY;
  double v11;
  void *v12;
  double MidX;
  UILabel *dashboardEmptyHeader;
  UILabel *dashboardEmptyDescription;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  if (-[HKInteractiveChartViewController _dashboardEmptyLabelsExist](self, "_dashboardEmptyLabelsExist"))
  {
    -[UILabel sizeToFit](self->_dashboardEmptyHeader, "sizeToFit");
    -[HKInteractiveChartViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    Width = CGRectGetWidth(v16);
    -[HKInteractiveChartViewController _effectiveHorizontalMargin](self, "_effectiveHorizontalMargin");
    v6 = Width + v5 * -2.0;

    -[UILabel setFrame:](self->_dashboardEmptyDescription, "setFrame:", 0.0, 0.0, fmin(v6, 380.0), 1.79769313e308);
    -[UILabel sizeToFit](self->_dashboardEmptyDescription, "sizeToFit");
    -[UILabel frame](self->_dashboardEmptyHeader, "frame");
    Height = CGRectGetHeight(v17);
    -[UILabel frame](self->_dashboardEmptyDescription, "frame");
    v8 = CGRectGetHeight(v18);
    v9 = Height + v8 + 12.0;
    -[UIView frame](self->_graphTopDividerView, "frame");
    MinY = CGRectGetMinY(v19);
    -[UIView frame](self->_graphBottomDividerView, "frame");
    v11 = (MinY + CGRectGetMaxY(v20)) * 0.5;
    -[HKInteractiveChartViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    MidX = CGRectGetMidX(v21);

    -[UILabel setCenter:](self->_dashboardEmptyHeader, "setCenter:", MidX, Height * 0.5 + v11 - v9 * 0.5);
    -[UILabel setCenter:](self->_dashboardEmptyDescription, "setCenter:", MidX, v9 * 0.5 + v11 - v8 * 0.5);
    dashboardEmptyHeader = self->_dashboardEmptyHeader;
    -[UILabel frame](dashboardEmptyHeader, "frame");
    v23 = CGRectIntegral(v22);
    -[UILabel setFrame:](dashboardEmptyHeader, "setFrame:", v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
    dashboardEmptyDescription = self->_dashboardEmptyDescription;
    -[UILabel frame](dashboardEmptyDescription, "frame");
    v25 = CGRectIntegral(v24);
    -[UILabel setFrame:](dashboardEmptyDescription, "setFrame:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
  }
}

+ (id)_timeScopesWithOptions:(unint64_t)a3 timeScopeRanges:(id)a4
{
  int v4;
  id v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  id v14;
  void *v15;
  void *v16;

  v4 = a3;
  v6 = a4;
  if ((v4 & 0x80) != 0)
  {
    v7 = objc_msgSend(a1, "_timeScope:inTimeScopeRanges:", 7, v6);
    if ((v4 & 0x400) != 0)
    {
LABEL_3:
      v8 = 0;
      if ((v4 & 0x8000) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v7 = 0;
    if ((v4 & 0x400) != 0)
      goto LABEL_3;
  }
  v8 = objc_msgSend(a1, "_timeScope:inTimeScopeRanges:", 6, v6);
  if ((v4 & 0x8000) != 0)
  {
LABEL_4:
    v9 = 0;
    if ((v4 & 0x4000) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v9 = objc_msgSend(a1, "_timeScope:inTimeScopeRanges:", 5, v6);
  if ((v4 & 0x4000) != 0)
  {
LABEL_5:
    v10 = 0;
    if ((v4 & 0x200) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v10 = objc_msgSend(a1, "_timeScope:inTimeScopeRanges:", 3, v6);
  if ((v4 & 0x200) != 0)
  {
LABEL_6:
    v11 = 0;
    if ((v4 & 0x100) != 0)
      goto LABEL_7;
LABEL_14:
    v12 = 0;
    if ((v4 & 0x200000) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_13:
  v11 = objc_msgSend(a1, "_timeScope:inTimeScopeRanges:", 2, v6);
  if ((v4 & 0x100) == 0)
    goto LABEL_14;
LABEL_7:
  v12 = objc_msgSend(a1, "_timeScope:inTimeScopeRanges:", 1, v6);
  if ((v4 & 0x200000) != 0)
  {
LABEL_8:
    v13 = objc_msgSend(a1, "_timeScope:inTimeScopeRanges:", 0, v6);
    goto LABEL_16;
  }
LABEL_15:
  v13 = 0;
LABEL_16:
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = v14;
  if (v7)
  {
    objc_msgSend(v14, "addObject:", &unk_1E9CECAD0);
    if (!v8)
    {
LABEL_18:
      if (!v9)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if (!v8)
  {
    goto LABEL_18;
  }
  objc_msgSend(v15, "addObject:", &unk_1E9CECAE8);
  if (v9)
LABEL_19:
    objc_msgSend(v15, "addObject:", &unk_1E9CECB00);
LABEL_20:
  objc_msgSend(v15, "addObject:", &unk_1E9CECB18);
  if (v10)
  {
    objc_msgSend(v15, "addObject:", &unk_1E9CECB30);
    if (!v11)
    {
LABEL_22:
      if (!v12)
        goto LABEL_23;
LABEL_31:
      objc_msgSend(v15, "addObject:", &unk_1E9CECB60);
      if (!v13)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if (!v11)
  {
    goto LABEL_22;
  }
  objc_msgSend(v15, "addObject:", &unk_1E9CECB48);
  if (v12)
    goto LABEL_31;
LABEL_23:
  if (v13)
LABEL_24:
    objc_msgSend(v15, "addObject:", &unk_1E9CECB78);
LABEL_25:
  v16 = (void *)objc_msgSend(v15, "copy");

  return v16;
}

+ (BOOL)_timeScope:(int64_t)a3 inTimeScopeRanges:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  if (!a4)
    return 1;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  objc_msgSend(v5, "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8 != 0;
  return v9;
}

+ (int64_t)_timeScopeForTimeScope:(int64_t)a3 availableTimeScopes:(id)a4
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  int64_t v11;
  void *v12;
  int64_t v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[5];

  v7 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKInteractiveChartViewController.m"), 1153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[availableTimeScopes count] > 0"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v7, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    if (objc_msgSend(v7, "count") == 1)
      goto LABEL_11;
    objc_msgSend(v7, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    if (v13 > a3)
      goto LABEL_11;
    objc_msgSend(v7, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    if (v15 >= a3)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __79__HKInteractiveChartViewController__timeScopeForTimeScope_availableTimeScopes___block_invoke;
      v20[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
      v20[4] = a3;
      objc_msgSend(v7, "hk_firstObjectPassingTest:", v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (!v16)
      {
LABEL_10:

LABEL_11:
        a3 = v11;
        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(v7, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
    }
    v11 = objc_msgSend(v16, "integerValue");
    goto LABEL_10;
  }
LABEL_12:

  return a3;
}

BOOL __79__HKInteractiveChartViewController__timeScopeForTimeScope_availableTimeScopes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "integerValue") < *(_QWORD *)(a1 + 32);
}

- (int64_t)_defaultTimeScopeWithAvailableTimeScopes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int64_t v8;

  v4 = a3;
  -[HKInteractiveChartViewController _singleFixedRange](self, "_singleFixedRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = +[HKGraphZoomLevelConfiguration timeScopeForDateRange:](HKGraphZoomLevelConfiguration, "timeScopeForDateRange:", v5);
  }
  else
  {
    -[HKInteractiveChartViewController selectedTimeScopeController](self, "selectedTimeScopeController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "selectedTimeScope");

  }
  v8 = +[HKInteractiveChartViewController _timeScopeForTimeScope:availableTimeScopes:](HKInteractiveChartViewController, "_timeScopeForTimeScope:availableTimeScopes:", v6, v4);

  return v8;
}

- (BOOL)_selectedSeriesWantsLastRecordedDate
{
  void *v2;
  BOOL v3;

  -[HKInteractiveChartViewController _primaryDisplayType](self, "_primaryDisplayType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayTypeIdentifier") == 95;

  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  HKCurrentTimeView *v5;
  HKCurrentTimeView *currentTimeView;
  void *v7;
  void *v8;
  void *v9;
  UIView *v10;
  UIView *currentValueView;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  UIView *primaryGraphViewWrapper;
  UIView *v17;
  void *v18;
  void *v19;
  unint64_t options;
  void *v21;
  void *v22;
  int64_t v23;
  void *v24;
  HKTimeScopeControl *v25;
  HKTimeScopeControl *radioButtons;
  void *v27;
  void *v28;
  void *v29;
  UIView *v30;
  UIView *graphTopDividerView;
  void *v32;
  UIView *v33;
  UIView *graphBottomDividerView;
  void *v35;
  void *v36;
  HKLollipopController *v37;
  void *v38;
  void *v39;
  HKLollipopController *v40;
  unint64_t v41;
  void *v42;
  HKUIDateLabel *v43;
  HKUIDateLabel *selectedPointDateLabel;
  HKUIDateLabel *v45;
  void *v46;
  HKUIDateLabel *v47;
  void *v48;
  void *v49;
  UILabel *v50;
  UILabel *selectedSeriesLabel;
  UILabel *v52;
  void *v53;
  UILabel *v54;
  void *v55;
  void *v56;
  UILabel *v57;
  UILabel *selectedSeriesUnitLabel;
  UILabel *v59;
  void *v60;
  UILabel *v61;
  void *v62;
  void *v63;
  objc_super v64;

  v64.receiver = self;
  v64.super_class = (Class)HKInteractiveChartViewController;
  -[HKInteractiveChartViewController viewDidLoad](&v64, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = -[HKCurrentTimeView initWithWideHorizontalMargin:]([HKCurrentTimeView alloc], "initWithWideHorizontalMargin:", 0);
  currentTimeView = self->_currentTimeView;
  self->_currentTimeView = v5;

  -[HKCurrentTimeView setDelegate:](self->_currentTimeView, "setDelegate:", self);
  -[HKInteractiveChartViewController _singleFixedRange](self, "_singleFixedRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentTimeView setDisableControls:](self->_currentTimeView, "setDisableControls:", v7 != 0);

  -[HKCurrentTimeView setOmitPrevNextButtons:](self->_currentTimeView, "setOmitPrevNextButtons:", 1);
  -[HKInteractiveChartViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_currentTimeView);

  -[HKInteractiveChartViewController currentValueViewHandler](self, "currentValueViewHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "makeCurrentValueView");
  v10 = (UIView *)objc_claimAutoreleasedReturnValue();
  currentValueView = self->_currentValueView;
  self->_currentValueView = v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartAccessibilityIdentifier:", CFSTR("ValueView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setAccessibilityIdentifier:](self->_currentValueView, "setAccessibilityIdentifier:", v12);

  -[HKInteractiveChartViewController currentValueViewHandler](self, "currentValueViewHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCurrentValueViewCallbacks:", self);

  -[HKInteractiveChartViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", self->_currentValueView);

  v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  primaryGraphViewWrapper = self->_primaryGraphViewWrapper;
  self->_primaryGraphViewWrapper = v15;

  -[UIView setClipsToBounds:](self->_primaryGraphViewWrapper, "setClipsToBounds:", 1);
  v17 = self->_primaryGraphViewWrapper;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

  -[HKInteractiveChartViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", self->_primaryGraphViewWrapper);

  -[HKInteractiveChartViewController _configureInitialLollipopSelection](self, "_configureInitialLollipopSelection");
  options = self->_options;
  -[HKInteractiveChartViewController timeScopeRanges](self, "timeScopeRanges");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKInteractiveChartViewController _timeScopesWithOptions:timeScopeRanges:](HKInteractiveChartViewController, "_timeScopesWithOptions:timeScopeRanges:", options, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKInteractiveChartViewController _chartHasDateAxis](self, "_chartHasDateAxis"))
  {
    v23 = -[HKInteractiveChartViewController _defaultTimeScopeWithAvailableTimeScopes:](self, "_defaultTimeScopeWithAvailableTimeScopes:", v22);
    -[HKInteractiveChartViewController initialXValue](self, "initialXValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController _replacePrimaryGraphViewControllerWithTimeScope:anchorDate:animated:](self, "_replacePrimaryGraphViewControllerWithTimeScope:anchorDate:animated:", v23, v24, 0);

  }
  else
  {
    -[HKInteractiveChartViewController _replacePrimaryGraphViewControllerWithScalarController](self, "_replacePrimaryGraphViewControllerWithScalarController");
  }
  -[HKInteractiveChartViewController _handleInitialLollipopSelection](self, "_handleInitialLollipopSelection");
  +[HKTimeScopeControl controlWithFrame:timeScopes:](HKTimeScopeControl, "controlWithFrame:timeScopes:", v22, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v25 = (HKTimeScopeControl *)objc_claimAutoreleasedReturnValue();
  radioButtons = self->_radioButtons;
  self->_radioButtons = v25;

  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartAccessibilityIdentifier:", CFSTR("TimeScopes"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTimeScopeControl setAccessibilityIdentifier:](self->_radioButtons, "setAccessibilityIdentifier:", v27);

  -[HKTimeScopeControl addTarget:action:forControlEvents:](self->_radioButtons, "addTarget:action:forControlEvents:", self, sel__radioButtonsDidUpdate_, 4096);
  -[HKInteractiveChartViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", self->_radioButtons);

  -[HKTimeScopeControl setSelectedTimeScope:](self->_radioButtons, "setSelectedTimeScope:", -[HKInteractiveChartViewController _dateZoom](self, "_dateZoom"));
  if (!-[HKInteractiveChartViewController _chartHasDateAxis](self, "_chartHasDateAxis"))
    -[HKInteractiveChartViewController _hideTimeDateControls](self, "_hideTimeDateControls");
  objc_msgSend(MEMORY[0x1E0DC3658], "tableSeparatorColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  graphTopDividerView = self->_graphTopDividerView;
  self->_graphTopDividerView = v30;

  -[UIView setBackgroundColor:](self->_graphTopDividerView, "setBackgroundColor:", v29);
  -[HKInteractiveChartViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addSubview:", self->_graphTopDividerView);

  v33 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  graphBottomDividerView = self->_graphBottomDividerView;
  self->_graphBottomDividerView = v33;

  -[UIView setBackgroundColor:](self->_graphBottomDividerView, "setBackgroundColor:", v29);
  -[HKInteractiveChartViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addSubview:", self->_graphBottomDividerView);

  -[HKInteractiveChartViewController makeAnnotationDataSource](self, "makeAnnotationDataSource");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController setAnnotationDataSource:](self, "setAnnotationDataSource:", v36);

  -[HKInteractiveChartViewController setLegendBottomLocation:](self, "setLegendBottomLocation:", 0.0);
  v37 = [HKLollipopController alloc];
  -[HKInteractiveChartViewController annotationDataSource](self, "annotationDataSource");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[HKLollipopController initWithAnnotationDataSource:parentView:delegate:](v37, "initWithAnnotationDataSource:parentView:delegate:", v38, v39, self);
  -[HKInteractiveChartViewController setLollipopController:](self, "setLollipopController:", v40);

  v41 = (self->_options >> 12) & 1;
  -[HKInteractiveChartViewController lollipopController](self, "lollipopController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setCenterLollipopVertically:", v41);

  v43 = objc_alloc_init(HKUIDateLabel);
  selectedPointDateLabel = self->_selectedPointDateLabel;
  self->_selectedPointDateLabel = v43;

  v45 = self->_selectedPointDateLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUIDateLabel setTextColor:](v45, "setTextColor:", v46);

  v47 = self->_selectedPointDateLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 20.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUIDateLabel setFont:](v47, "setFont:", v48);

  -[HKUIDateLabel setUseUppercase:](self->_selectedPointDateLabel, "setUseUppercase:", 0);
  -[HKUIDateLabel setAdjustsFontSizeToFitWidth:](self->_selectedPointDateLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[HKUIDateLabel setTextAlignment:](self->_selectedPointDateLabel, "setTextAlignment:", 2);
  -[HKUIDateLabel setAlpha:](self->_selectedPointDateLabel, "setAlpha:", 0.0);
  -[HKInteractiveChartViewController view](self, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addSubview:", self->_selectedPointDateLabel);

  v50 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  selectedSeriesLabel = self->_selectedSeriesLabel;
  self->_selectedSeriesLabel = v50;

  v52 = self->_selectedSeriesLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v52, "setTextColor:", v53);

  v54 = self->_selectedSeriesLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 20.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v54, "setFont:", v55);

  -[UILabel setNumberOfLines:](self->_selectedSeriesLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_selectedSeriesLabel, "setTextAlignment:", 0);
  -[HKInteractiveChartViewController view](self, "view");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addSubview:", self->_selectedSeriesLabel);

  v57 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  selectedSeriesUnitLabel = self->_selectedSeriesUnitLabel;
  self->_selectedSeriesUnitLabel = v57;

  v59 = self->_selectedSeriesUnitLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v59, "setTextColor:", v60);

  v61 = self->_selectedSeriesUnitLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 20.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v61, "setFont:", v62);

  -[UILabel setAdjustsFontSizeToFitWidth:](self->_selectedSeriesUnitLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[HKInteractiveChartViewController view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addSubview:", self->_selectedSeriesUnitLabel);

  -[HKInteractiveChartViewController _updateSelectedSeriesLabel:](self, "_updateSelectedSeriesLabel:", 0);
  self->_bannerBottom = 32.0;
  -[HKInteractiveChartViewController _showHideNoGraphSeriesLabels](self, "_showHideNoGraphSeriesLabels");

}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v4;
  void *v5;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKInteractiveChartViewController;
  -[HKInteractiveChartViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  v4 = -[UIViewController hk_viewIsHidden](self, "hk_viewIsHidden");
  -[HKInteractiveChartViewController restorationUserActivity](self, "restorationUserActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!v4)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__HKInteractiveChartViewController_viewDidAppear___block_invoke;
      block[3] = &unk_1E9C3F0D0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

void __50__HKInteractiveChartViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "restorationUserActivity");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "restoreUserActivityState:", v2);

}

- (id)_singleFixedRange
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _OWORD v12[4];
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HKInteractiveChartViewController timeScopeRanges](self, "timeScopeRanges");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[HKInteractiveChartViewController timeScopeRanges](self, "timeScopeRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 != 1)
    return 0;
  memset(v12, 0, sizeof(v12));
  -[HKInteractiveChartViewController timeScopeRanges](self, "timeScopeRanges", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", v12, v13, 16))
  {
    v8 = **((_QWORD **)&v12[0] + 1);
    -[HKInteractiveChartViewController timeScopeRanges](self, "timeScopeRanges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)fixedRangeForTimeScope:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HKInteractiveChartViewController timeScopeRanges](self, "timeScopeRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HKInteractiveChartViewController timeScopeRanges](self, "timeScopeRanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)visibleRangeForTimeScope:(int64_t)a3 proposedRange:(id)a4
{
  return a4;
}

- (BOOL)_valueRange:(id)a3 fitsInsideValueRange:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "minValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  objc_msgSend(v6, "maxValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "maxValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v10, "compare:", v11);
  return v9 != 1 && v12 != 1;
}

- (void)_setGraphViewAxisAndVisibleDateRangeForTimeScope:(int64_t)a3 anchorDate:(id)a4 preserveScrollPosition:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  int64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;

  v5 = a5;
  v8 = a4;
  -[HKGraphViewController graphView](self->_primaryGraphViewController, "graphView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController fixedRangeForTimeScope:](self, "fixedRangeForTimeScope:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v38 = v8;
    -[HKInteractiveChartViewController currentCalendar](self, "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "firstWeekday");

    -[HKInteractiveChartViewController _defaultAxisRangeIncludeToday:](self, "_defaultAxisRangeIncludeToday:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HKInteractiveChartViewController defaultAlignmentForTimeScope:](self, "defaultAlignmentForTimeScope:", a3);
    -[HKInteractiveChartViewController currentCalendar](self, "currentCalendar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v16;
    +[HKGraphZoomLevelConfiguration chartDataRangeForTimeScope:dataRange:firstWeekday:calendar:cadence:alignment:](HKGraphZoomLevelConfiguration, "chartDataRangeForTimeScope:dataRange:firstWeekday:calendar:cadence:alignment:", a3, v16, v15, v18, 0, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v9, "effectiveVisibleRangeCadence");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "effectiveVisibleRangeActive");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "minValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "minValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "compare:", v20);

      if (v21 == -1)
      {
        objc_msgSend(v12, "minValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "maxValue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v22, v23);
        v24 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v24;
      }
      objc_msgSend(v12, "maxValue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "maxValue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "compare:", v26);

      if (v27 != 1)
      {
        v8 = v38;
        goto LABEL_20;
      }
      objc_msgSend(v13, "minValue");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "maxValue");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v28, v29);
      v30 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v30;
      v8 = v38;
    }
    else
    {
      if (self->_hasInitialDateRangeAndTimeScope)
      {
        v31 = v38;
        if ((self->_options & 0x100000) != 0)
          v17 = 3;
      }
      else
      {
        v31 = v38;
      }
      -[HKInteractiveChartViewController currentCalendar](self, "currentCalendar");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKGraphZoomLevelConfiguration chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:](HKGraphZoomLevelConfiguration, "chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:", a3, v31, v17, v13, v32, v15, 0, 0);
      v28 = (id)objc_claimAutoreleasedReturnValue();

      -[HKInteractiveChartViewController visibleRangeForTimeScope:proposedRange:](self, "visibleRangeForTimeScope:proposedRange:", a3, v28);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      if (-[HKInteractiveChartViewController _acceptSubclassRange:proposedRange:axisRange:](self, "_acceptSubclassRange:proposedRange:axisRange:", v29, v28, v13))
      {
        v29 = v29;
        v11 = v29;
        v12 = v29;
      }
      else
      {
        v28 = v28;
        -[HKInteractiveChartViewController currentCalendar](self, "currentCalendar");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v17;
        v35 = (void *)v33;
        +[HKGraphZoomLevelConfiguration chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:](HKGraphZoomLevelConfiguration, "chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:", a3, v38, v34, v13, v33, v15, 1, 0);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        v12 = v28;
      }
      v8 = v38;
      v16 = v37;
    }

LABEL_20:
    if (!v13)
      goto LABEL_26;
    goto LABEL_21;
  }
  -[HKInteractiveChartViewController _graphViewAxisAndVisibleDateRangeForTimeScope:fixedRange:](self, "_graphViewAxisAndVisibleDateRangeForTimeScope:fixedRange:", a3, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v11;
  if (!v11)
    goto LABEL_26;
LABEL_21:
  if (v12 && v11)
  {
    _HKInitializeLogging();
    v36 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_DEBUG))
      -[HKInteractiveChartViewController _setGraphViewAxisAndVisibleDateRangeForTimeScope:anchorDate:preserveScrollPosition:].cold.1((uint64_t)self, (uint64_t)v13, v36);
    objc_msgSend(v9, "setContentWidthFromTimeScope:", v10 == 0);
    objc_msgSend(v9, "setEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:", v13, v12, v11);
  }
LABEL_26:

}

- (BOOL)_acceptSubclassRange:(id)a3 proposedRange:(id)a4 axisRange:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "hk_isAfterOrEqualToDate:", v12)
    && objc_msgSend(v11, "hk_isBeforeOrEqualToDate:", v13))
  {
    objc_msgSend(v7, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = !objc_msgSend(v10, "isEqualToDate:", v14) || (objc_msgSend(v11, "isEqualToDate:", v15) & 1) == 0;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_graphViewAxisAndVisibleDateRangeForTimeScope:(int64_t)a3 fixedRange:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v5 = a4;
  +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "canonicalSize");
  v8 = v7;
  if (a3 != 4)
    goto LABEL_7;
  v9 = v7 - (double)(unint64_t)(3 * *MEMORY[0x1E0CB4788]);
  objc_msgSend(v5, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;
  objc_msgSend(v5, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v15 = v12 - v14;

  if (v15 < v9 || v15 > v8)
  {
LABEL_7:
    objc_msgSend(v5, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIMidDate(v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dateByAddingTimeInterval:", -(v8 * 0.5));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dateByAddingTimeInterval:", v8 * 0.5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v20, v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = v5;
  }

  return v22;
}

- (BOOL)_visibleRangeIsNowForTimeScope:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  -[HKGraphViewController graphView](self->_primaryGraphViewController, "graphView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectiveVisibleRangeCadence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HKInteractiveChartViewController currentCalendar](self, "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "firstWeekday");

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectiveAxisRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController currentCalendar](self, "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKGraphZoomLevelConfiguration chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:](HKGraphZoomLevelConfiguration, "chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:", a3, v9, 3, v10, v11, v8, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "effectiveVisibleRangeCadence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (id)makeAnchorDateFromPreviousAnchorDate:(id)a3 previousEffectiveVisibleRange:(id)a4 previousTimeScope:(int64_t)a5 currentTimeScope:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;

  v11 = a3;
  v12 = a4;
  v13 = v11;
  -[HKInteractiveChartViewController lollipopController](self, "lollipopController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstLollipopDateSinceDelta:", 0.25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartViewController _dateForMostRecentData](self, "_dateForMostRecentData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController _singleFixedRange](self, "_singleFixedRange");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIMidDate(v19, v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    goto LABEL_7;
  }
  if (v15)
  {
    v21 = v15;

    if ((unint64_t)a6 >= 6)
    {
      if (a6 != 8)
        goto LABEL_7;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKInteractiveChartViewController.m"), 1554, CFSTR("Invalid zoom specified (%ld)"), 8);
    }
    else
    {
      __138__HKInteractiveChartViewController_makeAnchorDateFromPreviousAnchorDate_previousEffectiveVisibleRange_previousTimeScope_currentTimeScope___block_invoke(v22, v21, a6);
      v19 = v21;
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_6;
  }
  v21 = v13;
  if (!-[HKInteractiveChartViewController _visibleRangeIsNowForTimeScope:](self, "_visibleRangeIsNowForTimeScope:", a5))
  {
    objc_msgSend(v12, "endDate");
    v21 = (id)objc_claimAutoreleasedReturnValue();

    if (a5 <= a6 && (a6 & 0xFFFFFFFFFFFFFFFELL) == 6)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "startOfDayForDate:", v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToDate:", v21);

      if (v28)
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "dateByAddingUnit:value:toDate:options:", 16, -1, v21, 0);
        v30 = objc_claimAutoreleasedReturnValue();

        v21 = (id)v30;
      }
    }
    if (a6 == 7)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "startOfDayForDate:", v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "dateByAddingUnit:value:toDate:options:", 16, 1, v19, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      HKUIMidDate(v19, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (HKUIObjectIsLargerOrEqual(v16, (uint64_t)v19) && HKUIObjectIsSmaller(v16, (uint64_t)v33))
      {
        objc_msgSend(v34, "laterDate:", v16);
        v35 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v35 = v34;
      }
      v36 = v35;

      v21 = v36;
      goto LABEL_6;
    }
  }
LABEL_7:
  if ((objc_msgSend(v21, "hk_isAfterDate:", v16) & 1) != 0 || !v21)
  {
    v23 = v16;

    v21 = v23;
  }
  v24 = v21;

  return v24;
}

id __138__HKInteractiveChartViewController_makeAnchorDateFromPreviousAnchorDate_previousEffectiveVisibleRange_previousTimeScope_currentTimeScope___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v4 = a2;
  +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "approximateSeriesPointIntervalAtResolution:", 0);
  v7 = v6;
  objc_msgSend(v5, "canonicalSize");
  objc_msgSend(v4, "dateByAddingTimeInterval:", (v8 - v7) * 0.5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)updatePrimaryGraphViewController
{
  if (-[HKInteractiveChartViewController _chartHasDateAxis](self, "_chartHasDateAxis"))
    -[HKInteractiveChartViewController _replacePrimaryGraphViewControllerWithTimeScope:anchorDate:animated:](self, "_replacePrimaryGraphViewControllerWithTimeScope:anchorDate:animated:", -[HKTimeScopeControl selectedTimeScope](self->_radioButtons, "selectedTimeScope"), 0, 0);
  else
    -[HKInteractiveChartViewController _replacePrimaryGraphViewControllerWithScalarController](self, "_replacePrimaryGraphViewControllerWithScalarController");
}

- (void)_replacePrimaryGraphViewControllerWithTimeScope:(int64_t)a3 anchorDate:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  HKGraphViewController *primaryGraphViewController;
  id v9;
  int64_t v10;
  CGFloat v11;
  HKGraphViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  HKGraphViewController *v30;
  HKGraphViewController *v31;
  void *v32;
  UIView *primaryGraphViewWrapper;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  HKGraphViewController *v46;
  void (**v47)(void *, uint64_t);
  HKGraphViewController *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t);
  void *v54;
  HKInteractiveChartViewController *v55;
  HKGraphViewController *v56;
  CGAffineTransform v57;
  uint64_t aBlock;
  uint64_t v59;
  void *(*v60)(uint64_t, int);
  void *v61;
  HKGraphViewController *v62;
  HKInteractiveChartViewController *v63;
  CGAffineTransform v64;
  CGAffineTransform v65;
  CGAffineTransform v66;

  v5 = a5;
  primaryGraphViewController = self->_primaryGraphViewController;
  v9 = a4;
  v10 = -[HKGraphViewController dateZoom](primaryGraphViewController, "dateZoom");
  memset(&v66, 0, sizeof(v66));
  if (v10 >= a3)
  {
    CGAffineTransformMakeScale(&v66, 0.899999999, 1.0);
    v11 = 1.1;
  }
  else
  {
    CGAffineTransformMakeScale(&v66, 1.1, 1.0);
    v11 = 0.899999999;
  }
  memset(&v65, 0, sizeof(v65));
  CGAffineTransformMakeScale(&v65, v11, 1.0);
  v12 = self->_primaryGraphViewController;
  -[HKGraphViewController graphView](v12, "graphView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "effectiveVisibleRangeActive");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartViewController makeAnchorDateFromPreviousAnchorDate:previousEffectiveVisibleRange:previousTimeScope:currentTimeScope:](self, "makeAnchorDateFromPreviousAnchorDate:previousEffectiveVisibleRange:previousTimeScope:currentTimeScope:", v9, v14, v10, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKGraphViewController graphView](v12, "graphView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeSeries");

  -[HKGraphViewController view](v12, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  -[HKGraphViewController graphView](v12, "graphView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "xAxisSpace");
  v28 = v27;

  -[HKInteractiveChartViewController currentCalendar](self, "currentCalendar");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController makePrimaryGraphViewControllerWithDateZoom:previousDateZoom:previousXAxisSpace:currentCalendar:](self, "makePrimaryGraphViewControllerWithDateZoom:previousDateZoom:previousXAxisSpace:currentCalendar:", a3, v10, v29, v28);
  v30 = (HKGraphViewController *)objc_claimAutoreleasedReturnValue();
  v31 = self->_primaryGraphViewController;
  self->_primaryGraphViewController = v30;

  -[HKInteractiveChartViewController primaryGraphViewControllerDidInitialize:](self, "primaryGraphViewControllerDidInitialize:", self->_primaryGraphViewController);
  -[HKGraphViewController setGraphViewDelegateProxy:](self->_primaryGraphViewController, "setGraphViewDelegateProxy:", self);
  -[HKGraphViewController view](self->_primaryGraphViewController, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v19, v21, v23, v25);

  -[HKInteractiveChartViewController addChildViewController:](self, "addChildViewController:", self->_primaryGraphViewController);
  primaryGraphViewWrapper = self->_primaryGraphViewWrapper;
  -[HKGraphViewController view](self->_primaryGraphViewController, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](primaryGraphViewWrapper, "addSubview:", v34);

  -[HKGraphViewController didMoveToParentViewController:](self->_primaryGraphViewController, "didMoveToParentViewController:", self);
  -[HKGraphViewController view](self->_primaryGraphViewController, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAlpha:", 0.0);

  -[HKGraphViewController view](self->_primaryGraphViewController, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v65;
  objc_msgSend(v36, "setTransform:", &v64);

  -[HKGraphViewController view](self->_primaryGraphViewController, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "backgroundColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setBackgroundColor:", v39);

  -[HKInteractiveChartViewController _configureSelectedRangeFormatterWithChartRangeProvider](self, "_configureSelectedRangeFormatterWithChartRangeProvider");
  -[HKGraphViewController graphView](self->_primaryGraphViewController, "graphView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "backgroundColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTopMarginColor:", v42);

  objc_msgSend(v40, "setTilingDisabled:", -[HKInteractiveChartViewController _tilingDisabled](self, "_tilingDisabled"));
  objc_msgSend(v40, "setPrefersOpaqueLegends:", -[HKInteractiveChartViewController _prefersOpaqueLegends](self, "_prefersOpaqueLegends"));
  objc_msgSend(v40, "setDrawsGridlinesPerSeriesGroup:", -[HKInteractiveChartViewController _drawsGridlinesPerSeriesGroup](self, "_drawsGridlinesPerSeriesGroup"));
  -[HKInteractiveChartViewController _setGraphViewAxisAndVisibleDateRangeForTimeScope:anchorDate:preserveScrollPosition:](self, "_setGraphViewAxisAndVisibleDateRangeForTimeScope:anchorDate:preserveScrollPosition:", a3, v15, 0);
  -[HKInteractiveChartViewController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setNeedsLayout");

  -[HKInteractiveChartViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "layoutSubviews");

  v45 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v59 = 3221225472;
  v60 = __104__HKInteractiveChartViewController__replacePrimaryGraphViewControllerWithTimeScope_anchorDate_animated___block_invoke;
  v61 = &unk_1E9C44398;
  v46 = v12;
  v62 = v46;
  v63 = self;
  v47 = (void (**)(void *, uint64_t))_Block_copy(&aBlock);
  v51 = v45;
  v52 = 3221225472;
  v53 = __104__HKInteractiveChartViewController__replacePrimaryGraphViewControllerWithTimeScope_anchorDate_animated___block_invoke_2;
  v54 = &unk_1E9C443C0;
  v55 = self;
  v56 = v46;
  v57 = v66;
  v48 = v46;
  v49 = _Block_copy(&v51);
  v50 = v49;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v49, v47, 0.25, v51, v52, v53, v54, v55, v56, *(_OWORD *)&v57.a, *(_OWORD *)&v57.c, *(_OWORD *)&v57.tx, aBlock, v59, v60, v61);
  }
  else
  {
    (*((void (**)(void *))v49 + 2))(v49);
    v47[2](v47, 1);
  }

}

void *__104__HKInteractiveChartViewController__replacePrimaryGraphViewControllerWithTimeScope_anchorDate_animated___block_invoke(uint64_t a1, int a2)
{
  void *result;
  void *v5;

  result = *(void **)(a1 + 32);
  if (result)
  {
    objc_msgSend(result, "willMoveToParentViewController:", 0);
    objc_msgSend(*(id *)(a1 + 32), "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    result = (void *)objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  }
  if (a2)
    return (void *)objc_msgSend(*(id *)(a1 + 40), "_automaticAutoScale");
  return result;
}

void __104__HKInteractiveChartViewController__replacePrimaryGraphViewControllerWithTimeScope_anchorDate_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8 = *MEMORY[0x1E0C9BAA8];
  v9 = v4;
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", &v8);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 48);
  v9 = v7;
  v10 = *(_OWORD *)(a1 + 80);
  objc_msgSend(v6, "setTransform:", &v8);

}

- (void)_replacePrimaryGraphViewControllerWithScalarController
{
  HKScalarGraphViewController *v3;
  HKGraphViewController *primaryGraphViewController;
  UIView *primaryGraphViewWrapper;
  void *v6;

  v3 = -[HKScalarGraphViewController initWithMinimumHeight:]([HKScalarGraphViewController alloc], "initWithMinimumHeight:", 10.0);
  primaryGraphViewController = self->_primaryGraphViewController;
  self->_primaryGraphViewController = &v3->super;

  -[HKGraphViewController setGraphViewDelegateProxy:](self->_primaryGraphViewController, "setGraphViewDelegateProxy:", self);
  primaryGraphViewWrapper = self->_primaryGraphViewWrapper;
  -[HKGraphViewController view](self->_primaryGraphViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](primaryGraphViewWrapper, "addSubview:", v6);

  -[HKInteractiveChartViewController addChildViewController:](self, "addChildViewController:", self->_primaryGraphViewController);
  -[HKGraphViewController didMoveToParentViewController:](self->_primaryGraphViewController, "didMoveToParentViewController:", self);
  -[HKInteractiveChartViewController _configureSelectedRangeFormatterWithChartRangeProvider](self, "_configureSelectedRangeFormatterWithChartRangeProvider");
}

- (void)_configureSelectedRangeFormatterWithChartRangeProvider
{
  void *v3;
  void *v4;
  id v5;

  -[HKInteractiveChartViewController selectedRangeFormatter](self, "selectedRangeFormatter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "graphView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureWithChartRangeProvider:", v4);

}

- (void)_handleVisibleRangeChange
{
  -[HKInteractiveChartViewController _setDateSelectorToVisibleRange](self, "_setDateSelectorToVisibleRange");
  -[HKInteractiveChartViewController updateCurrentValueViewWithVisibleRange](self, "updateCurrentValueViewWithVisibleRange");
}

- (void)_configureInitialLollipopSelection
{
  void *v3;
  unint64_t options;
  void *v5;
  id v6;

  -[HKInteractiveChartViewController _primaryDisplayType](self, "_primaryDisplayType");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chartingRules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  options = self->_options;
  if (objc_msgSend(v3, "shouldShowInitialLollipop") && (options & 0x2000) == 0)
  {
    -[HKInteractiveChartViewController _dateForMostRecentData](self, "_dateForMostRecentData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController initialXValue](self, "initialXValue");

    if (v5)
      -[HKInteractiveChartViewController setDisableCurrentValueViewForInitialLollipop:](self, "setDisableCurrentValueViewForInitialLollipop:", 1);

  }
}

- (void)_handleInitialLollipopSelection
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  -[HKGraphViewController graphView](self->_primaryGraphViewController, "graphView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v10 = v3;
    v4 = -[HKInteractiveChartViewController disableCurrentValueViewForInitialLollipop](self, "disableCurrentValueViewForInitialLollipop");
    v3 = v10;
    if (v4)
    {
      -[HKInteractiveChartViewController _dateForMostRecentData](self, "_dateForMostRecentData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKInteractiveChartViewController initialXValue](self, "initialXValue");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v6)
        v8 = (void *)v6;
      else
        v8 = v5;
      v9 = v8;

      if (-[HKInteractiveChartViewController _shouldHandleInitialLollipopTouchDate:mostRecentDataDate:forGraphView:](self, "_shouldHandleInitialLollipopTouchDate:mostRecentDataDate:forGraphView:", v9, v5, v10))
      {
        objc_msgSend(v10, "touchSelectionAtModelX:", v9);
      }
      else
      {
        -[HKInteractiveChartViewController graphViewExternalSelectionEnd:](self, "graphViewExternalSelectionEnd:", v10);
      }

      v3 = v10;
    }
  }

}

- (BOOL)_shouldHandleInitialLollipopTouchDate:(id)a3 mostRecentDataDate:(id)a4 forGraphView:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7)
  {
    v11 = objc_msgSend(v9, "xAxisDateZoom");
    if (v11 == 8)
    {
      v12 = 1;
    }
    else
    {
      v13 = v11;
      +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v10, "resolutionFromTraitCollectionAttributes");
      objc_msgSend(v10, "primarySeries");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "resolutionForTimeScope:traitResolution:", v13, v15);

      objc_msgSend(v14, "approximateSeriesPointIntervalAtResolution:", v17);
      objc_msgSend(v8, "dateByAddingTimeInterval:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v7, "hk_isBeforeOrEqualToDate:", v18);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)installGraphViewSnapshot
{
  UIView *primaryGraphViewSnapshot;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  id v7;

  primaryGraphViewSnapshot = self->_primaryGraphViewSnapshot;
  if (primaryGraphViewSnapshot)
  {
    -[UIView removeFromSuperview](primaryGraphViewSnapshot, "removeFromSuperview");
    v4 = self->_primaryGraphViewSnapshot;
    self->_primaryGraphViewSnapshot = 0;

  }
  -[UIView snapshotViewAfterScreenUpdates:](self->_primaryGraphViewWrapper, "snapshotViewAfterScreenUpdates:", 0);
  v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  v6 = self->_primaryGraphViewSnapshot;
  self->_primaryGraphViewSnapshot = v5;

  -[UIView frame](self->_primaryGraphViewWrapper, "frame");
  -[UIView setFrame:](self->_primaryGraphViewSnapshot, "setFrame:");
  -[HKInteractiveChartViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertSubview:aboveSubview:", self->_primaryGraphViewSnapshot, self->_primaryGraphViewWrapper);

}

- (void)removeGraphViewSnapshotAnimated:(BOOL)a3
{
  UIView *primaryGraphViewSnapshot;
  UIView *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  primaryGraphViewSnapshot = self->_primaryGraphViewSnapshot;
  if (primaryGraphViewSnapshot)
  {
    if (a3)
    {
      v6[4] = self;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __68__HKInteractiveChartViewController_removeGraphViewSnapshotAnimated___block_invoke;
      v7[3] = &unk_1E9C3F0D0;
      v7[4] = self;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __68__HKInteractiveChartViewController_removeGraphViewSnapshotAnimated___block_invoke_2;
      v6[3] = &unk_1E9C42160;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v7, v6, 0.12);
    }
    else
    {
      -[UIView removeFromSuperview](primaryGraphViewSnapshot, "removeFromSuperview");
      v5 = self->_primaryGraphViewSnapshot;
      self->_primaryGraphViewSnapshot = 0;

    }
  }
}

uint64_t __68__HKInteractiveChartViewController_removeGraphViewSnapshotAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "setAlpha:", 0.0);
}

void __68__HKInteractiveChartViewController_removeGraphViewSnapshotAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1120);
  *(_QWORD *)(v2 + 1120) = 0;

}

- (void)_unitPreferencesDidUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  HKInteractiveChartViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__HKInteractiveChartViewController__unitPreferencesDidUpdate___block_invoke;
  v6[3] = &unk_1E9C3FC50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __62__HKInteractiveChartViewController__unitPreferencesDidUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HKUnitPreferenceControllerUnitPreferenceChangedKey"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "unitPreferencesWillUpdate:", v4);
  objc_msgSend(*(id *)(a1 + 40), "_updateAxisScalingRulesForUnitPreferenceChangesOfTypes:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1112), "graphView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateDataSourceCaches");
  objc_msgSend(*(id *)(a1 + 40), "_automaticAutoScale");
  objc_msgSend(*(id *)(a1 + 40), "_handleVisibleRangeChange");

}

- (void)_updateAxisScalingRulesForUnitPreferenceChangesOfTypes:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t options;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSArray *obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  HKInteractiveChartViewController *v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = self->_allGraphSeriesConfigurationManagers;
  v31 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v50;
    v33 = self;
    v34 = v4;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v50 != v30)
          objc_enumerationMutation(obj);
        v32 = v5;
        v6 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v5);
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        objc_msgSend(v6, "allDisplayTypes");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v46;
          v35 = *(_QWORD *)v46;
          v36 = v7;
          do
          {
            v11 = 0;
            v37 = v9;
            do
            {
              if (*(_QWORD *)v46 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v11);
              objc_msgSend(v12, "objectType");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "containsObject:", v13))
              {
                v14 = v4;
                v39 = v13;
                -[HKInteractiveChartViewController unitPreferenceController](self, "unitPreferenceController");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "unitForChartingDisplayType:", v12);
                v16 = objc_claimAutoreleasedReturnValue();

                v40 = (void *)v16;
                if (v16)
                {
                  v38 = v11;
                  v43 = 0u;
                  v44 = 0u;
                  v41 = 0u;
                  v42 = 0u;
                  options = self->_options;
                  -[HKInteractiveChartViewController timeScopeRanges](self, "timeScopeRanges");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  +[HKInteractiveChartViewController _timeScopesWithOptions:timeScopeRanges:](HKInteractiveChartViewController, "_timeScopesWithOptions:timeScopeRanges:", options, v18);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();

                  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
                  if (v20)
                  {
                    v21 = v20;
                    v22 = *(_QWORD *)v42;
                    do
                    {
                      for (i = 0; i != v21; ++i)
                      {
                        if (*(_QWORD *)v42 != v22)
                          objc_enumerationMutation(v19);
                        objc_msgSend(v6, "configurationForDisplayType:zoom:", v12, objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "integerValue"));
                        v24 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v24, "graphSeries");
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v25, "yAxis");
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v26, "invalidateAxisLabelCache");

                        objc_msgSend(v24, "graphSeries");
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v27, "axisScalingRule");
                        v28 = (void *)objc_claimAutoreleasedReturnValue();

                        if (objc_msgSend(v28, "conformsToProtocol:", &unk_1F0205840)
                          && (objc_opt_respondsToSelector() & 1) != 0)
                        {
                          objc_msgSend(v28, "setUnit:", v40);
                        }

                      }
                      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
                    }
                    while (v21);
                  }

                  self = v33;
                  v14 = v34;
                  v10 = v35;
                  v7 = v36;
                  v9 = v37;
                  v11 = v38;
                }

                v13 = v39;
                v4 = v14;
              }

              ++v11;
            }
            while (v11 != v9);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          }
          while (v9);
        }

        v5 = v32 + 1;
      }
      while (v32 + 1 != v31);
      v31 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v31);
  }

}

- (id)makePrimaryGraphViewControllerWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6
{
  id v9;
  HKDateGraphViewController *v10;

  v9 = a6;
  v10 = -[HKDateGraphViewController initWithDateZoom:previousDateZoom:previousXAxisSpace:currentCalendar:]([HKDateGraphViewController alloc], "initWithDateZoom:previousDateZoom:previousXAxisSpace:currentCalendar:", a3, a4, v9, a5);

  return v10;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (id)_displayNameForDisplayType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if ((self->_options & 1) != 0)
  {
LABEL_6:
    v7 = &stru_1E9C4C428;
    goto LABEL_7;
  }
  objc_msgSend(v4, "localization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v5, "localization");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayNameKey");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_FAULT))
        -[HKInteractiveChartViewController _displayNameForDisplayType:].cold.1();
      goto LABEL_6;
    }
  }
LABEL_7:

  return v7;
}

- (id)_displayUnitForDisplayType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HKInteractiveChartViewController unitPreferenceController](self, "unitPreferenceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unitNameForValue:unitPreferenceController:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_allDisplayTypes
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_allGraphSeriesConfigurationManagers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "allDisplayTypes", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_updateSelectedSeriesLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  UILabel *selectedSeriesLabel;
  void *v21;
  UILabel *selectedSeriesUnitLabel;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[HKInteractiveChartViewController _displayNameForDisplayType:](self, "_displayNameForDisplayType:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController _colorForDisplayType:](self, "_colorForDisplayType:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController _displayUnitForDisplayType:](self, "_displayUnitForDisplayType:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKInteractiveChartViewController _allDisplayTypes](self, "_allDisplayTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v8;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          -[HKInteractiveChartViewController _displayNameForDisplayType:](self, "_displayNameForDisplayType:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v9, "addObject:", v17);
          -[HKInteractiveChartViewController _displayUnitForDisplayType:](self, "_displayUnitForDisplayType:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v10, "addObject:", v18);
          -[HKInteractiveChartViewController _colorForDisplayType:](self, "_colorForDisplayType:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v11, "addObject:", v19);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

    if (objc_msgSend(v9, "count") == 1 && objc_msgSend(v10, "count") == 1)
    {
      objc_msgSend(v9, "anyObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "anyObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "anyObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
      v6 = 0;
      v5 = 0;
    }

    v4 = 0;
  }
  selectedSeriesLabel = self->_selectedSeriesLabel;
  if (selectedSeriesLabel)
  {
    if (v5)
    {
      -[UILabel setText:](selectedSeriesLabel, "setText:", v5);
      -[HKInteractiveChartViewController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setNeedsLayout");

    }
    if (v6)
      -[UILabel setTextColor:](self->_selectedSeriesLabel, "setTextColor:", v6);
  }
  selectedSeriesUnitLabel = self->_selectedSeriesUnitLabel;
  if (selectedSeriesUnitLabel)
  {
    if (v7)
      -[UILabel setText:](selectedSeriesUnitLabel, "setText:", v7);
    if (v6)
      -[UILabel setTextColor:](self->_selectedSeriesUnitLabel, "setTextColor:", v6);
  }

}

- (void)_addDisplayTypeToConfiguration:(id)a3 allDisplayTypes:(id)a4 configurationManager:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t i;
  id v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t options;
  int64_t v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int64_t v32;
  int64_t v33;
  void *v34;
  void *v35;
  int v36;
  id v37;

  v37 = a3;
  v8 = a4;
  v9 = a5;
  -[HKInteractiveChartViewController _customGraphSeriesForDisplayType:](self, "_customGraphSeriesForDisplayType:", v37);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    for (i = 0; i != 8; ++i)
      -[HKInteractiveChartViewController _configureCustomDisplayType:graphSeries:configurationManager:timeScope:](self, "_configureCustomDisplayType:graphSeries:configurationManager:timeScope:", v37, v10, v9, i);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v37;
      for (j = 0; j != 8; ++j)
      {
        objc_msgSend(v12, "graphSeriesForTimeScope:", j);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v15 = 0;
          while (1)
          {
            objc_msgSend(v12, "graphSeriesForTimeScope:", v15);
            v16 = objc_claimAutoreleasedReturnValue();
            if (v16)
              break;
            if (++v15 == 8)
            {
              v14 = 0;
              goto LABEL_13;
            }
          }
          v14 = (void *)v16;
        }
LABEL_13:
        -[HKInteractiveChartViewController _configureCustomDisplayType:graphSeries:configurationManager:timeScope:](self, "_configureCustomDisplayType:graphSeries:configurationManager:timeScope:", v12, v14, v9, j);

      }
    }
    else
    {
      options = self->_options;
      v18 = -[HKInteractiveChartViewController _numHorizontalDisplayTypesForTimeScope:displayTypes:](self, "_numHorizontalDisplayTypesForTimeScope:displayTypes:", 6, v8);
      v19 = -[HKInteractiveChartViewController _numHorizontalDisplayTypesForTimeScope:displayTypes:](self, "_numHorizontalDisplayTypesForTimeScope:displayTypes:", 5, v8);
      v32 = -[HKInteractiveChartViewController _numHorizontalDisplayTypesForTimeScope:displayTypes:](self, "_numHorizontalDisplayTypesForTimeScope:displayTypes:", 4, v8);
      v33 = -[HKInteractiveChartViewController _numHorizontalDisplayTypesForTimeScope:displayTypes:](self, "_numHorizontalDisplayTypesForTimeScope:displayTypes:", 3, v8);
      v12 = (id)objc_opt_new();
      v20 = (void *)objc_opt_new();
      v21 = v20;
      v36 = options;
      if ((options & 0x80) != 0)
      {
        objc_msgSend(v20, "setTimeScope:", 7);
        objc_msgSend(v21, "setNumberOfHorizontalDisplayTypes:", -[HKInteractiveChartViewController _numHorizontalDisplayTypesForTimeScope:displayTypes:](self, "_numHorizontalDisplayTypesForTimeScope:displayTypes:", 7, v8));
        objc_msgSend(v21, "setHorizontalIndex:", 0);
        objc_msgSend(v12, "addObject:", v21);
      }
      v35 = v21;
      if ((options & 0x400) == 0)
      {
        v22 = (void *)objc_opt_new();
        objc_msgSend(v22, "setTimeScope:", 6);
        objc_msgSend(v22, "setNumberOfHorizontalDisplayTypes:", v18);
        objc_msgSend(v22, "setHorizontalIndex:", 0);
        objc_msgSend(v12, "addObject:", v22);

      }
      v23 = (void *)objc_opt_new();
      objc_msgSend(v23, "setTimeScope:", 5);
      objc_msgSend(v23, "setNumberOfHorizontalDisplayTypes:", v19);
      objc_msgSend(v23, "setHorizontalIndex:", 0);
      v34 = v23;
      objc_msgSend(v12, "addObject:", v23);
      v24 = (void *)objc_opt_new();
      objc_msgSend(v24, "setTimeScope:", 4);
      objc_msgSend(v24, "setNumberOfHorizontalDisplayTypes:", v32);
      objc_msgSend(v24, "setHorizontalIndex:", 0);
      objc_msgSend(v12, "addObject:", v24);
      v25 = (void *)objc_opt_new();
      objc_msgSend(v25, "setTimeScope:", 3);
      objc_msgSend(v25, "setNumberOfHorizontalDisplayTypes:", v33);
      objc_msgSend(v25, "setHorizontalIndex:", 0);
      objc_msgSend(v12, "addObject:", v25);
      v26 = (void *)objc_opt_new();
      v27 = v26;
      if ((v36 & 0x200) == 0)
      {
        objc_msgSend(v26, "setTimeScope:", 2);
        objc_msgSend(v27, "setNumberOfHorizontalDisplayTypes:", -[HKInteractiveChartViewController _numHorizontalDisplayTypesForTimeScope:displayTypes:](self, "_numHorizontalDisplayTypesForTimeScope:displayTypes:", 2, v8));
        objc_msgSend(v27, "setHorizontalIndex:", 0);
        objc_msgSend(v12, "addObject:", v27);
      }
      v28 = (void *)objc_opt_new();
      v29 = v28;
      if ((v36 & 0x100) != 0)
      {
        objc_msgSend(v28, "setTimeScope:", 1);
        objc_msgSend(v29, "setNumberOfHorizontalDisplayTypes:", -[HKInteractiveChartViewController _numHorizontalDisplayTypesForTimeScope:displayTypes:](self, "_numHorizontalDisplayTypesForTimeScope:displayTypes:", 1, v8));
        objc_msgSend(v29, "setHorizontalIndex:", 0);
        objc_msgSend(v12, "addObject:", v29);
      }
      v30 = (void *)objc_opt_new();
      v31 = v30;
      if ((v36 & 0x200000) != 0)
      {
        objc_msgSend(v30, "setTimeScope:", 0);
        objc_msgSend(v31, "setNumberOfHorizontalDisplayTypes:", -[HKInteractiveChartViewController _numHorizontalDisplayTypesForTimeScope:displayTypes:](self, "_numHorizontalDisplayTypesForTimeScope:displayTypes:", 0, v8));
        objc_msgSend(v31, "setHorizontalIndex:", 0);
        objc_msgSend(v12, "addObject:", v31);
      }
      -[HKInteractiveChartViewController _addSeriesForDisplayType:updatingTimeScopeProperties:configurationManager:](self, "_addSeriesForDisplayType:updatingTimeScopeProperties:configurationManager:", v37, v12, v9);

    }
  }

}

- (void)_updateAfterConfigurationChangeIncludeDateAxis:(BOOL)a3
{
  void *v4;

  if (a3 && -[HKInteractiveChartViewController _chartHasDateAxis](self, "_chartHasDateAxis"))
    -[HKInteractiveChartViewController _updateGraphViewAxisDateRange](self, "_updateGraphViewAxisDateRange");
  -[HKGraphViewController graphView](self->_primaryGraphViewController, "graphView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsReloadSeries");

  -[HKInteractiveChartViewController _showHideNoGraphSeriesLabels](self, "_showHideNoGraphSeriesLabels");
  -[HKInteractiveChartViewController _updateSelectedSeriesLabel:](self, "_updateSelectedSeriesLabel:", 0);
}

- (void)_setVisibleDisplayTypes:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  HKGraphSeriesConfigurationManager *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  NSArray *allGraphSeriesConfigurationManagers;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
        v11 = objc_alloc_init(HKGraphSeriesConfigurationManager);
        -[HKGraphSeriesConfigurationManager reset](v11, "reset");
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v12 = v10;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v21;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v21 != v15)
                objc_enumerationMutation(v12);
              -[HKInteractiveChartViewController _addDisplayTypeToConfiguration:allDisplayTypes:configurationManager:](self, "_addDisplayTypeToConfiguration:allDisplayTypes:configurationManager:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16++), v12, v11);
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v14);
        }

        objc_msgSend(v5, "addObject:", v11);
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  v17 = (NSArray *)objc_msgSend(v5, "copy");
  allGraphSeriesConfigurationManagers = self->_allGraphSeriesConfigurationManagers;
  self->_allGraphSeriesConfigurationManagers = v17;

  -[HKInteractiveChartViewController _updateAfterConfigurationChangeIncludeDateAxis:](self, "_updateAfterConfigurationChangeIncludeDateAxis:", 1);
}

- (int64_t)addNewDisplayTypeStackWithDisplayTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKGraphSeriesConfigurationManager *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  NSArray *allGraphSeriesConfigurationManagers;
  int64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_allGraphSeriesConfigurationManagers);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(HKGraphSeriesConfigurationManager);
    -[HKGraphSeriesConfigurationManager reset](v7, "reset");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          -[HKInteractiveChartViewController _addDisplayTypeToConfiguration:allDisplayTypes:configurationManager:](self, "_addDisplayTypeToConfiguration:allDisplayTypes:configurationManager:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12++), v8, v7, (_QWORD)v17);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    objc_msgSend(v6, "addObject:", v7);
    v13 = (NSArray *)objc_msgSend(v6, "copy");
    allGraphSeriesConfigurationManagers = self->_allGraphSeriesConfigurationManagers;
    self->_allGraphSeriesConfigurationManagers = v13;

    -[HKInteractiveChartViewController _updateAfterConfigurationChangeIncludeDateAxis:](self, "_updateAfterConfigurationChangeIncludeDateAxis:", 0);
    -[HKInteractiveChartViewController updateCurrentValueViewWithVisibleRange](self, "updateCurrentValueViewWithVisibleRange");
    -[HKInteractiveChartViewController _scheduleDelayedAutoscale](self, "_scheduleDelayedAutoscale");
    -[HKInteractiveChartViewController _updateGraphViewAxisDateRange](self, "_updateGraphViewAxisDateRange");
    v15 = objc_msgSend(v6, "count") - 1;

  }
  else
  {
    v15 = -1;
  }

  return v15;
}

- (void)removeStackedDisplayType:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_allGraphSeriesConfigurationManagers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "configurationContainsDisplayType:", v4, (_QWORD)v12) & 1) != 0)
        {
          v11 = v8 + v10;
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_12:

  if (v11 < -[NSArray count](self->_allGraphSeriesConfigurationManagers, "count"))
    -[HKInteractiveChartViewController removeDisplayTypeStackAtIndex:](self, "removeDisplayTypeStackAtIndex:", v11);

}

- (BOOL)removeDisplayTypeStackAtIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSArray *v9;
  NSArray *allGraphSeriesConfigurationManagers;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_allGraphSeriesConfigurationManagers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = v6;
  if (a3 <= 1)
    v8 = 1;
  else
    v8 = a3;
  if (v6 > v8)
  {
    objc_msgSend(v5, "removeObjectAtIndex:", a3);
    v9 = (NSArray *)objc_msgSend(v5, "copy");
    allGraphSeriesConfigurationManagers = self->_allGraphSeriesConfigurationManagers;
    self->_allGraphSeriesConfigurationManagers = v9;

    -[HKInteractiveChartViewController _updateAfterConfigurationChangeIncludeDateAxis:](self, "_updateAfterConfigurationChangeIncludeDateAxis:", 0);
    -[HKInteractiveChartViewController updateCurrentValueViewWithVisibleRange](self, "updateCurrentValueViewWithVisibleRange");
    -[HKInteractiveChartViewController _scheduleDelayedAutoscale](self, "_scheduleDelayedAutoscale");
  }

  return v7 > v8;
}

- (id)_customGraphSeriesForDisplayType:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "performSelector:", sel_graphSeries);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_configureCustomDisplayType:(id)a3 graphSeries:(id)a4 configurationManager:(id)a5 timeScope:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  HKGraphSeriesConfiguration *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(HKGraphSeriesConfiguration);
  -[HKGraphSeriesConfiguration setGraphSeries:](v13, "setGraphSeries:", v11);

  -[HKGraphSeriesConfiguration setDisplayType:](v13, "setDisplayType:", v12);
  switch(a6)
  {
    case 0:
      if ((self->_options & 0x200000) != 0)
        goto LABEL_15;
      break;
    case 1:
      if ((self->_options & 0x100) != 0)
        goto LABEL_15;
      break;
    case 2:
      if ((self->_options & 0x200) == 0)
        goto LABEL_15;
      break;
    case 3:
      if ((self->_options & 0x4000) == 0)
        goto LABEL_15;
      break;
    case 4:
      goto LABEL_15;
    case 5:
      if ((self->_options & 0x8000) != 0)
        break;
      goto LABEL_15;
    case 6:
      if ((self->_options & 0x400) != 0)
        break;
      goto LABEL_15;
    case 7:
      if ((self->_options & 0x80) != 0)
LABEL_15:
        objc_msgSend(v10, "addConfiguration:zoom:", v13, a6);
      break;
    case 8:
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_FAULT))
        -[HKInteractiveChartViewController _configureCustomDisplayType:graphSeries:configurationManager:timeScope:].cold.1();
      break;
    default:
      break;
  }

}

- (int64_t)_numHorizontalDisplayTypesForTimeScope:(int64_t)a3 displayTypes:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (-[HKInteractiveChartViewController _displayTypeIsHorizontalForTimeScope:displayType:](self, "_displayTypeIsHorizontalForTimeScope:displayType:", a3, v12))
        {
          v9 += objc_msgSend(v12, "hk_stackedChartSectionsCountForTimeScope:", a3);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_displayTypeIsHorizontalForTimeScope:(int64_t)a3 displayType:(id)a4
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a4, "chartingRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "chartStyleForTimeScope:", a3);

  return (unint64_t)(v6 - 5) < 4;
}

- (void)_addSeriesForDisplayType:(id)a3 updatingTimeScopeProperties:(id)a4 configurationManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __110__HKInteractiveChartViewController__addSeriesForDisplayType_updatingTimeScopeProperties_configurationManager___block_invoke;
  v12[3] = &unk_1E9C443E8;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a4, "enumerateObjectsUsingBlock:", v12);

}

void __110__HKInteractiveChartViewController__addSeriesForDisplayType_updatingTimeScopeProperties_configurationManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend(a2, "timeScope");
  objc_msgSend(*(id *)(a1 + 32), "_createGraphSeriesConfigurationFromDisplayType:timeScope:", *(_QWORD *)(a1 + 40), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 48), "addConfiguration:zoom:", v4, v3);
    v4 = v5;
  }

}

- (int64_t)_countOfHorizontalSectionsForConfigurationManager:(id)a3 timeScope:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "allDisplayTypesForZoom:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (-[HKInteractiveChartViewController _displayTypeIsHorizontalForTimeScope:displayType:](self, "_displayTypeIsHorizontalForTimeScope:displayType:", a4, v12))
        {
          v9 += objc_msgSend(v12, "hk_stackedChartSectionsCountForTimeScope:", a4);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_createGraphSeriesConfigurationFromDisplayType:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", objc_msgSend(v6, "categoryIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController unitPreferenceController](self, "unitPreferenceController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController chartDataCacheController](self, "chartDataCacheController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_standardSeriesForTimeScope:displayCategory:unitController:dataCacheController:", a4, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setDisplayType:", v6);
    objc_msgSend(v7, "color");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTintColor:", v12);

    objc_msgSend(v11, "setGraphSeries:", v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_primaryDisplayType
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v4 = -[HKInteractiveChartViewController primaryDisplayTypeStackIndex](self, "primaryDisplayTypeStackIndex");
  if (v4 >= -[NSArray count](self->_allGraphSeriesConfigurationManagers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKInteractiveChartViewController.m"), 2300, CFSTR("Primary display type index out of bounds: %ld"), -[HKInteractiveChartViewController primaryDisplayTypeStackIndex](self, "primaryDisplayTypeStackIndex"));

  }
  -[NSArray objectAtIndexedSubscript:](self->_allGraphSeriesConfigurationManagers, "objectAtIndexedSubscript:", -[HKInteractiveChartViewController primaryDisplayTypeStackIndex](self, "primaryDisplayTypeStackIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allDisplayTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_colorForDisplayType:(id)a3
{
  void *v3;
  void *v4;

  +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", objc_msgSend(a3, "categoryIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)makeStandardCurrentValueViewDataSource
{
  HKCurrentValueViewDataSource *v3;
  void *v4;
  void *v5;
  void *v6;
  HKCurrentValueViewDataSource *v7;
  void *v8;
  void *v9;

  v3 = [HKCurrentValueViewDataSource alloc];
  -[HKInteractiveChartViewController dateCache](self, "dateCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController healthStore](self, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController selectedRangeFormatter](self, "selectedRangeFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKCurrentValueViewDataSource initWithDateCache:healthStore:selectedRangeFormatter:](v3, "initWithDateCache:healthStore:selectedRangeFormatter:", v4, v5, v6);

  -[HKInteractiveChartViewController currentValueViewDataSourceDelegate](self, "currentValueViewDataSourceDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HKInteractiveChartViewController currentValueViewDataSourceDelegate](self, "currentValueViewDataSourceDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCurrentValueViewDataSource setDelegate:](v7, "setDelegate:", v9);

  }
  else
  {
    -[HKCurrentValueViewDataSource setDelegate:](v7, "setDelegate:", self);
  }
  return v7;
}

- (void)setCurrentValueViewDataSourceDelegate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_storeWeak((id *)&self->_currentValueViewDataSourceDelegate, v6);
  -[HKInteractiveChartViewController currentValueViewDataSource](self, "currentValueViewDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HKInteractiveChartViewController currentValueViewDataSource](self, "currentValueViewDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", v6);

  }
}

- (BOOL)_dashboardEmptyLabelsExist
{
  return self->_dashboardEmptyHeader != 0;
}

- (void)_createDashboardEmptyLabelsIfNecessary
{
  UILabel *v3;
  UILabel *dashboardEmptyHeader;
  UILabel *v5;
  UILabel *dashboardEmptyDescription;
  void *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  if (!-[HKInteractiveChartViewController _dashboardEmptyLabelsExist](self, "_dashboardEmptyLabelsExist"))
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    dashboardEmptyHeader = self->_dashboardEmptyHeader;
    self->_dashboardEmptyHeader = v3;

    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    dashboardEmptyDescription = self->_dashboardEmptyDescription;
    self->_dashboardEmptyDescription = v5;

    -[UILabel setNumberOfLines:](self->_dashboardEmptyDescription, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_dashboardEmptyDescription, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_dashboardEmptyHeader, "setTextColor:", v21);
    -[UILabel setTextColor:](self->_dashboardEmptyDescription, "setTextColor:", v21);
    -[UILabel setBackgroundColor:](self->_dashboardEmptyHeader, "setBackgroundColor:", v7);
    -[UILabel setBackgroundColor:](self->_dashboardEmptyDescription, "setBackgroundColor:", v7);
    v8 = self->_dashboardEmptyHeader;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 27.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v9);

    v10 = self->_dashboardEmptyDescription;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    -[HKInteractiveChartViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", self->_dashboardEmptyHeader);

    -[HKInteractiveChartViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_dashboardEmptyDescription);

    v14 = self->_dashboardEmptyHeader;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("NO_SERIES_HEADER"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v14, "setText:", v16);

    v17 = self->_dashboardEmptyDescription;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("NO_SERIES_DESCRIPTION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v17, "setText:", v19);

    -[HKInteractiveChartViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setNeedsLayout");

  }
}

- (void)_showHideNoGraphSeriesLabels
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;

  -[HKInteractiveChartViewController _allDisplayTypes](self, "_allDisplayTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    -[HKInteractiveChartViewController _createDashboardEmptyLabelsIfNecessary](self, "_createDashboardEmptyLabelsIfNecessary");
  v5 = v4 == 0;
  v6 = v4 != 0;
  v7 = v5;
  -[HKGraphViewController view](self->_primaryGraphViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v7);

  -[UIView setHidden:](self->_graphBottomDividerView, "setHidden:", v6);
  -[UIView setHidden:](self->_graphTopDividerView, "setHidden:", v6);
  -[UILabel setHidden:](self->_dashboardEmptyHeader, "setHidden:", v6);
  -[UILabel setHidden:](self->_dashboardEmptyDescription, "setHidden:", v6);
  -[HKTimeScopeControl setUserInteractionEnabled:](self->_radioButtons, "setUserInteractionEnabled:", v6);
}

- (void)_radioButtonsDidUpdate:(id)a3
{
  uint64_t v4;
  void *v5;
  _TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent *v6;
  void *v7;
  id v8;

  v4 = objc_msgSend(a3, "selectedTimeScope");
  -[HKInteractiveChartViewController selectedTimeScopeController](self, "selectedTimeScopeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedTimeScope:", v4);

  if (-[HKGraphViewController dateZoom](self->_primaryGraphViewController, "dateZoom") != v4)
  {
    -[HKInteractiveChartViewController setHasInitialDateRangeAndTimeScope:](self, "setHasInitialDateRangeAndTimeScope:", 0);
    -[HKInteractiveChartViewController _replacePrimaryGraphViewControllerWithTimeScope:anchorDate:animated:](self, "_replacePrimaryGraphViewControllerWithTimeScope:anchorDate:animated:", v4, 0, 1);
    v6 = [_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent alloc];
    -[HKInteractiveChartViewController _primaryDisplayType](self, "_primaryDisplayType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HKInteractiveChartInteractionAnalyticsEvent initFor:timeScopeSelected:](v6, "initFor:timeScopeSelected:", v7, v4);

    -[HKInteractiveChartInteractionAnalyticsManager submitWithEvent:](self->_analyticsManager, "submitWithEvent:", v8);
  }
}

- (void)_hideTimeDateControls
{
  -[HKCurrentTimeView setAlpha:](self->_currentTimeView, "setAlpha:", 0.0);
}

- (void)_showTimeDateControls
{
  -[HKCurrentTimeView setAlpha:](self->_currentTimeView, "setAlpha:", 1.0);
}

- (void)updateAnnotationDataSource:(id)a3 pointContexts:(id)a4
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a4, "firstObject", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedSeries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController _displayTypeForSeries:](self, "_displayTypeForSeries:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKInteractiveChartViewController _dateZoom](self, "_dateZoom");
  -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "graphView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartViewController updateSelectionAnnotationDataSourceForContext:displayType:timeScope:resolution:](self, "updateSelectionAnnotationDataSourceForContext:displayType:timeScope:resolution:", v10, v6, v7, objc_msgSend(v5, "resolutionForTimeScope:traitResolution:", v7, objc_msgSend(v9, "resolutionFromTraitCollectionAttributes")));
}

- (id)lollipopFieldColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
}

- (id)lollipopAnnotationColor
{
  void *v2;
  void *v3;

  -[HKInteractiveChartViewController _allDisplayTypes](self, "_allDisplayTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopBackgroundColor");
  else
    HKHealthKeyColor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lollipopExtensionColor
{
  void *v2;
  void *v3;

  -[HKInteractiveChartViewController _allDisplayTypes](self, "_allDisplayTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopStickColor");
  else
    HKHealthKeyColor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)makeAnnotationDataSource
{
  uint64_t v3;
  void *v4;
  HKInteractiveChartViewController *v5;
  HKInteractiveChartViewController *v6;
  HKInteractiveChartAnnotationViewDataSource *v7;
  void *v8;
  HKInteractiveChartAnnotationViewDataSource *v9;

  -[HKInteractiveChartViewController currentValueViewDataSourceDelegate](self, "currentValueViewDataSourceDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (HKInteractiveChartViewController *)v3;
  else
    v5 = self;
  v6 = v5;

  v7 = [HKInteractiveChartAnnotationViewDataSource alloc];
  -[HKInteractiveChartViewController selectedRangeFormatter](self, "selectedRangeFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKInteractiveChartAnnotationViewDataSource initWithSelectedRangeFormatter:firstWeekday:currentValueViewDataSourceDelegate:](v7, "initWithSelectedRangeFormatter:firstWeekday:currentValueViewDataSourceDelegate:", v8, -[HKInteractiveChartViewController annotationDataSourceFirstWeekday](self, "annotationDataSourceFirstWeekday"), v6);

  return v9;
}

- (void)_setSelectedGraphSeries:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  BOOL v15;

  v4 = a4;
  -[HKInteractiveChartViewController _configurationForSeries:](self, "_configurationForSeries:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = v6 != 0;
  if (v6)
  {
    self->_displayState = 1;
    objc_msgSend(v6, "displayType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController _updateSelectedSeriesLabel:](self, "_updateSelectedSeriesLabel:", v9);

  }
  else
  {
    self->_displayState = 0;
  }
  -[HKInteractiveChartViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

  -[HKInteractiveChartViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

  if (-[HKInteractiveChartViewController _selectedDateRangeLabelEnabled](self, "_selectedDateRangeLabelEnabled")
    && -[HKInteractiveChartViewController _chartHasDateAxis](self, "_chartHasDateAxis"))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__HKInteractiveChartViewController__setSelectedGraphSeries_animated___block_invoke;
    v14[3] = &unk_1E9C429F0;
    v15 = v8;
    v14[4] = self;
    v12 = _Block_copy(v14);
    v13 = v12;
    if (v4)
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v12, 0.25);
    else
      (*((void (**)(void *))v12 + 2))(v12);

  }
}

uint64_t __69__HKInteractiveChartViewController__setSelectedGraphSeries_animated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1088);
  if (*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  else
    v3 = 0.0;
  if (*(_BYTE *)(a1 + 40))
    v4 = 0.0;
  else
    v4 = 1.0;
  objc_msgSend(v2, "setAlpha:", v3);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setAlpha:", v4);
}

- (id)_configurationForSeries:(id)a3
{
  id v4;
  int64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HKInteractiveChartViewController _dateZoom](self, "_dateZoom");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_allGraphSeriesConfigurationManagers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "configurationForGraphSeries:zoom:", v4, v5, (_QWORD)v14);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)_configurationForDisplayType:(id)a3
{
  id v4;
  int64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HKInteractiveChartViewController _dateZoom](self, "_dateZoom");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_allGraphSeriesConfigurationManagers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "configurationForDisplayType:zoom:", v4, v5, (_QWORD)v14);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)_createAndPrepareFeedbackGenerator
{
  UIImpactFeedbackGenerator *v3;
  UIImpactFeedbackGenerator *impactFeedbackGenerator;

  v3 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3898]), "initWithStyle:", 1);
  impactFeedbackGenerator = self->_impactFeedbackGenerator;
  self->_impactFeedbackGenerator = v3;

  -[UIImpactFeedbackGenerator prepare](self->_impactFeedbackGenerator, "prepare");
}

- (int64_t)_dateZoom
{
  return -[HKGraphViewController dateZoom](self->_primaryGraphViewController, "dateZoom");
}

- (BOOL)graphViewPointSelectionDifferentiatesSeriesGroups:(id)a3
{
  return 1;
}

- (BOOL)_shouldShowDateRangeForSelectedPointDateLabel
{
  return (unint64_t)(-[HKInteractiveChartViewController _dateZoom](self, "_dateZoom") - 7) < 2;
}

- (id)_pointSelectionInfo:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1F0170730, v10))
        {

          v8 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }

  v8 = v3;
LABEL_11:

  return v8;
}

- (id)_displayTypeForSeries:(id)a3
{
  void *v3;
  void *v4;

  -[HKInteractiveChartViewController _configurationForSeries:](self, "_configurationForSeries:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateSelectionAnnotationDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6
{
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  int64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a4;
  -[HKInteractiveChartViewController annotationDataSource](self, "annotationDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HKInteractiveChartViewController annotationDataSource](self, "annotationDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKInteractiveChartViewController _dateZoom](self, "_dateZoom");
    -[HKInteractiveChartViewController healthStore](self, "healthStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateWithSelectionContext:displayType:timeScope:resolution:healthStore:viewController:", v15, v9, v13, a6, v14, self);

  }
}

- (int64_t)_userInfoSelectionCount:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "userInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v9, "count");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  _BOOL4 v8;
  int *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double x;
  double y;
  double width;
  double height;
  id v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v23 = a4;
  if (+[HKLollipopController pointSelectionContextsHaveUserInfo:](HKLollipopController, "pointSelectionContextsHaveUserInfo:"))
  {
    -[HKInteractiveChartViewController lollipopController](self, "lollipopController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isVisible");

    if (v6)
    {
      -[HKInteractiveChartViewController lollipopController](self, "lollipopController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateWithPointContexts:", v23);
    }
    else
    {
      v8 = -[HKInteractiveChartViewController _currentValueEnabled](self, "_currentValueEnabled");
      v9 = &OBJC_IVAR___HKInteractiveChartViewController__currentTimeView;
      if (v8)
        v9 = &OBJC_IVAR___HKInteractiveChartViewController__currentValueView;
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v9), "frame");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v18 = HKUIRoundToScreenScale(0.5);
      v24.origin.x = v11;
      v24.origin.y = v13;
      v24.size.width = v15;
      v24.size.height = v17;
      v25 = CGRectInset(v24, 0.0, v18);
      v26 = CGRectOffset(v25, 0.0, v18);
      x = v26.origin.x;
      y = v26.origin.y;
      width = v26.size.width;
      height = v26.size.height;
      -[HKInteractiveChartViewController lollipopController](self, "lollipopController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setVisibleWithRect:pointContexts:animated:", v23, 1, x, y, width, height);
    }

  }
}

- (void)graphViewDidEndSelection:(id)a3
{
  id v3;

  -[HKInteractiveChartViewController lollipopController](self, "lollipopController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvisibleAnimated:", 1);

}

- (void)graphView:(id)a3 didUpdateFromDateZoom:(int64_t)a4 toDateZoom:(int64_t)a5 newVisibleRange:(id)a6
{
  id v9;
  int64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int64_t v17;
  dispatch_time_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[6];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = -[HKGraphViewController dateZoom](self->_primaryGraphViewController, "dateZoom");
  if (v10 == a5)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = self->_observers;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "observer", (_QWORD)v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v16, "didUpdateFromDateZoom:toDateZoom:newVisibleRange:", a4, a5, v9);

          ++v15;
        }
        while (v13 != v15);
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v13);
    }

  }
  else
  {
    v17 = v10;
    -[HKInteractiveChartViewController selectTimeScope:](self, "selectTimeScope:", a5);
    v18 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__HKInteractiveChartViewController_graphView_didUpdateFromDateZoom_toDateZoom_newVisibleRange___block_invoke;
    block[3] = &unk_1E9C44410;
    block[4] = self;
    block[5] = v17;
    dispatch_after(v18, MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __95__HKInteractiveChartViewController_graphView_didUpdateFromDateZoom_toDateZoom_newVisibleRange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "selectTimeScope:", *(_QWORD *)(a1 + 40));
}

- (int64_t)stackCountForGraphView:(id)a3
{
  return -[NSArray count](self->_allGraphSeriesConfigurationManagers, "count", a3);
}

- (id)graphView:(id)a3 graphSeriesForZoom:(int64_t)a4 stackOffset:(int64_t)a5
{
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[NSArray objectAtIndexedSubscript:](self->_allGraphSeriesConfigurationManagers, "objectAtIndexedSubscript:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allGraphSeriesForZoom:", a4);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = self->_observers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "observer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "allDisplayTypesForZoom:", a4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "configureDisplayTypes:timeScope:stackOffset:", v15, a4, a5);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v17;
}

- (void)_notifyObserversDidUpdateVisibleValueRange:(id)a3 changeContext:(int64_t)a4
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_observers;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "observer", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "didUpdateVisibleValueRange:changeContext:", v6, a4);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)_shouldHandleVisibleRangeChangeWithChangeContext:(int64_t)a3
{
  CFTimeInterval v4;

  if (a3 != 1)
    return 1;
  v4 = CACurrentMediaTime();
  if (v4 - self->_lastDateValueRangeUpdate < 1.0)
    return 0;
  self->_lastDateValueRangeUpdate = v4;
  return 1;
}

- (void)graphView:(id)a3 didUpdateVisibleValueRange:(id)a4 changeContext:(int64_t)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  if (a5)
  {
    -[HKInteractiveChartViewController _notifyObserversDidUpdateVisibleValueRange:changeContext:](self, "_notifyObserversDidUpdateVisibleValueRange:changeContext:", v8, a5);
    if (-[HKInteractiveChartViewController _shouldHandleVisibleRangeChangeWithChangeContext:](self, "_shouldHandleVisibleRangeChangeWithChangeContext:", a5))
    {
      -[HKInteractiveChartViewController _handleVisibleRangeChange](self, "_handleVisibleRangeChange");
    }
  }

}

- (void)_scheduleDelayedAutoscale
{
  id v3;
  _QWORD v4[5];

  -[HKInteractiveChartViewController setDelayedAutoscaleRequestCount:](self, "setDelayedAutoscaleRequestCount:", -[HKInteractiveChartViewController delayedAutoscaleRequestCount](self, "delayedAutoscaleRequestCount") + 1);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__HKInteractiveChartViewController__scheduleDelayedAutoscale__block_invoke;
  v4[3] = &unk_1E9C40808;
  v4[4] = self;
  v3 = (id)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v4, 0.2);
}

uint64_t __61__HKInteractiveChartViewController__scheduleDelayedAutoscale__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setDelayedAutoscaleActualCount:", objc_msgSend(*(id *)(a1 + 32), "delayedAutoscaleActualCount") + 1);
  v2 = objc_msgSend(*(id *)(a1 + 32), "delayedAutoscaleActualCount");
  result = objc_msgSend(*(id *)(a1 + 32), "delayedAutoscaleRequestCount");
  if (v2 >= result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_automaticAutoScale");
    objc_msgSend(*(id *)(a1 + 32), "setDelayedAutoscaleRequestCount:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "setDelayedAutoscaleActualCount:", 0);
  }
  return result;
}

- (void)graphView:(id)a3 didFinishUserScrollingToValueRange:(id)a4
{
  id v5;

  v5 = a4;
  -[HKInteractiveChartViewController setHasInitialDateRangeAndTimeScope:](self, "setHasInitialDateRangeAndTimeScope:", 0);
  -[HKInteractiveChartViewController _notifyObserversDidUpdateVisibleValueRange:changeContext:](self, "_notifyObserversDidUpdateVisibleValueRange:changeContext:", v5, 2);

  -[HKInteractiveChartViewController _handleVisibleRangeChange](self, "_handleVisibleRangeChange");
  -[HKInteractiveChartViewController _scheduleDelayedAutoscale](self, "_scheduleDelayedAutoscale");
}

- (void)graphView:(id)a3 didUpdateSeries:(id)a4 newDataArrived:(BOOL)a5 changeContext:(int64_t)a6
{
  _BOOL4 v7;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v7 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v20 = a4;
  v21 = v10;
  if (v7
    && -[HKInteractiveChartViewController _shouldHandleVisibleRangeChangeWithChangeContext:](self, "_shouldHandleVisibleRangeChangeWithChangeContext:", a6, v20, v10))
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_DEBUG))
      -[HKInteractiveChartViewController graphView:didUpdateSeries:newDataArrived:changeContext:].cold.1((uint64_t)self, v11);
    -[HKInteractiveChartViewController _automaticAutoScale](self, "_automaticAutoScale");
    objc_msgSend(v10, "effectiveVisibleRangeActive");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 1;
  }
  else
  {
    v13 = 0;
    v12 = 0;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = self->_observers;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "observer", v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v19, "didUpdateSeriesWithNewValueRange:", v12);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  if (v13)
    -[HKInteractiveChartViewController _handleVisibleRangeChange](self, "_handleVisibleRangeChange");

}

- (void)graphView:(id)a3 didUpdateLegendViewsWithTopLegendFrame:(CGRect)a4
{
  -[HKInteractiveChartViewController setLegendBottomLocation:](self, "setLegendBottomLocation:", CGRectGetMinY(a4));
}

- (void)graphViewDidTapYAxis:(id)a3
{
  if ((self->_options & 0x80000) == 0)
    -[HKInteractiveChartViewController scrollToMostRecentData](self, "scrollToMostRecentData", a3);
}

- (void)scrollToMostRecentData
{
  -[HKInteractiveChartViewController _scrollToMostRecentDataWithAlignment:](self, "_scrollToMostRecentDataWithAlignment:", -[HKInteractiveChartViewController defaultAlignmentForTimeScope:](self, "defaultAlignmentForTimeScope:", -[HKTimeScopeControl selectedTimeScope](self->_radioButtons, "selectedTimeScope")));
}

- (void)scrollToDate:(id)a3 withVisibleAlignment:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "graphView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController _scrollToAnchorDate:graphView:alignment:](self, "_scrollToAnchorDate:graphView:alignment:", v6, v7, a4);

}

- (void)scrollToRange:(id)a3 withVisibleAlignment:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HKInteractiveChartViewController *v22;
  void *v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "graphView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "effectiveAxisRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "minValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsValue:exclusiveStart:exclusiveEnd:", v9, 0, 0);

  objc_msgSend(v25, "maxValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "containsValue:exclusiveStart:exclusiveEnd:", v11, 0, 0);

  if ((v10 & 1) != 0)
  {
    if ((v12 & 1) != 0)
      goto LABEL_9;
    objc_msgSend(v8, "minValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v25, "minValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 & 1) != 0)
    {
      v14 = v8;
      goto LABEL_7;
    }
  }
  v14 = v25;
LABEL_7:
  objc_msgSend(v14, "maxValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v7, "effectiveVisibleRangeCadence");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "effectiveVisibleRangeActive");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:", v16, v17, v18);

  }
LABEL_9:
  switch(a4)
  {
    case 0:
      objc_msgSend(v25, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = self;
      v23 = v21;
      v24 = 0;
      goto LABEL_13;
    case 1:
    case 3:
    case 4:
      objc_msgSend(v25, "startDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "endDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      HKUIMidDate(v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = self;
      v23 = v21;
      v24 = 1;
      goto LABEL_13;
    case 2:
      objc_msgSend(v25, "endDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = self;
      v23 = v21;
      v24 = 2;
LABEL_13:
      -[HKInteractiveChartViewController scrollToDate:withVisibleAlignment:](v22, "scrollToDate:withVisibleAlignment:", v23, v24);

      break;
    default:
      break;
  }

}

- (void)_scrollToMostRecentDataWithAlignment:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[HKInteractiveChartViewController _dateForMostRecentData](self, "_dateForMostRecentData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "graphView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController _scrollToAnchorDate:graphView:alignment:](self, "_scrollToAnchorDate:graphView:alignment:", v7, v6, a3);

}

- (int64_t)defaultAlignmentForTimeScope:(int64_t)a3
{
  void *v6;

  if ((unint64_t)a3 < 6)
    return 2;
  if (a3 == 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKInteractiveChartViewController.m"), 2853, CFSTR("Invalid timescope (%ld)"), 8);

  }
  return 3;
}

- (BOOL)_viewHierarchyIsHidden:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isHidden") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v5 = -[HKInteractiveChartViewController _viewHierarchyIsHidden:](self, "_viewHierarchyIsHidden:", v6);
    else
      v5 = 0;

  }
  return v5;
}

- (void)graphView:(id)a3 startupTime:(int64_t)a4
{
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  int v17;
  __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HKInteractiveChartViewController view](self, "view", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKInteractiveChartViewController _viewHierarchyIsHidden:](self, "_viewHierarchyIsHidden:", v6);

  if (!v7)
  {
    -[HKInteractiveChartViewController _primaryDisplayType](self, "_primaryDisplayType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localization");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayName");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v10 || !-[__CFString length](v10, "length"))
    {

      v10 = CFSTR("**UNKNOWN**");
    }
    HKNumberFormatterFromTemplate(1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromNumber:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_INFO))
    {
      v17 = 138412546;
      v18 = v10;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1D7813000, v14, OS_LOG_TYPE_INFO, "Interactive chart startup time for %@: %@ us", (uint8_t *)&v17, 0x16u);
    }
    -[HKInteractiveChartViewController startupReportingBlock](self, "startupReportingBlock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[HKInteractiveChartViewController startupReportingBlock](self, "startupReportingBlock");
      v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, __CFString *, int64_t))v16)[2](v16, v10, a4);

    }
  }
}

- (void)graphViewExternalSelectionEnd:(id)a3
{
  if (-[HKInteractiveChartViewController disableCurrentValueViewForInitialLollipop](self, "disableCurrentValueViewForInitialLollipop", a3))
  {
    -[HKInteractiveChartViewController setDisableCurrentValueViewForInitialLollipop:](self, "setDisableCurrentValueViewForInitialLollipop:", 0);
    -[HKInteractiveChartViewController updateCurrentValueViewWithVisibleRange](self, "updateCurrentValueViewWithVisibleRange");
  }
}

- (void)graphViewRenderedView:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[HKInteractiveChartViewController chartHasDataCompletion](self, "chartHasDataCompletion", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (-[HKInteractiveChartViewController chartDataIsAvailable](self, "chartDataIsAvailable"))
    {
      -[HKInteractiveChartViewController chartHasDataCompletion](self, "chartHasDataCompletion");
      v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v5[2]();

      -[HKInteractiveChartViewController setChartHasDataCompletion:](self, "setChartHasDataCompletion:", 0);
    }
  }
}

- (HKDisplayType)calendarQueryDisplayType
{
  void *v2;
  void *v3;
  void *v4;

  -[HKInteractiveChartViewController displayTypeStack](self, "displayTypeStack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKDisplayType *)v4;
}

- (HKSampleType)calendarQuerySampleType
{
  void *v2;
  void *v3;

  -[HKInteractiveChartViewController calendarQueryDisplayType](self, "calendarQueryDisplayType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sampleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSampleType *)v3;
}

- (UIColor)calendarDaySamplePresentColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HKInteractiveChartViewController displayTypeController](self, "displayTypeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController calendarQuerySampleType](self, "calendarQuerySampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayTypeForObjectType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", objc_msgSend(v5, "categoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v7;
}

- (void)currentTimeViewDidTapOnDateSelector:(id)a3
{
  void *v4;
  void *v5;
  HKInteractiveChartsMonthViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  HKInteractiveChartsMonthViewController *v10;
  void *v11;
  void *v12;
  HKNavigationController *v13;
  id v14;

  if ((self->_options & 0x20000) == 0)
  {
    -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "graphView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectiveVisibleRangeCadence");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v6 = [HKInteractiveChartsMonthViewController alloc];
    -[HKInteractiveChartViewController healthStore](self, "healthStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController dateCache](self, "dateCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "minValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HKInteractiveChartsMonthViewController initWithHealthStore:dateCache:date:](v6, "initWithHealthStore:dateCache:date:", v7, v8, v9);

    -[HKInteractiveChartViewController calendarQuerySampleType](self, "calendarQuerySampleType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartsMonthViewController setSampleType:](v10, "setSampleType:", v11);

    -[HKInteractiveChartViewController calendarDaySamplePresentColor](self, "calendarDaySamplePresentColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartsMonthViewController setSampleColor:](v10, "setSampleColor:", v12);

    -[HKMonthViewController setDelegate:](v10, "setDelegate:", self);
    v13 = -[HKNavigationController initWithRootViewController:]([HKNavigationController alloc], "initWithRootViewController:", v10);
    -[HKInteractiveChartViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

  }
}

- (void)_scrollToAnchorDate:(id)a3 graphView:(id)a4 alignment:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a4;
  v9 = a3;
  -[HKInteractiveChartViewController currentCalendar](self, "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "firstWeekday");

  v12 = objc_msgSend(v8, "xAxisDateZoom");
  objc_msgSend(v8, "effectiveAxisRange");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController currentCalendar](self, "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKGraphZoomLevelConfiguration chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:](HKGraphZoomLevelConfiguration, "chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:", v12, v9, a5, v16, v13, v11, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartViewController visibleRangeForTimeScope:proposedRange:](self, "visibleRangeForTimeScope:proposedRange:", objc_msgSend(v8, "xAxisDateZoom"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEffectiveVisibleRangeActive:animated:", v15, 1);

  -[HKInteractiveChartViewController _handleVisibleRangeChange](self, "_handleVisibleRangeChange");
}

- (void)_moveSelectedDateInDirection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  -[HKGraphViewController graphView](self->_primaryGraphViewController, "graphView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectiveVisibleRangeCadence");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewController graphView](self->_primaryGraphViewController, "graphView");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
    v10 = v7 == 0;
  else
    v10 = 1;
  if (!v10 && v8 != 0)
  {
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v13 = v12;
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v13 + (v14 - v13) * (double)a3 + (v14 - v13) * 0.5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController _scrollToAnchorDate:graphView:alignment:](self, "_scrollToAnchorDate:graphView:alignment:", v15, v9, 3);

  }
}

- (void)currentTimeViewDidTapOnPreviousTimeButton:(id)a3
{
  -[HKInteractiveChartViewController _moveSelectedDateInDirection:](self, "_moveSelectedDateInDirection:", -1);
}

- (void)currentTimeViewDidTapOnNextTimeButton:(id)a3
{
  -[HKInteractiveChartViewController _moveSelectedDateInDirection:](self, "_moveSelectedDateInDirection:", 1);
}

- (void)monthViewController:(id)a3 didSelectDate:(id)a4
{
  -[HKInteractiveChartViewController _setVisibleRangeUsingDateFromDateSelector:](self, "_setVisibleRangeUsingDateFromDateSelector:", a4);
  -[HKInteractiveChartViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)makeCurrentValueView
{
  HKInteractiveChartAnnotationView *v3;
  void *v4;
  void *v5;

  v3 = -[HKInteractiveChartAnnotationView initWithContext:]([HKInteractiveChartAnnotationView alloc], "initWithContext:", 0);
  -[HKInteractiveChartAnnotationView setDelegate:](v3, "setDelegate:", self);
  -[HKInteractiveChartViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  -[HKInteractiveChartViewController makeStandardCurrentValueViewDataSource](self, "makeStandardCurrentValueViewDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController setCurrentValueViewDataSource:](self, "setCurrentValueViewDataSource:", v5);

  -[HKInteractiveChartAnnotationView setDataSource:](v3, "setDataSource:", self->_currentValueViewDataSource);
  -[HKInteractiveChartAnnotationView setShowsInfoButton:](v3, "setShowsInfoButton:", -[HKInteractiveChartViewController _showInfoButtonInCurrentValueView](self, "_showInfoButtonInCurrentValueView"));
  return v3;
}

- (void)updateCurrentValueView:(id)a3 graphView:(id)a4 timeScope:(int64_t)a5 showInfoButton:(BOOL)a6
{
  _BOOL8 v6;
  HKCurrentValueViewDataSource *currentValueViewDataSource;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIView *v15;

  v6 = a6;
  v15 = self->_currentValueView;
  currentValueViewDataSource = self->_currentValueViewDataSource;
  v11 = a4;
  -[HKInteractiveChartViewController _primaryDisplayType](self, "_primaryDisplayType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentValueViewDataSource updateDataSourceWithGraphView:displayType:timeScope:](currentValueViewDataSource, "updateDataSourceWithGraphView:displayType:timeScope:", v11, v12, a5);

  -[HKCurrentValueViewDataSource selectedRangeData](self->_currentValueViewDataSource, "selectedRangeData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[UIView setShowsInfoButton:](v15, "setShowsInfoButton:", v6);
    -[UIView reloadData](v15, "reloadData");
  }
  else if (-[HKInteractiveChartViewController _primaryDisplayTypeHasNoData](self, "_primaryDisplayTypeHasNoData"))
  {
    -[UIView showNoDataStatus](v15, "showNoDataStatus");
  }
  else
  {
    -[UIView scheduleDeferredDataReload](v15, "scheduleDeferredDataReload");
  }

}

- (void)didTapOnDateFromCurrentValueView:(id)a3
{
  -[HKInteractiveChartViewController currentTimeViewDidTapOnDateSelector:](self, "currentTimeViewDidTapOnDateSelector:", self->_currentTimeView);
}

- (void)didTapOnInfoButtonFromCurrentValueView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HKCurrentValueViewDataSource delegate](self->_currentValueViewDataSource, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HKCurrentValueViewDataSource delegate](self->_currentValueViewDataSource, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController _primaryDisplayType](self, "_primaryDisplayType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "infographicViewControllerForDisplayType:healthStore:", v7, self->_healthStore);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKInteractiveChartViewController _primaryDisplayType](self, "_primaryDisplayType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController infographicViewControllerForDisplayType:healthStore:](self, "infographicViewControllerForDisplayType:healthStore:", v6, self->_healthStore);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  v8 = v9;
  if (v9)
  {
    -[UIViewController hk_presentModalCardViewController:fullScreen:animated:completion:](self, "hk_presentModalCardViewController:fullScreen:animated:completion:", v9, 0, 1, 0);
    v8 = v9;
  }

}

- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithValueRange:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController dateCache](self, "dateCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKLastUpdatedIntervalText(v6, a4, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)infographicSupportedForDisplayType:(id)a3 healthStore:(id)a4
{
  HKInteractiveChartViewController *v4;
  void *v5;

  v4 = self;
  -[HKInteractiveChartViewController _primaryDisplayType](self, "_primaryDisplayType", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = +[HKInteractiveChartInfographicFactory infographicSupportedForDisplayType:factorDisplayType:healthStore:](HKInteractiveChartInfographicFactory, "infographicSupportedForDisplayType:factorDisplayType:healthStore:", v5, 0, v4->_healthStore);

  return (char)v4;
}

- (id)infographicViewControllerForDisplayType:(id)a3 healthStore:(id)a4
{
  void *v5;
  void *v6;

  -[HKInteractiveChartViewController _primaryDisplayType](self, "_primaryDisplayType", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKInteractiveChartInfographicFactory infographicViewControllerForDisplayType:factorDisplayType:healthStore:](HKInteractiveChartInfographicFactory, "infographicViewControllerForDisplayType:factorDisplayType:healthStore:", v5, 0, self->_healthStore);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_midPointDateFromVisibleRange
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HKGraphViewController graphView](self->_primaryGraphViewController, "graphView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveVisibleRangeCadence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "endDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "startDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "endDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HKUIMidDate(v6, v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (void)_setDateSelectorToVisibleRange
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  HKCurrentTimeView *currentTimeView;
  void *v18;
  id v19;

  -[HKCurrentTimeView superview](self->_currentTimeView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKInteractiveChartViewController _singleFixedRange](self, "_singleFixedRange");
    v4 = objc_claimAutoreleasedReturnValue();
    v19 = (id)v4;
    if (v4)
      +[HKGraphZoomLevelConfiguration timeScopeForDateRange:](HKGraphZoomLevelConfiguration, "timeScopeForDateRange:", v4);
    else
      -[HKTimeScopeControl selectedTimeScope](self->_radioButtons, "selectedTimeScope");
    -[HKGraphViewController graphView](self->_primaryGraphViewController, "graphView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectiveVisibleRangeActive");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController stringForValueRange:timeScope:](self, "stringForValueRange:timeScope:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCurrentTimeView setCurrentTimeString:](self->_currentTimeView, "setCurrentTimeString:", v6);
    objc_msgSend(v5, "effectiveVisibleRangeCadence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "graphView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "effectiveAxisRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "hk_isBeforeDate:", v12);

    objc_msgSend(v7, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "hk_isAfterDate:", v15);

    currentTimeView = self->_currentTimeView;
    if ((v13 & 1) != 0 || (_DWORD)v16)
    {
      -[HKCurrentTimeView setDisableControls:](currentTimeView, "setDisableControls:", 0);
      -[HKCurrentTimeView setCurrentTimeButtonEnabled:](self->_currentTimeView, "setCurrentTimeButtonEnabled:", 1);
      -[HKCurrentTimeView setNextTimeButtonEnabled:](self->_currentTimeView, "setNextTimeButtonEnabled:", v13);
      -[HKCurrentTimeView setPreviousTimeButtonEnabled:](self->_currentTimeView, "setPreviousTimeButtonEnabled:", v16);
    }
    else
    {
      -[HKCurrentTimeView setDisableControls:](currentTimeView, "setDisableControls:", 1);
      -[HKCurrentTimeView setCurrentTimeButtonEnabled:](self->_currentTimeView, "setCurrentTimeButtonEnabled:", 0);
    }

  }
}

- (void)_setVisibleRangeUsingDateFromDateSelector:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;

  v8 = a3;
  -[HKGraphViewController graphView](self->_primaryGraphViewController, "graphView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewController graphView](self->_primaryGraphViewController, "graphView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectiveVisibleRangeCadence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v4)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (!v7)
      -[HKInteractiveChartViewController _scrollToAnchorDate:graphView:alignment:](self, "_scrollToAnchorDate:graphView:alignment:", v8, v4, 3);
  }

}

- (BOOL)_showInfoButtonInCurrentValueView
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;

  -[HKCurrentValueViewDataSource delegate](self->_currentValueViewDataSource, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HKCurrentValueViewDataSource delegate](self->_currentValueViewDataSource, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController _primaryDisplayType](self, "_primaryDisplayType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "infographicSupportedForDisplayType:healthStore:", v6, self->_healthStore);

  }
  else
  {
    -[HKInteractiveChartViewController _primaryDisplayType](self, "_primaryDisplayType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HKInteractiveChartViewController infographicSupportedForDisplayType:healthStore:](self, "infographicSupportedForDisplayType:healthStore:", v5, self->_healthStore);
  }

  return v7;
}

- (id)_debugDateStringForPoint:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a3, "startXValue");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v4, 2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_dateForBlockPoint:(id)a3
{
  void *v3;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a3, "startXValue");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_chartDataForPoint:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1F0170730))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)_formatterForSeries:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HKInteractiveChartViewController _configurationForSeries:](self, "_configurationForSeries:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_interactiveChartsFormatterForTimeScope:", -[HKInteractiveChartViewController _dateZoom](self, "_dateZoom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMajorFont:", self->_majorSelectedPointFont);
  objc_msgSend(v6, "setMinorFont:", self->_minorSelectedPointFont);
  -[HKInteractiveChartViewController unitPreferenceController](self, "unitPreferenceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUnitController:", v7);

  objc_msgSend(v4, "displayType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayType:", v8);

  return v6;
}

- (BOOL)_primaryDisplayTypeHasNoData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  -[HKInteractiveChartViewController sampleTypeDateRangeController](self, "sampleTypeDateRangeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateRangesBySampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HKInteractiveChartViewController _primaryDisplayType](self, "_primaryDisplayType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sampleType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateRangeForSampleType:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else
    {
      objc_msgSend(v7, "maxValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = 1;
        goto LABEL_6;
      }
    }
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (void)updateCurrentValueViewWithVisibleRange
{
  int64_t v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  if (-[HKInteractiveChartViewController _currentValueEnabled](self, "_currentValueEnabled"))
  {
    if (!-[HKInteractiveChartViewController disableCurrentValueViewForInitialLollipop](self, "disableCurrentValueViewForInitialLollipop"))
    {
      -[HKGraphViewController graphView](self->_primaryGraphViewController, "graphView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v3 = -[HKInteractiveChartViewController _dateZoom](self, "_dateZoom");
      v4 = -[HKInteractiveChartViewController _showInfoButtonInCurrentValueView](self, "_showInfoButtonInCurrentValueView");
      -[HKInteractiveChartViewController currentValueViewHandler](self, "currentValueViewHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updateCurrentValueView:graphView:timeScope:showInfoButton:", self->_currentValueView, v6, v3, v4);

    }
  }
}

- (void)_automaticAutoScale
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if ((self->_options & 4) == 0)
  {
    -[HKGraphViewController graphView](self->_primaryGraphViewController, "graphView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isScrollViewDecelerating") & 1) == 0)
    {
      -[HKGraphViewController graphView](self->_primaryGraphViewController, "graphView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __55__HKInteractiveChartViewController__automaticAutoScale__block_invoke;
      v5[3] = &unk_1E9C3F0D0;
      v5[4] = self;
      objc_msgSend(v4, "autoscaleYAxesAnimated:specificRange:onlyIfNeeded:completion:", 1, 0, 0, v5);

    }
  }
}

uint64_t __55__HKInteractiveChartViewController__automaticAutoScale__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCurrentValueViewWithVisibleRange");
}

- (id)_defaultAxisRangeIncludeToday:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController sampleTypeDateRangeController](self, "sampleTypeDateRangeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HKInteractiveChartViewController _allDisplayTypes](self, "_allDisplayTypes", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v8)
  {
    v10 = 0;
    goto LABEL_15;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v22 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      objc_msgSend(v13, "defaultDataRange");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        if (v10)
          goto LABEL_8;
      }
      else
      {
        objc_msgSend(v13, "sampleType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dateRangeForSampleType:", v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
LABEL_8:
          objc_msgSend(v10, "unionRange:", v14);
          goto LABEL_11;
        }
      }
      v10 = (void *)objc_msgSend(v14, "copy");
LABEL_11:

    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v9);
LABEL_15:

  if (v3)
  {
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v5, v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v10)
      objc_msgSend(v10, "unionRange:", v16);
    else
      v10 = (void *)objc_msgSend(v16, "copy");

  }
  objc_msgSend(v10, "endDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hk_isAfterDate:", v5);

  if (v19)
    objc_msgSend(v10, "setMaxValue:", v5);

  return v10;
}

- (id)_dateForMostRecentData
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  id v20;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController currentCalendar](self, "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v3;
  objc_msgSend(v4, "hk_startOfTomorrowForDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartViewController sampleTypeDateRangeController](self, "sampleTypeDateRangeController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[HKInteractiveChartViewController _allDisplayTypes](self, "_allDisplayTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v12, "defaultDataRange");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(v12, "sampleType");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "dateRangeForSampleType:", v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v13, "endDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqualToDate:", v16);

        if (v17)
        {
          v18 = v23;

          v15 = v18;
        }
        if (v15
          && objc_msgSend(v15, "hk_isBeforeOrEqualToDate:", v5)
          && (!v9 || objc_msgSend(v15, "hk_isAfterDate:", v9)))
        {
          v19 = v15;

          v9 = v19;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v20 = v9;
  return v20;
}

- (void)_updateGraphViewAxisDateRange
{
  HKGraphViewController *primaryGraphViewController;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  uint64_t v21;
  id v22;

  primaryGraphViewController = self->_primaryGraphViewController;
  if (primaryGraphViewController)
  {
    v4 = -[HKGraphViewController dateZoom](primaryGraphViewController, "dateZoom");
    if (-[HKInteractiveChartViewController firstSampleDateRangeUpdate](self, "firstSampleDateRangeUpdate"))
    {
      -[HKInteractiveChartViewController trendAccessibilityDelegate](self, "trendAccessibilityDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trendAccessibilitySeries");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        -[HKInteractiveChartViewController initialXValue](self, "initialXValue");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17
          && (v18 = (void *)v17,
              -[HKInteractiveChartViewController initialXValue](self, "initialXValue"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              isKindOfClass = objc_opt_isKindOfClass(),
              v19,
              v18,
              (isKindOfClass & 1) != 0))
        {
          -[HKInteractiveChartViewController initialXValue](self, "initialXValue");
          v21 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[HKInteractiveChartViewController _dateForMostRecentData](self, "_dateForMostRecentData");
          v21 = objc_claimAutoreleasedReturnValue();
        }
        v22 = (id)v21;
        -[HKInteractiveChartViewController _setGraphViewAxisAndVisibleDateRangeForTimeScope:anchorDate:preserveScrollPosition:](self, "_setGraphViewAxisAndVisibleDateRangeForTimeScope:anchorDate:preserveScrollPosition:", v4, v21, 0);
        goto LABEL_12;
      }
    }
    -[HKInteractiveChartViewController _defaultAxisRangeIncludeToday:](self, "_defaultAxisRangeIncludeToday:", -[HKInteractiveChartViewController firstSampleDateRangeUpdate](self, "firstSampleDateRangeUpdate") ^ 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "graphView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actualVisibleRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && v10)
    {
      objc_msgSend(v10, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "endDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "hk_isBeforeDate:", v11) & 1) != 0)
      {

      }
      else
      {
        v15 = objc_msgSend(v13, "hk_isAfterDate:", v12);

        if ((v15 & 1) == 0)
        {
          v22 = 0;
          v16 = 1;
          goto LABEL_11;
        }
      }
    }
    -[HKInteractiveChartViewController _dateForMostRecentData](self, "_dateForMostRecentData");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
LABEL_11:

    -[HKInteractiveChartViewController _setGraphViewAxisAndVisibleDateRangeForTimeScope:anchorDate:preserveScrollPosition:](self, "_setGraphViewAxisAndVisibleDateRangeForTimeScope:anchorDate:preserveScrollPosition:", v4, v22, v16);
LABEL_12:

  }
}

- (void)sampleTypeDateRangeController:(id)a3 didUpdateDateRanges:(id)a4
{
  -[HKInteractiveChartViewController _updateGraphViewAxisDateRange](self, "_updateGraphViewAxisDateRange", a3, a4);
  -[HKInteractiveChartViewController setFirstSampleDateRangeUpdate:](self, "setFirstSampleDateRangeUpdate:", 0);
}

- (void)selectTimeScope:(int64_t)a3
{
  -[HKTimeScopeControl setSelectedTimeScope:](self->_radioButtons, "setSelectedTimeScope:", a3);
  -[HKInteractiveChartViewController _radioButtonsDidUpdate:](self, "_radioButtonsDidUpdate:", self->_radioButtons);
}

- (void)setRestorationUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_restorationUserActivity, a3);
}

- (id)restorationStateDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[HKInteractiveChartViewController _primaryDisplayType](self, "_primaryDisplayType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController healthStore](self, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardChartRestorationDictionary:healthStore:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)saveRestorationState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HKInteractiveChartViewController restorationStateDictionary](self, "restorationStateDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_class();
  -[HKInteractiveChartViewController _primaryDisplayType](self, "_primaryDisplayType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardChartRestorationActivity:primaryDisplayType:", v6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "saveRestorationUserActivity:viewController:", v5, self);
}

+ (id)standardChartRestorationDictionary:(id)a3 healthStore:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  objc_msgSend(a1, "_encodeCurrentProfileIdentifierForHealthStore:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("profileIdentifier"));
  objc_msgSend(v6, "objectType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "code");

  v13 = objc_msgSend(v6, "categoryIdentifier");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v6;
    objc_msgSend(v14, "baseDisplayType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v14, "baseDisplayType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v17, "code");

      objc_msgSend(v14, "baseDisplayType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v18, "categoryIdentifier");

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("dataTypeCode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("displayCategoryID"));

  return v9;
}

+ (id)_encodeCurrentProfileIdentifierForHealthStore:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  objc_msgSend(a3, "profileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      +[HKInteractiveChartViewController _encodeCurrentProfileIdentifierForHealthStore:].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
  }

  return v4;
}

+ (id)mergeRestorationDictionary:(id)a3 otherDictionary:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
        objc_msgSend(v15, "objectForKeyedSubscript:", v20, (_QWORD)v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v17);
  }

  return v7;
}

+ (id)standardChartRestorationActivity:(id)a3 primaryDisplayType:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(a4, "localization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Chart(%@)"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "baseRestorationUserActivity:activityType:title:", v7, CFSTR("com.apple.health.view.data"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)baseRestorationUserActivity:(id)a3 activityType:(id)a4 title:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0CA5920];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithActivityType:", v9);

  objc_msgSend(v11, "setEligibleForSearch:", 0);
  objc_msgSend(v11, "setEligibleForHandoff:", 1);
  objc_msgSend(v11, "setEligibleForPrediction:", 0);
  objc_msgSend(v11, "setTitle:", v8);

  objc_msgSend(v11, "setUserInfo:", v10);
  v15[0] = CFSTR("versionKey");
  v15[1] = CFSTR("DateSavedAppState");
  v16[0] = &unk_1E9CECB90;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addUserInfoEntriesFromDictionary:", v13);
  return v11;
}

+ (void)saveRestorationUserActivity:(id)a3 viewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(a4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_msgSend(v7, "windowScene"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    objc_msgSend(v7, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUserActivity:", v5);

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      +[HKInteractiveChartViewController saveRestorationUserActivity:viewController:].cold.1();
  }

}

- (NSString)chartOverlayVersion
{
  return (NSString *)CFSTR("no overlays");
}

- (int64_t)annotationDataSourceFirstWeekday
{
  void *v3;
  int64_t v4;

  if (self->_annotationDataSourceFirstWeekday != -1)
    return self->_annotationDataSourceFirstWeekday;
  -[HKInteractiveChartViewController currentCalendar](self, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "firstWeekday");

  return v4;
}

- (HKGraphViewController)primaryGraphViewController
{
  return self->_primaryGraphViewController;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (HKSelectedTimeScopeController)selectedTimeScopeController
{
  return self->_selectedTimeScopeController;
}

- (HKSelectedRangeFormatter)selectedRangeFormatter
{
  return self->_selectedRangeFormatter;
}

- (void)setSelectedRangeFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRangeFormatter, a3);
}

- (HKChartDataCacheController)chartDataCacheController
{
  return self->_chartDataCacheController;
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (HKSampleTypeDateRangeController)sampleTypeDateRangeController
{
  return self->_sampleTypeDateRangeController;
}

- (HKInteractiveChartCurrentValueViewHandler)currentValueViewHandler
{
  return (HKInteractiveChartCurrentValueViewHandler *)objc_loadWeakRetained((id *)&self->_currentValueViewHandler);
}

- (void)setCurrentValueViewHandler:(id)a3
{
  objc_storeWeak((id *)&self->_currentValueViewHandler, a3);
}

- (HKCurrentValueViewDataSourceDelegate)currentValueViewDataSourceDelegate
{
  return (HKCurrentValueViewDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_currentValueViewDataSourceDelegate);
}

- (HKCurrentOverlayLocationProviding)currentOverlayLocationProvider
{
  return (HKCurrentOverlayLocationProviding *)objc_loadWeakRetained((id *)&self->_currentOverlayLocationProvider);
}

- (void)setCurrentOverlayLocationProvider:(id)a3
{
  objc_storeWeak((id *)&self->_currentOverlayLocationProvider, a3);
}

- (NSUserActivity)restorationUserActivity
{
  return self->_restorationUserActivity;
}

- (void)setAnnotationDataSourceFirstWeekday:(int64_t)a3
{
  self->_annotationDataSourceFirstWeekday = a3;
}

- (int64_t)primaryDisplayTypeStackIndex
{
  return self->_primaryDisplayTypeStackIndex;
}

- (NSArray)stackedDisplayTypeHeights
{
  return self->_stackedDisplayTypeHeights;
}

- (unint64_t)options
{
  return self->_options;
}

- (HKInteractiveChartAnnotationViewDataSourceProtocol)annotationDataSource
{
  return self->_annotationDataSource;
}

- (void)setAnnotationDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_annotationDataSource, a3);
}

- (HKTrendAccessibilityDelegate)trendAccessibilityDelegate
{
  return (HKTrendAccessibilityDelegate *)objc_loadWeakRetained((id *)&self->_trendAccessibilityDelegate);
}

- (void)setTrendAccessibilityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_trendAccessibilityDelegate, a3);
}

- (HKLollipopController)lollipopController
{
  return self->_lollipopController;
}

- (void)setLollipopController:(id)a3
{
  objc_storeStrong((id *)&self->_lollipopController, a3);
}

- (double)legendBottomLocation
{
  return self->_legendBottomLocation;
}

- (void)setLegendBottomLocation:(double)a3
{
  self->_legendBottomLocation = a3;
}

- (NSArray)displayTypeStack
{
  return self->_displayTypeStack;
}

- (void)setDisplayTypeStack:(id)a3
{
  objc_storeStrong((id *)&self->_displayTypeStack, a3);
}

- (HKCurrentValueViewDataSource)currentValueViewDataSource
{
  return self->_currentValueViewDataSource;
}

- (void)setCurrentValueViewDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_currentValueViewDataSource, a3);
}

- (id)initialXValue
{
  return self->_initialXValue;
}

- (void)setInitialXValue:(id)a3
{
  objc_storeStrong(&self->_initialXValue, a3);
}

- (BOOL)firstSampleDateRangeUpdate
{
  return self->_firstSampleDateRangeUpdate;
}

- (void)setFirstSampleDateRangeUpdate:(BOOL)a3
{
  self->_firstSampleDateRangeUpdate = a3;
}

- (int64_t)delayedAutoscaleRequestCount
{
  return self->_delayedAutoscaleRequestCount;
}

- (void)setDelayedAutoscaleRequestCount:(int64_t)a3
{
  self->_delayedAutoscaleRequestCount = a3;
}

- (int64_t)delayedAutoscaleActualCount
{
  return self->_delayedAutoscaleActualCount;
}

- (void)setDelayedAutoscaleActualCount:(int64_t)a3
{
  self->_delayedAutoscaleActualCount = a3;
}

- (id)startupReportingBlock
{
  return self->_startupReportingBlock;
}

- (void)setStartupReportingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1360);
}

- (HKInteractiveChartCurrentValueViewCallbacks)standardCurrentValueViewCallbacks
{
  return (HKInteractiveChartCurrentValueViewCallbacks *)objc_loadWeakRetained((id *)&self->_standardCurrentValueViewCallbacks);
}

- (void)setStandardCurrentValueViewCallbacks:(id)a3
{
  objc_storeWeak((id *)&self->_standardCurrentValueViewCallbacks, a3);
}

- (BOOL)disableCurrentValueViewForInitialLollipop
{
  return self->_disableCurrentValueViewForInitialLollipop;
}

- (void)setDisableCurrentValueViewForInitialLollipop:(BOOL)a3
{
  self->_disableCurrentValueViewForInitialLollipop = a3;
}

- (BOOL)hasInitialDateRangeAndTimeScope
{
  return self->_hasInitialDateRangeAndTimeScope;
}

- (void)setHasInitialDateRangeAndTimeScope:(BOOL)a3
{
  self->_hasInitialDateRangeAndTimeScope = a3;
}

- (NSDictionary)timeScopeRanges
{
  return self->_timeScopeRanges;
}

- (void)setTimeScopeRanges:(id)a3
{
  objc_storeStrong((id *)&self->_timeScopeRanges, a3);
}

- (id)chartHasDataCompletion
{
  return self->_chartHasDataCompletion;
}

- (void)setChartHasDataCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1384);
}

- (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong(&self->_chartHasDataCompletion, 0);
  objc_storeStrong((id *)&self->_timeScopeRanges, 0);
  objc_destroyWeak((id *)&self->_standardCurrentValueViewCallbacks);
  objc_storeStrong(&self->_startupReportingBlock, 0);
  objc_storeStrong(&self->_initialXValue, 0);
  objc_storeStrong((id *)&self->_currentValueViewDataSource, 0);
  objc_storeStrong((id *)&self->_displayTypeStack, 0);
  objc_storeStrong((id *)&self->_lollipopController, 0);
  objc_destroyWeak((id *)&self->_trendAccessibilityDelegate);
  objc_storeStrong((id *)&self->_annotationDataSource, 0);
  objc_storeStrong((id *)&self->_stackedDisplayTypeHeights, 0);
  objc_storeStrong((id *)&self->_restorationUserActivity, 0);
  objc_destroyWeak((id *)&self->_currentOverlayLocationProvider);
  objc_destroyWeak((id *)&self->_currentValueViewDataSourceDelegate);
  objc_destroyWeak((id *)&self->_currentValueViewHandler);
  objc_storeStrong((id *)&self->_sampleTypeDateRangeController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_chartDataCacheController, 0);
  objc_storeStrong((id *)&self->_selectedRangeFormatter, 0);
  objc_storeStrong((id *)&self->_selectedTimeScopeController, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_primaryGraphViewSnapshot, 0);
  objc_storeStrong((id *)&self->_primaryGraphViewController, 0);
  objc_storeStrong((id *)&self->_primaryGraphViewWrapper, 0);
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectedPointDateLabel, 0);
  objc_storeStrong((id *)&self->_minorSelectedPointFont, 0);
  objc_storeStrong((id *)&self->_majorSelectedPointFont, 0);
  objc_storeStrong((id *)&self->_allGraphSeriesConfigurationManagers, 0);
  objc_storeStrong((id *)&self->_dashboardEmptyDescription, 0);
  objc_storeStrong((id *)&self->_dashboardEmptyHeader, 0);
  objc_storeStrong((id *)&self->_graphBottomDividerView, 0);
  objc_storeStrong((id *)&self->_graphTopDividerView, 0);
  objc_storeStrong((id *)&self->_currentValueView, 0);
  objc_storeStrong((id *)&self->_currentTimeView, 0);
  objc_storeStrong((id *)&self->_radioButtons, 0);
  objc_storeStrong((id *)&self->_selectedSeriesUnitLabel, 0);
  objc_storeStrong((id *)&self->_selectedSeriesLabel, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

+ (void)_validateStackedHeights:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a1, a3, "HKInteractiveChartViewController: stacked height proportions do not sum to one: %lg", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7_0();
}

- (void)interactiveChartHasData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_5(&dword_1D7813000, v0, v1, "Only one outstanding completion block is supported by interactiveChartHasData", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)_setGraphViewAxisAndVisibleDateRangeForTimeScope:(uint64_t)a1 anchorDate:(uint64_t)a2 preserveScrollPosition:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1D7813000, log, OS_LOG_TYPE_DEBUG, "HKInteractiveChartViewController(%p): ChartDataUpdate: setting new axis range %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_7_0();
}

- (void)_displayNameForDisplayType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_1(&dword_1D7813000, v0, v1, "result when trying to generate display name for display type was nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)_configureCustomDisplayType:graphSeries:configurationManager:timeScope:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_1(&dword_1D7813000, v0, v1, "Invalid timescope passed into graph series configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)graphView:(uint64_t)a1 didUpdateSeries:(NSObject *)a2 newDataArrived:changeContext:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1D7813000, a2, OS_LOG_TYPE_DEBUG, "HKInteractiveChartViewController(%p): ChartDataUpdate: new data has arrived", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_7_0();
}

+ (void)_encodeCurrentProfileIdentifierForHealthStore:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Unable to encode profile information: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7_0();
}

+ (void)saveRestorationUserActivity:viewController:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_5(&dword_1D7813000, v0, v1, "Unable to save chart restoration because window and scene are nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

@end
