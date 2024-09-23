@implementation HKHandwashingInteractiveChartViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  HKHandwashingInteractiveChartViewController *v18;
  void *v19;
  HKHandwashingFactorAndTrendViewController *v20;
  HKHandwashingFactorAndTrendViewController *v21;

  v13 = a5;
  v14 = a6;
  v15 = a9;
  v16 = a10;
  v17 = a8;
  v18 = -[HKHandwashingInteractiveChartViewController initWithApplicationItems:displayDate:restorationUserActivity:additionalChartOptions:]([HKHandwashingInteractiveChartViewController alloc], "initWithApplicationItems:displayDate:restorationUserActivity:additionalChartOptions:", v13, v14, v17, a11);

  -[HKHandwashingInteractiveChartViewController handwashingDisplayType](v18, "handwashingDisplayType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 && objc_msgSend(v16, "count"))
    v20 = -[HKHandwashingFactorAndTrendViewController initWithHandwashingDisplayType:applicationItems:trendModel:factorDisplayTypes:displayDate:mode:options:]([HKHandwashingFactorAndTrendViewController alloc], "initWithHandwashingDisplayType:applicationItems:trendModel:factorDisplayTypes:displayDate:mode:options:", v19, v13, v15, v16, v14, 1, -[HKInteractiveChartViewController options](v18, "options"));
  else
    v20 = v18;
  v21 = v20;

  return v21;
}

- (HKHandwashingInteractiveChartViewController)initWithApplicationItems:(id)a3 displayDate:(id)a4 restorationUserActivity:(id)a5 additionalChartOptions:(unint64_t)a6
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HKHandwashingInteractiveChartViewController *v21;
  unint64_t v23;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  objc_super v30;
  void *v31;
  _QWORD v32[4];

  v32[2] = *MEMORY[0x1E0C80C00];
  v28 = a5;
  v26 = a4;
  v9 = a3;
  objc_msgSend(v9, "displayTypeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unitController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeScopeController");
  v12 = objc_claimAutoreleasedReturnValue();
  v29 = v10;
  objc_msgSend(v10, "displayTypeWithIdentifier:", &unk_1E9CECF80);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_generateHandwashingGoalDisplayTypeWithDisplayType:unitPreferencesController:selectedTimeScopeController:", v13, v11, v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hk_interactiveChartOptions") | a6;
  v32[0] = v13;
  v32[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "healthStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "chartDataCacheController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sampleDateRangeController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v30.receiver = self;
  v30.super_class = (Class)HKHandwashingInteractiveChartViewController;
  v23 = v14;
  v20 = (void *)v12;
  v21 = -[HKInteractiveChartOverlayViewController initWithStackedDisplayTypes:primaryDisplayTypeStackIndex:stackedDisplayTypeHeights:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:timeScopeRanges:](&v30, sel_initWithStackedDisplayTypes_primaryDisplayTypeStackIndex_stackedDisplayTypeHeights_healthStore_unitPreferenceController_dateCache_chartDataCacheController_selectedTimeScopeController_sampleTypeDateRangeController_initialXValue_currentCalendarOverride_options_timeScopeRanges_, v15, 0, 0, v16, v11, v17, v18, v12, v19, v26, 0, v23, 0);

  if (v21)
  {
    -[HKInteractiveChartViewController addChartViewObserver:](v21, "addChartViewObserver:", v21);
    objc_storeStrong((id *)&v21->_handwashingDisplayType, v13);
    objc_storeStrong((id *)&v21->_goalDisplayType, v25);
    -[HKInteractiveChartViewController setRestorationUserActivity:](v21, "setRestorationUserActivity:", v28);
  }

  return v21;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HKHandwashingInteractiveChartViewController;
  -[HKInteractiveChartViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[HKHandwashingInteractiveChartViewController handwashingDisplayType](self, "handwashingDisplayType", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController graphSeriesForDisplayType:timeScope:stackOffset:](self, "graphSeriesForDisplayType:timeScope:stackOffset:", v8, a4, a5);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setAllowsSelection:", 1);
  -[HKHandwashingInteractiveChartViewController goalDisplayType](self, "goalDisplayType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController graphSeriesForDisplayType:timeScope:stackOffset:](self, "graphSeriesForDisplayType:timeScope:stackOffset:", v9, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAllowsSelection:", 0);
  -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "graphView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMoveSelectedSeriesToFront:", 0);

}

+ (id)_generateHandwashingGoalDataSource
{
  HKHandwashingDateRangeDataSourceDelegate *v2;
  HKHandwashingDateRangeDataSourceDelegate *v3;
  HKDateRangeDataSource *v4;

  v2 = [HKHandwashingDateRangeDataSourceDelegate alloc];
  +[HKHandwashingEventDataSource durationForCompleteSample](HKHandwashingEventDataSource, "durationForCompleteSample");
  v3 = -[HKHandwashingDateRangeDataSourceDelegate initWithGoal:](v2, "initWithGoal:");
  v4 = -[HKDateRangeDataSource initWithSourceDelegate:]([HKDateRangeDataSource alloc], "initWithSourceDelegate:", v3);

  return v4;
}

+ (id)_generateHandwashingGoalLineSeriesWithDisplayType:(id)a3 unitPreferenceController:(id)a4 color:(id)a5
{
  id v7;
  id v8;
  id v9;
  HKLineSeries *v10;
  HKGradientFillStyle *v11;
  void *v12;
  void *v13;
  HKGradientFillStyle *v14;
  void *v15;
  void *v16;
  void *v17;
  HKAxisLabelStyle *v18;
  HKHandwashingGoalFormatter *v19;
  HKLineSeriesPresentationStyle *v20;
  HKLineSeriesPresentationStyle *v21;
  HKLineSeriesPresentationStyle *v22;
  void *v23;
  HKLineSeriesPointMarkerStyle *v24;
  void *v25;
  void *v26;
  void *v27;
  HKLineSeriesPointMarkerStyle *v28;
  HKGradientFillStyle *v30;
  void *v31;
  HKGradientFillStyle *v32;
  HKLineSeriesPresentationStyle *v33;
  HKLineSeriesPresentationStyle *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(HKLineSeries);
  v11 = [HKGradientFillStyle alloc];
  objc_msgSend(v7, "colorWithAlphaComponent:", 0.3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorWithAlphaComponent:", 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[HKGradientFillStyle initWithFirstColor:secondColor:](v11, "initWithFirstColor:secondColor:", v12, v13);

  v14 = [HKGradientFillStyle alloc];
  objc_msgSend(v7, "colorWithAlphaComponent:", 0.3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorWithAlphaComponent:", 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[HKGradientFillStyle initWithFirstColor:secondColor:](v14, "initWithFirstColor:secondColor:", v15, v16);

  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v7, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDashStyle:", 1);
  v18 = objc_alloc_init(HKAxisLabelStyle);
  -[HKAxisLabelStyle setTextColor:](v18, "setTextColor:", v7);
  v19 = -[HKHandwashingGoalFormatter initWithDisplayType:unitPreferenceController:]([HKHandwashingGoalFormatter alloc], "initWithDisplayType:unitPreferenceController:", v9, v8);

  -[HKAxisLabelStyle setNumberFormatter:](v18, "setNumberFormatter:", v19);
  v20 = objc_alloc_init(HKLineSeriesPresentationStyle);
  v31 = v17;
  -[HKLineSeriesPresentationStyle setStrokeStyle:](v20, "setStrokeStyle:", v17);
  -[HKLineSeriesPresentationStyle setWaveForm:](v20, "setWaveForm:", 0);
  -[HKLineSeriesPresentationStyle setAxisAnnotationStyle:](v20, "setAxisAnnotationStyle:", v18);
  v21 = objc_alloc_init(HKLineSeriesPresentationStyle);
  -[HKLineSeriesPresentationStyle setStrokeStyle:](v21, "setStrokeStyle:", v17);
  -[HKLineSeriesPresentationStyle setFillStyle:](v21, "setFillStyle:", v32);
  -[HKLineSeriesPresentationStyle setWaveForm:](v21, "setWaveForm:", 0);
  v22 = objc_alloc_init(HKLineSeriesPresentationStyle);
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v7, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDashStyle:", 2);
  -[HKLineSeriesPresentationStyle setStrokeStyle:](v22, "setStrokeStyle:", v23);
  v24 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:]([HKLineSeriesPointMarkerStyle alloc], "initWithColor:radius:style:", v7, 0, 3.0);
  -[HKLineSeriesPresentationStyle setPointMarkerStyle:](v22, "setPointMarkerStyle:", v24);
  -[HKLineSeriesPresentationStyle setFillStyle:](v22, "setFillStyle:", v30);
  -[HKLineSeriesPresentationStyle setWaveForm:](v22, "setWaveForm:", 0);
  v35[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeries setUnhighlightedPresentationStyles:](v10, "setUnhighlightedPresentationStyles:", v25);

  v34 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeries setHighlightedPresentationStyles:](v10, "setHighlightedPresentationStyles:", v26);

  v33 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeries setSelectedPresentationStyles:](v10, "setSelectedPresentationStyles:", v27);

  v28 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:]([HKLineSeriesPointMarkerStyle alloc], "initWithColor:radius:style:", v7, 0, 5.0);
  -[HKLineSeries setSelectedPointMarkerStyle:](v10, "setSelectedPointMarkerStyle:", v28);
  -[HKLineSeries setInactivePresentationStyle:](v10, "setInactivePresentationStyle:", v20);
  -[HKLineSeries setExtendLastValue:](v10, "setExtendLastValue:", 1);
  -[HKLineSeries setFlatLastValue:](v10, "setFlatLastValue:", 1);
  -[HKGraphSeries setAllowsSelection:](v10, "setAllowsSelection:", 0);

  return v10;
}

+ (id)_generateHandwashingGoalDisplayTypeWithDisplayType:(id)a3 unitPreferencesController:(id)a4 selectedTimeScopeController:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HKInteractiveChartDisplayType *v18;
  void *v19;
  void *v20;
  void *v21;
  HKInteractiveChartDisplayType *v22;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "unitForDisplayType:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_otherKeyColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_generateHandwashingGoalLineSeriesWithDisplayType:unitPreferenceController:color:", v7, v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_generateHandwashingGoalDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDataSource:", v15);

  objc_msgSend(v7, "chartingRules");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "axisScalingRule");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v17, "setUnit:", v12);
  objc_msgSend(v14, "setAxisScalingRule:", v17);
  v18 = [HKInteractiveChartDisplayType alloc];
  objc_msgSend(v7, "localization");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unitString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HKInteractiveChartDisplayType initWithGraphSeries:displayName:unitName:valueFormatter:dataTypeCode:](v18, "initWithGraphSeries:displayName:unitName:valueFormatter:dataTypeCode:", v14, v20, v21, 0, 237);

  return v22;
}

- (HKDisplayType)handwashingDisplayType
{
  return self->_handwashingDisplayType;
}

- (HKDisplayType)goalDisplayType
{
  return self->_goalDisplayType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goalDisplayType, 0);
  objc_storeStrong((id *)&self->_handwashingDisplayType, 0);
}

@end
