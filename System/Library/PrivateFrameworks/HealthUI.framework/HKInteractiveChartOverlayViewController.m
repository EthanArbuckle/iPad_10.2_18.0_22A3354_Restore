@implementation HKInteractiveChartOverlayViewController

- (HKInteractiveChartOverlayViewController)initWithHealthStore:(id)a3 primaryDisplayType:(id)a4 unitPreferenceController:(id)a5 dateCache:(id)a6 chartDataCacheController:(id)a7 selectedTimeScopeController:(id)a8 sampleTypeDateRangeController:(id)a9 initialXValue:(id)a10 currentCalendarOverride:(id)a11 options:(unint64_t)a12
{
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  HKInteractiveChartOverlayViewController *v27;
  id v30;
  objc_super v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v30 = a4;
  v32[0] = v30;
  v17 = (void *)MEMORY[0x1E0C99D20];
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a3;
  objc_msgSend(v17, "arrayWithObjects:count:", v32, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31.receiver = self;
  v31.super_class = (Class)HKInteractiveChartOverlayViewController;
  v27 = -[HKInteractiveChartViewController initWithDisplayTypes:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:](&v31, sel_initWithDisplayTypes_healthStore_unitPreferenceController_dateCache_chartDataCacheController_selectedTimeScopeController_sampleTypeDateRangeController_initialXValue_currentCalendarOverride_options_, v26, v25, v24, v23, v22, v21, v20, v19, v18, a12);

  if (v27)
    -[HKInteractiveChartOverlayViewController _commonInitializationWithDisplayType:](v27, "_commonInitializationWithDisplayType:", v30);

  return v27;
}

- (HKInteractiveChartOverlayViewController)initWithTimeScopeRanges:(id)a3 healthStore:(id)a4 primaryDisplayType:(id)a5 unitPreferenceController:(id)a6 dateCache:(id)a7 chartDataCacheController:(id)a8 selectedTimeScopeController:(id)a9 sampleTypeDateRangeController:(id)a10 initialXValue:(id)a11 currentCalendarOverride:(id)a12 options:(unint64_t)a13
{
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  HKInteractiveChartOverlayViewController *v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v34;
  id v36;
  objc_super v37;
  id v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v36 = a5;
  v38 = v36;
  v17 = (void *)MEMORY[0x1E0C99D20];
  v32 = a12;
  v18 = a11;
  v31 = a10;
  v30 = a9;
  v19 = a8;
  v29 = a7;
  v20 = a6;
  v21 = a4;
  v28 = a3;
  objc_msgSend(v17, "arrayWithObjects:count:", &v38, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37.receiver = self;
  v37.super_class = (Class)HKInteractiveChartOverlayViewController;
  v27 = v18;
  v23 = v18;
  v24 = v19;
  v25 = -[HKInteractiveChartViewController initWithStackedDisplayTypes:primaryDisplayTypeStackIndex:stackedDisplayTypeHeights:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:timeScopeRanges:](&v37, sel_initWithStackedDisplayTypes_primaryDisplayTypeStackIndex_stackedDisplayTypeHeights_healthStore_unitPreferenceController_dateCache_chartDataCacheController_selectedTimeScopeController_sampleTypeDateRangeController_initialXValue_currentCalendarOverride_options_timeScopeRanges_, v22, 0, 0, v21, v20, v29, v19, v30, v31, v27, v32, a13, v28);

  if (v25)
    -[HKInteractiveChartOverlayViewController _commonInitializationWithDisplayType:](v25, "_commonInitializationWithDisplayType:", v36);

  return v25;
}

- (HKInteractiveChartOverlayViewController)initWithStackedDisplayTypes:(id)a3 primaryDisplayTypeStackIndex:(id)a4 stackedDisplayTypeHeights:(id)a5 healthStore:(id)a6 unitPreferenceController:(id)a7 dateCache:(id)a8 chartDataCacheController:(id)a9 selectedTimeScopeController:(id)a10 sampleTypeDateRangeController:(id)a11 initialXValue:(id)a12 currentCalendarOverride:(id)a13 options:(unint64_t)a14 timeScopeRanges:(id)a15
{
  id v21;
  HKInteractiveChartOverlayViewController *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v21 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HKInteractiveChartOverlayViewController;
  v22 = -[HKInteractiveChartViewController initWithStackedDisplayTypes:primaryDisplayTypeStackIndex:stackedDisplayTypeHeights:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:timeScopeRanges:](&v26, sel_initWithStackedDisplayTypes_primaryDisplayTypeStackIndex_stackedDisplayTypeHeights_healthStore_unitPreferenceController_dateCache_chartDataCacheController_selectedTimeScopeController_sampleTypeDateRangeController_initialXValue_currentCalendarOverride_options_timeScopeRanges_, v21, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
  if (v22)
  {
    objc_msgSend(v21, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKInteractiveChartOverlayViewController _commonInitializationWithDisplayType:](v22, "_commonInitializationWithDisplayType:", v24);
  }

  return v22;
}

- (void)_commonInitializationWithDisplayType:(id)a3
{
  id v5;
  HKDisplayType *overlayDisplayType;
  UIColor *currentOverlayColor;
  NSMutableDictionary *v8;
  NSMutableDictionary *overlayChartCaches;
  NSMutableDictionary *v10;
  NSMutableDictionary *customNamedCaches;
  _HKInteractiveChartOverlayWaitForCacheData *v12;
  _HKInteractiveChartOverlayWaitForCacheData *waitForCacheData;
  HKValueRange *initialVisibleDateRange;

  objc_storeStrong((id *)&self->_primaryDisplayType, a3);
  v5 = a3;
  overlayDisplayType = self->_overlayDisplayType;
  self->_overlayDisplayType = 0;

  currentOverlayColor = self->_currentOverlayColor;
  self->_currentOverlayColor = 0;

  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  overlayChartCaches = self->_overlayChartCaches;
  self->_overlayChartCaches = v8;

  v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  customNamedCaches = self->_customNamedCaches;
  self->_customNamedCaches = v10;

  v12 = -[_HKInteractiveChartOverlayWaitForCacheData initWithOverlayController:]([_HKInteractiveChartOverlayWaitForCacheData alloc], "initWithOverlayController:", self);
  waitForCacheData = self->_waitForCacheData;
  self->_waitForCacheData = v12;

  initialVisibleDateRange = self->_initialVisibleDateRange;
  self->_initialVisibleDateRange = 0;

  -[HKInteractiveChartViewController addChartViewObserver:](self, "addChartViewObserver:", self);
}

- (void)unitPreferencesWillUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[HKInteractiveChartOverlayViewController overlayChartCaches](self, "overlayChartCaches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_26);

  -[HKInteractiveChartOverlayViewController customNamedCaches](self, "customNamedCaches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_189);

  v7.receiver = self;
  v7.super_class = (Class)HKInteractiveChartOverlayViewController;
  -[HKInteractiveChartViewController unitPreferencesWillUpdate:](&v7, sel_unitPreferencesWillUpdate_, v4);

}

uint64_t __69__HKInteractiveChartOverlayViewController_unitPreferencesWillUpdate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidateCache");
}

uint64_t __69__HKInteractiveChartOverlayViewController_unitPreferencesWillUpdate___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidateCache");
}

- (void)installOverlayDisplayType:(id)a3
{
  id v5;
  HKDisplayType *overlayDisplayType;
  objc_super v7;

  v5 = a3;
  -[HKInteractiveChartOverlayViewController clearOverlayDisplayTypeWithAutomaticAutoscale:](self, "clearOverlayDisplayTypeWithAutomaticAutoscale:", v5 == 0);
  if (v5)
  {
    objc_storeStrong((id *)&self->_overlayDisplayType, a3);
    overlayDisplayType = self->_overlayDisplayType;
    v7.receiver = self;
    v7.super_class = (Class)HKInteractiveChartOverlayViewController;
    -[HKInteractiveChartViewController addOverlayDisplayType:stackOffset:](&v7, sel_addOverlayDisplayType_stackOffset_, overlayDisplayType, 0);
  }

}

- (void)clearOverlayDisplayType
{
  -[HKInteractiveChartOverlayViewController clearOverlayDisplayTypeWithAutomaticAutoscale:](self, "clearOverlayDisplayTypeWithAutomaticAutoscale:", 1);
}

- (void)clearOverlayDisplayTypeWithAutomaticAutoscale:(BOOL)a3
{
  _BOOL8 v3;
  HKDisplayType *overlayDisplayType;
  HKDisplayType *v6;
  objc_super v7;

  v3 = a3;
  overlayDisplayType = self->_overlayDisplayType;
  if (overlayDisplayType)
  {
    v7.receiver = self;
    v7.super_class = (Class)HKInteractiveChartOverlayViewController;
    -[HKInteractiveChartViewController removeOverlayDisplayType:stackOffset:automaticAutoscale:](&v7, sel_removeOverlayDisplayType_stackOffset_automaticAutoscale_, overlayDisplayType, 0, v3);
    v6 = self->_overlayDisplayType;
    self->_overlayDisplayType = 0;

  }
}

- (BOOL)overlayDisplayTypeInstalled
{
  return self->_overlayDisplayType != 0;
}

- (void)installStackedDisplayType:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HKInteractiveChartOverlayViewController clearDisplayTypeStack](self, "clearDisplayTypeStack");
  if (v5)
  {
    objc_storeStrong((id *)&self->_stackedDisplayType, a3);
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7.receiver = self;
    v7.super_class = (Class)HKInteractiveChartOverlayViewController;
    -[HKInteractiveChartViewController addNewDisplayTypeStackWithDisplayTypes:](&v7, sel_addNewDisplayTypeStackWithDisplayTypes_, v6);

  }
}

- (void)clearDisplayTypeStack
{
  void *v3;
  void *v4;
  HKDisplayType *stackedDisplayType;

  -[HKInteractiveChartOverlayViewController stackedDisplayType](self, "stackedDisplayType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKInteractiveChartOverlayViewController stackedDisplayType](self, "stackedDisplayType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController removeStackedDisplayType:](self, "removeStackedDisplayType:", v4);

    stackedDisplayType = self->_stackedDisplayType;
    self->_stackedDisplayType = 0;

  }
}

- (id)displayTypeForQuantityDistributionStyle:(int64_t)a3 timeScope:(int64_t)a4 overlayColor:(id)a5 options:(int64_t)a6 alternateFormatter:(id)a7 namedPredicate:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  HKQuantityDistributionSeries *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  HKInteractiveChartDisplayType *v38;
  void *v39;
  void *v40;
  void *v41;
  HKInteractiveChartDisplayType *v42;
  void *v44;

  v14 = a7;
  v15 = a8;
  v16 = a5;
  -[HKInteractiveChartOverlayViewController primaryDisplayType](self, "primaryDisplayType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController graphSeriesForDisplayType:timeScope:stackOffset:](self, "graphSeriesForDisplayType:timeScope:stackOffset:", v17, a4, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v19 = v18;
  }
  else
  {
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      -[HKInteractiveChartOverlayViewController displayTypeForQuantityDistributionStyle:timeScope:overlayColor:options:alternateFormatter:namedPredicate:].cold.1((uint64_t)self, v20);
    v19 = 0;
  }
  v44 = v15;
  -[HKInteractiveChartOverlayViewController _dataSourceForDistributionStyle:timeScope:namedPredicate:](self, "_dataSourceForDistributionStyle:timeScope:namedPredicate:", a3, a4, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(HKQuantityDistributionSeries);
  objc_msgSend(v19, "unselectedStrokeStyle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityDistributionSeries setUnselectedStrokeStyle:](v22, "setUnselectedStrokeStyle:", v23);

  -[HKQuantityDistributionSeries unselectedStrokeStyle](v22, "unselectedStrokeStyle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setStrokeColor:", v16);

  objc_msgSend(v19, "inactiveStrokeStyle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityDistributionSeries setInactiveStrokeStyle:](v22, "setInactiveStrokeStyle:", v25);

  objc_msgSend(v19, "selectedStrokeStyle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityDistributionSeries setSelectedStrokeStyle:](v22, "setSelectedStrokeStyle:", v26);

  -[HKQuantityDistributionSeries selectedStrokeStyle](v22, "selectedStrokeStyle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setStrokeColor:", v16);

  objc_msgSend(v19, "minMaxLabelStyle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityDistributionSeries setMinMaxLabelStyle:](v22, "setMinMaxLabelStyle:", v28);

  -[HKQuantityDistributionSeries minMaxLabelStyle](v22, "minMaxLabelStyle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTextColor:", v16);

  objc_msgSend(v19, "minMaxValueStyle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityDistributionSeries setMinMaxValueStyle:](v22, "setMinMaxValueStyle:", v30);

  -[HKQuantityDistributionSeries minMaxValueStyle](v22, "minMaxValueStyle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTextColor:", v16);

  objc_msgSend(v19, "minMaxPointStyle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityDistributionSeries setMinMaxPointStyle:](v22, "setMinMaxPointStyle:", v32);

  -[HKQuantityDistributionSeries minMaxPointStyle](v22, "minMaxPointStyle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setStrokeColor:", v16);

  objc_msgSend(v19, "yAxis");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphSeries setYAxis:](v22, "setYAxis:", v34);

  objc_msgSend(v19, "axisScalingRule");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphSeries setAxisScalingRule:](v22, "setAxisScalingRule:", v35);

  -[HKQuantityDistributionSeries setZeroCountForGap:](v22, "setZeroCountForGap:", objc_msgSend(v19, "zeroCountForGap"));
  if ((a6 & 2) != 0)
    -[HKQuantityDistributionSeries setExcludeDistribution:](v22, "setExcludeDistribution:", 1);
  -[HKGraphSeries setDataSource:](v22, "setDataSource:", v21);
  if (v14)
  {
    v36 = v14;
  }
  else
  {
    -[HKInteractiveChartOverlayViewController primaryDisplayType](self, "primaryDisplayType");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "hk_interactiveChartsFormatterForTimeScope:", a4);
    v36 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[HKInteractiveChartOverlayViewController _modifyFormatter:forTitleOptions:](self, "_modifyFormatter:forTitleOptions:", v36, a6);
  v38 = [HKInteractiveChartDisplayType alloc];
  -[HKInteractiveChartOverlayViewController primaryDisplayType](self, "primaryDisplayType");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartOverlayViewController primaryDisplayType](self, "primaryDisplayType");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectType");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:](v38, "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v22, v39, v36, objc_msgSend(v41, "code"));

  return v42;
}

- (void)_modifyFormatter:(id)a3 forTitleOptions:(int64_t)a4
{
  char v4;
  char isKindOfClass;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = v10;
    v8 = v7;
    if ((v4 & 0x20) != 0)
    {
      v9 = &unk_1E9CE9DD0;
    }
    else if ((v4 & 0x40) != 0)
    {
      v9 = &unk_1E9CE9DE8;
    }
    else
    {
      if ((v4 & 0x80) == 0)
      {
LABEL_9:

        v6 = v10;
        goto LABEL_10;
      }
      v9 = &unk_1E9CE9E00;
    }
    objc_msgSend(v7, "setOverrideStatFormatterItemOptions:", v9);
    goto LABEL_9;
  }
LABEL_10:

}

- (id)displayTypeForQuantityIdentifier:(id)a3 timeScope:(int64_t)a4 displayTypeController:(id)a5 overlayColor:(id)a6 cacheDataSource:(id)a7 alternateLineSeries:(id)a8 alternateFormatter:(id)a9 seriesOptions:(int64_t)a10
{
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  HKLineSeries *v22;
  HKGradientFillStyle *v23;
  void *v24;
  void *v25;
  HKGradientFillStyle *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HKGradientFillStyle *v31;
  HKLineSeriesPresentationStyle *v32;
  id v33;
  void *v34;
  void *v35;
  HKDisplayTypeNumberFormatter *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  HKLineSeriesPresentationStyle *v42;
  void *v43;
  HKLineSeriesPresentationStyle *v44;
  void *v45;
  void *v46;
  HKLineSeriesPointMarkerStyle *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  int v54;
  int v55;
  char v56;
  char v57;
  int v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  HKLineSeriesPointMarkerStyle *v64;
  HKLineSeriesPointMarkerStyle *v65;
  void *v66;
  HKLineSeriesPointMarkerStyle *v67;
  unsigned int v68;
  void *v69;
  HKDisplayTypeNumberFormatter *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  HKInteractiveChartDisplayType *v85;
  void *v87;
  void *v88;
  id v89;
  id v90;
  int64_t v91;
  HKLineSeries *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  HKGradientFillStyle *v97;
  void *v98;
  HKInteractiveChartOverlayViewController *v99;
  void *v100;
  HKLineSeriesPresentationStyle *v101;
  HKLineSeriesPresentationStyle *v102;
  HKLineSeriesPresentationStyle *v103;
  _QWORD v104[3];

  v104[1] = *MEMORY[0x1E0C80C00];
  v16 = a6;
  v17 = a8;
  v94 = a9;
  v18 = (void *)MEMORY[0x1E0CB6978];
  v90 = a7;
  v19 = a5;
  v89 = a3;
  objc_msgSend(v18, "quantityTypeForIdentifier:");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayTypeForObjectType:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = v20;
  objc_msgSend(v20, "chartingRules");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartOverlayViewController primaryDisplayType](self, "primaryDisplayType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = self;
  v91 = a4;
  -[HKInteractiveChartViewController graphSeriesForDisplayType:timeScope:stackOffset:](self, "graphSeriesForDisplayType:timeScope:stackOffset:", v21, a4, 0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (HKLineSeries *)v17;
  v92 = v22;
  if (!v22)
    v22 = objc_alloc_init(HKLineSeries);
  v23 = [HKGradientFillStyle alloc];
  objc_msgSend(v16, "colorWithAlphaComponent:", 0.3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "colorWithAlphaComponent:", 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = -[HKGradientFillStyle initWithFirstColor:secondColor:](v23, "initWithFirstColor:secondColor:", v24, v25);

  v26 = [HKGradientFillStyle alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_vitalsKeyColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "colorWithAlphaComponent:", 0.3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_vitalsKeyColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "colorWithAlphaComponent:", 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[HKGradientFillStyle initWithFirstColor:secondColor:](v26, "initWithFirstColor:secondColor:", v28, v30);

  v32 = objc_alloc_init(HKLineSeriesPresentationStyle);
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v16, 2.0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeriesPresentationStyle setStrokeStyle:](v32, "setStrokeStyle:");
  v101 = v32;
  -[HKLineSeriesPresentationStyle setWaveForm:](v32, "setWaveForm:", 0);
  v33 = v16;
  v34 = v100;
  if ((a10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_roundedSystemFontWithSize:weight:", 18.0, *MEMORY[0x1E0DC1438]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v100, "shouldDisplayUnitForAxisLabels"))
    {
      v36 = [HKDisplayTypeNumberFormatter alloc];
      -[HKInteractiveChartViewController unitPreferenceController](v99, "unitPreferenceController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[HKDisplayTypeNumberFormatter initWithDisplayType:unitController:](v36, "initWithDisplayType:unitController:", v96, v37);
    }
    else
    {
      -[HKInteractiveChartViewController unitPreferenceController](v99, "unitPreferenceController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "unitForDisplayType:", v96);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v96, "hk_numberFormatterForUnit:", v37);
      v38 = objc_claimAutoreleasedReturnValue();
    }
    v40 = (void *)v38;

    +[HKAxisLabelStyle labelStyleWithColor:font:horizontalAlignment:verticalAlignment:numberFormatter:](HKAxisLabelStyle, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:numberFormatter:", v33, v35, 0, 2, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLineSeriesPresentationStyle setAnnotationStyle:](v101, "setAnnotationStyle:", v41);

  }
  v42 = objc_alloc_init(HKLineSeriesPresentationStyle);
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v33, 2.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeriesPresentationStyle setStrokeStyle:](v42, "setStrokeStyle:", v43);

  -[HKLineSeriesPresentationStyle setFillStyle:](v42, "setFillStyle:", v97);
  -[HKLineSeriesPresentationStyle setWaveForm:](v42, "setWaveForm:", 0);
  v44 = objc_alloc_init(HKLineSeriesPresentationStyle);
  HKHealthKeyColor();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v45, 2.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeriesPresentationStyle setStrokeStyle:](v44, "setStrokeStyle:", v46);

  v47 = [HKLineSeriesPointMarkerStyle alloc];
  HKHealthKeyColor();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:](v47, "initWithColor:radius:style:", v48, 0, 4.0);

  v95 = (void *)v49;
  -[HKLineSeriesPresentationStyle setPointMarkerStyle:](v44, "setPointMarkerStyle:", v49);
  -[HKLineSeriesPresentationStyle setFillStyle:](v44, "setFillStyle:", v31);
  -[HKLineSeriesPresentationStyle setWaveForm:](v44, "setWaveForm:", 0);
  -[HKInteractiveChartViewController selectedTimeScopeController](v99, "selectedTimeScopeController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "selectedTimeScope");

  if ((a10 & 1) != 0)
  {
    v57 = 0;
  }
  else
  {
    v52 = ((unint64_t)a10 >> 2) & 1;
    v53 = v52 | objc_msgSend(v100, "lineChartFlatLastValueForTimeScope:", v51);
    -[HKLineSeries setFlatLastValue:](v22, "setFlatLastValue:", v53);
    v54 = objc_msgSend(v100, "lineChartExtendLastValueForTimeScope:", v51);
    -[HKLineSeries setExtendLastValue:](v22, "setExtendLastValue:", v52 | v54);
    v55 = objc_msgSend(v100, "lineChartExtendFirstValueForTimeScope:", v51);
    -[HKLineSeries setExtendFirstValue:](v22, "setExtendFirstValue:", v52 | v55);
    v56 = v54 | v55;
    v34 = v100;
    v57 = v53 | v56;
  }
  v58 = objc_msgSend(v34, "lineChartUsesPointMarkerImageForTimeScope:", v51);
  if ((v57 & 1) == 0 && v58)
  {
    v59 = 0.0;
    v60 = 0.0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend((id)objc_msgSend(v98, "performSelector:", sel_unselectedStrokeStyle), "lineWidth");
      v60 = v61;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend((id)objc_msgSend(v98, "performSelector:", sel_selectedStrokeStyle), "lineWidth");
      v59 = v62;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend((id)objc_msgSend(v98, "performSelector:", sel_strokeStyle), "lineWidth");
      v60 = v63;
      v59 = v63;
    }
    v64 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:]([HKLineSeriesPointMarkerStyle alloc], "initWithColor:radius:style:", v33, ~(a10 >> 3) & 1, v60 * 0.5);
    v65 = [HKLineSeriesPointMarkerStyle alloc];
    HKHealthKeyColor();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:](v65, "initWithColor:radius:style:", v66, 0, v59 * 0.5);

    -[HKLineSeriesPresentationStyle setPointMarkerStyle:](v101, "setPointMarkerStyle:", v64);
    -[HKLineSeriesPresentationStyle setPointMarkerStyle:](v42, "setPointMarkerStyle:", v95);
    -[HKLineSeries setSelectedPointMarkerStyle:](v22, "setSelectedPointMarkerStyle:", v67);

    v34 = v100;
  }
  v68 = objc_msgSend(v34, "lineChartUsesValueAxisAnnotationForTimeScope:", v51);
  if ((a10 & 1) == 0 && ((unint64_t)a10 >> 4) & 1 | v68)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_roundedSystemFontWithSize:weight:", 18.0, *MEMORY[0x1E0DC1438]);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "shouldDisplayUnitForAxisLabels"))
    {
      v70 = [HKDisplayTypeNumberFormatter alloc];
      -[HKInteractiveChartViewController unitPreferenceController](v99, "unitPreferenceController");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = -[HKDisplayTypeNumberFormatter initWithDisplayType:unitController:](v70, "initWithDisplayType:unitController:", v96, v71);
    }
    else
    {
      -[HKInteractiveChartViewController unitPreferenceController](v99, "unitPreferenceController");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "unitForDisplayType:", v96);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v96, "hk_numberFormatterForUnit:", v71);
      v72 = objc_claimAutoreleasedReturnValue();
    }
    v74 = (void *)v72;

    +[HKAxisLabelStyle labelStyleWithColor:font:horizontalAlignment:verticalAlignment:numberFormatter:](HKAxisLabelStyle, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:numberFormatter:", v33, v69, 0, 2, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLineSeriesPresentationStyle setAxisAnnotationStyle:](v101, "setAxisAnnotationStyle:", v75);
    -[HKLineSeriesPresentationStyle setAxisAnnotationStyle:](v42, "setAxisAnnotationStyle:", v75);
    -[HKLineSeriesPresentationStyle setAxisAnnotationStyle:](v44, "setAxisAnnotationStyle:", v75);

    v34 = v100;
  }
  v104[0] = v101;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 1, v33);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeries setUnhighlightedPresentationStyles:](v22, "setUnhighlightedPresentationStyles:", v76);

  v103 = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeries setHighlightedPresentationStyles:](v22, "setHighlightedPresentationStyles:", v77);

  v102 = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeries setSelectedPresentationStyles:](v22, "setSelectedPresentationStyles:", v78);

  objc_msgSend(v98, "yAxis");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphSeries setYAxis:](v22, "setYAxis:", v79);

  -[HKGraphSeries yAxis](v22, "yAxis");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "clearAnnotations");

  objc_msgSend(v98, "axisScalingRule");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphSeries setAxisScalingRule:](v22, "setAxisScalingRule:", v81);

  -[HKInteractiveChartOverlayViewController _dataSourceForQuantityType:timeScope:customDataSource:](v99, "_dataSourceForQuantityType:timeScope:customDataSource:", v89, v91, v90);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKGraphSeries setDataSource:](v22, "setDataSource:", v82);
  if (v94)
  {
    v83 = v94;
    v84 = v96;
  }
  else
  {
    v84 = v96;
    objc_msgSend(v96, "hk_interactiveChartsFormatterForTimeScope:", v91);
    v83 = (id)objc_claimAutoreleasedReturnValue();
  }
  v85 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:]([HKInteractiveChartDisplayType alloc], "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v22, v84, v83, objc_msgSend(v93, "code"));

  return v85;
}

- (id)displayTypeForGraphSeries:(id)a3 namedDataSource:(id)a4 templateDisplayType:(id)a5 timeScope:(int64_t)a6 formatter:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  HKInteractiveChartDisplayType *v15;
  void *v16;
  HKInteractiveChartDisplayType *v17;

  v11 = a7;
  v12 = a5;
  v13 = a3;
  -[HKInteractiveChartOverlayViewController _dataSourceForNamedDataSource:templateDisplayType:](self, "_dataSourceForNamedDataSource:templateDisplayType:", a4, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDataSource:", v14);

  v15 = [HKInteractiveChartDisplayType alloc];
  objc_msgSend(v12, "sampleType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:](v15, "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v13, v12, v11, objc_msgSend(v16, "code"));

  return v17;
}

- (void)cachedDataForQuantityDistributionStyle:(int64_t)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 namedPredicate:(id)a8 completion:(id)a9
{
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v16 = a9;
  v17 = a7;
  v18 = a6;
  -[HKInteractiveChartOverlayViewController _dataSourceForDistributionStyle:timeScope:namedPredicate:](self, "_dataSourceForDistributionStyle:timeScope:namedPredicate:", a3, a4, a8);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = 1;
  -[HKInteractiveChartOverlayViewController _deliverOrWaitForDataSource:graphSeriesContext:priorityDelegate:timeScope:resolution:startDate:endDate:queryIfNeeded:completion:](self, "_deliverOrWaitForDataSource:graphSeriesContext:priorityDelegate:timeScope:resolution:startDate:endDate:queryIfNeeded:completion:", v20, 0, 0, a4, a5, v18, v17, v19, v16);

}

- (void)cachedDataForQuantityIdentifier:(id)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 cacheDataSource:(id)a8 completion:(id)a9
{
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v16 = a9;
  v17 = a7;
  v18 = a6;
  -[HKInteractiveChartOverlayViewController _dataSourceForQuantityType:timeScope:customDataSource:](self, "_dataSourceForQuantityType:timeScope:customDataSource:", a3, a4, a8);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = 1;
  -[HKInteractiveChartOverlayViewController _deliverOrWaitForDataSource:graphSeriesContext:priorityDelegate:timeScope:resolution:startDate:endDate:queryIfNeeded:completion:](self, "_deliverOrWaitForDataSource:graphSeriesContext:priorityDelegate:timeScope:resolution:startDate:endDate:queryIfNeeded:completion:", v20, 0, 0, a4, a5, v18, v17, v19, v16);

}

- (void)cachedDataForCustomGraphSeries:(id)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a3;
  objc_msgSend(v17, "dataSource");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "seriesDataSourceContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = 1;
  -[HKInteractiveChartOverlayViewController _deliverOrWaitForDataSource:graphSeriesContext:priorityDelegate:timeScope:resolution:startDate:endDate:queryIfNeeded:completion:](self, "_deliverOrWaitForDataSource:graphSeriesContext:priorityDelegate:timeScope:resolution:startDate:endDate:queryIfNeeded:completion:", v20, v18, v17, a4, a5, v16, v15, v19, v14);

}

- (void)cachedDataForCustomGraphSeries:(id)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 queryIfNeeded:(BOOL)a8 completion:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;

  v16 = a9;
  v17 = a7;
  v18 = a6;
  v19 = a3;
  objc_msgSend(v19, "dataSource");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "seriesDataSourceContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = a8;
  -[HKInteractiveChartOverlayViewController _deliverOrWaitForDataSource:graphSeriesContext:priorityDelegate:timeScope:resolution:startDate:endDate:queryIfNeeded:completion:](self, "_deliverOrWaitForDataSource:graphSeriesContext:priorityDelegate:timeScope:resolution:startDate:endDate:queryIfNeeded:completion:", v22, v20, v19, a4, a5, v18, v17, v21, v16);

}

- (void)cachedDataForStandardDisplayType:(id)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  HKCacheBackedChartSeriesDataSource *v19;
  uint64_t v20;
  id v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a3;
  -[HKInteractiveChartViewController chartDataCacheController](self, "chartDataCacheController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "interactiveChartsCacheForDisplayType:timeScope:", v17, a4);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc_init(HKCacheBackedChartSeriesDataSource);
  -[HKCacheBackedChartSeriesDataSource setChartCache:](v19, "setChartCache:", v21);
  LOBYTE(v20) = 1;
  -[HKInteractiveChartOverlayViewController _deliverOrWaitForDataSource:graphSeriesContext:priorityDelegate:timeScope:resolution:startDate:endDate:queryIfNeeded:completion:](self, "_deliverOrWaitForDataSource:graphSeriesContext:priorityDelegate:timeScope:resolution:startDate:endDate:queryIfNeeded:completion:", v19, 0, 0, a4, a5, v16, v15, v20, v14);

}

- (void)_deliverOrWaitForDataSource:(id)a3 graphSeriesContext:(id)a4 priorityDelegate:(id)a5 timeScope:(int64_t)a6 resolution:(int64_t)a7 startDate:(id)a8 endDate:(id)a9 queryIfNeeded:(BOOL)a10 completion:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _BOOL4 v22;
  void *v23;
  id v24;

  v24 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  v21 = a11;
  v22 = -[HKInteractiveChartOverlayViewController _deliverCachedDataFromSource:graphSeriesContext:timeScope:resolution:startDate:endDate:completion:](self, "_deliverCachedDataFromSource:graphSeriesContext:timeScope:resolution:startDate:endDate:completion:", v24, v17, a6, a7, v19, v20, v21);
  if (v22 || !a10)
  {
    if (!v22 && !a10)
      (*((void (**)(id, _QWORD, uint64_t, _QWORD))v21 + 2))(v21, MEMORY[0x1E0C9AA60], 1, 0);
  }
  else
  {
    -[HKInteractiveChartOverlayViewController waitForCacheData](self, "waitForCacheData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addWaitForDataSource:graphSeriesContext:timeScope:resolution:startDate:endDate:priorityDelegate:completion:", v24, v17, a6, a7, v19, v20, v18, v21);

  }
}

- (double)minimumHeightForChart
{
  double v2;
  double v3;
  BOOL v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKInteractiveChartOverlayViewController;
  -[HKInteractiveChartViewController minimumHeightForChart](&v8, sel_minimumHeightForChart);
  v3 = v2;
  if (objc_msgSend(MEMORY[0x1E0DC3BF8], "hk_currentDeviceHas4InchScreen"))
  {
    v4 = objc_msgSend(MEMORY[0x1E0DC3BF8], "hk_currentDeviceHasDisplayZoomedEnabled") == 0;
    v5 = 280.0;
    v6 = 225.0;
  }
  else
  {
    if (!objc_msgSend(MEMORY[0x1E0DC3BF8], "hk_currentDeviceHas4Point7InchScreen"))
      return v3;
    v4 = objc_msgSend(MEMORY[0x1E0DC3BF8], "hk_currentDeviceHasDisplayZoomedEnabled") == 0;
    v5 = 390.0;
    v6 = 335.0;
  }
  if (v4)
    return v5;
  else
    return v6;
}

- (id)visibleRangeForTimeScope:(int64_t)a3 proposedRange:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[HKInteractiveChartOverlayViewController initialVisibleDateRange](self, "initialVisibleDateRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v5;
  if (v6)
  {
    -[HKInteractiveChartOverlayViewController initialVisibleDateRange](self, "initialVisibleDateRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKInteractiveChartOverlayViewController setInitialVisibleDateRange:](self, "setInitialVisibleDateRange:", 0);
  }

  return v7;
}

- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  HKDisplayType *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  unsigned int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController graphSeriesForDisplayType:timeScope:stackOffset:](self, "graphSeriesForDisplayType:timeScope:stackOffset:", v9, a4, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAllowsSelection:", 1);
  }
  else
  {
    -[HKInteractiveChartViewController graphSeriesForDisplayType:timeScope:stackOffset:](self, "graphSeriesForDisplayType:timeScope:stackOffset:", self->_overlayDisplayType, a4, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v11;
    if (v11)
      v24 = objc_msgSend(v11, "allowsSelection") ^ 1;
    else
      v24 = 0;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = v8;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = *(HKDisplayType **)(*((_QWORD *)&v25 + 1) + 8 * i);
          -[HKInteractiveChartViewController graphSeriesForDisplayType:timeScope:stackOffset:](self, "graphSeriesForDisplayType:timeScope:stackOffset:", v17, a4, a5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v17 != self->_overlayDisplayType)
            objc_msgSend(v18, "setAllowsSelection:", v24);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v14);
    }

    -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "graphView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      objc_msgSend(v21, "setMoveSelectedSeriesToFront:", 0);

    v8 = v23;
  }

}

- (id)_overlayChartCacheForDistributionStyle:(int64_t)a3 timeScope:(int64_t)a4 namedPredicate:(id)a5
{
  id v9;
  void *v10;
  __CFString *v11;
  _HKInteractiveChartDistributionStyleKey *v12;
  void *v13;
  HKChartCache *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  HKQuantityDistributionDataSource *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HKQuantityDistributionDataSource *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  _QWORD v40[5];

  v9 = a5;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "localizedNameKey");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_1E9C4C428;
  }
  v12 = -[_HKInteractiveChartDistributionStyleKey initWithDistributionStyle:timeScope:predicateName:]([_HKInteractiveChartDistributionStyleKey alloc], "initWithDistributionStyle:timeScope:predicateName:", a3, a4, v11);
  -[HKInteractiveChartOverlayViewController overlayChartCaches](self, "overlayChartCaches");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v12);
  v14 = (HKChartCache *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v39 = v11;
    -[HKInteractiveChartOverlayViewController primaryDisplayType](self, "primaryDisplayType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartOverlayViewController primaryDisplayType](self, "primaryDisplayType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKInteractiveChartOverlayViewController.m"), 722, CFSTR("Distribution overlay supported only for quantity types not %@"), v17);

    }
    v18 = v17;
    v37 = v18;
    -[HKInteractiveChartOverlayViewController primaryDisplayType](self, "primaryDisplayType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HKInteractiveChartOverlayViewController _displayTypeRequiresAverageAndDuration:](self, "_displayTypeRequiresAverageAndDuration:", v19);

    v21 = v20;
    if (objc_msgSend(v15, "contextItemShouldDisplayEventCountForDistributionStyle:", a3))
      v21 = v20 | 2;
    objc_msgSend(v18, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v15;
    v23 = (void *)*MEMORY[0x1E0CB5C78];

    if (v22 == v23)
      v24 = v21 | 4;
    else
      v24 = v21;
    v25 = [HKQuantityDistributionDataSource alloc];
    -[HKInteractiveChartViewController unitPreferenceController](self, "unitPreferenceController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController healthStore](self, "healthStore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartOverlayViewController primaryDisplayType](self, "primaryDisplayType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __107__HKInteractiveChartOverlayViewController__overlayChartCacheForDistributionStyle_timeScope_namedPredicate___block_invoke;
    v40[3] = &__block_descriptor_40_e48__24__0___HKQuantityDistributionData_8__HKUnit_16l;
    v40[4] = v24;
    v30 = -[HKQuantityDistributionDataSource initWithQuantityType:unitController:healthStore:contextStyle:predicate:options:baseDisplayType:specificStartDate:specificEndDate:userInfoCreationBlock:](v25, "initWithQuantityType:unitController:healthStore:contextStyle:predicate:options:baseDisplayType:specificStartDate:specificEndDate:userInfoCreationBlock:", v37, v26, v27, a3, v28, v24, v29, 0, 0, v40);

    v14 = objc_alloc_init(HKChartCache);
    -[HKChartCache setDataSource:](v14, "setDataSource:", v30);
    +[HKOutstandingFetchOperationManager sharedOperationManager](HKOutstandingFetchOperationManager, "sharedOperationManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKChartCache setOperationManager:](v14, "setOperationManager:", v31);

    -[HKInteractiveChartOverlayViewController overlayChartCaches](self, "overlayChartCaches");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKey:", v14, v12);

    -[HKInteractiveChartViewController chartDataCacheController](self, "chartDataCacheController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartOverlayViewController primaryDisplayType](self, "primaryDisplayType");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addCustomChartCache:forDisplayType:", v14, v34);

    v11 = v39;
  }

  return v14;
}

HKInteractiveChartSinglePointEventIdentifierData *__107__HKInteractiveChartOverlayViewController__overlayChartCacheForDistributionStyle_timeScope_namedPredicate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  HKInteractiveChartSinglePointEventIdentifierData *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  if ((*(_BYTE *)(a1 + 32) & 2) != 0)
  {
    v9 = a3;
    v10 = a2;
    v6 = objc_alloc_init(HKInteractiveChartSinglePointEventIdentifierData);
    objc_msgSend(v10, "minimumValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValueForUnit:", v9);
    -[HKInteractiveChartSinglePointData setMinValue:](v6, "setMinValue:");

    objc_msgSend(v10, "maximumValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValueForUnit:", v9);
    -[HKInteractiveChartSinglePointData setMaxValue:](v6, "setMaxValue:");

    -[HKInteractiveChartSinglePointData setUnit:](v6, "setUnit:", v9);
    -[HKInteractiveChartSinglePointData setRepresentsRange:](v6, "setRepresentsRange:", 1);
    objc_msgSend(v10, "contextIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKInteractiveChartSinglePointEventIdentifierData setIdentifiers:](v6, "setIdentifiers:", v13);
  }
  else
  {
    v4 = a3;
    v5 = a2;
    v6 = objc_alloc_init(HKInteractiveChartSinglePointData);
    objc_msgSend(v5, "minimumValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValueForUnit:", v4);
    -[HKInteractiveChartSinglePointData setMinValue:](v6, "setMinValue:");

    objc_msgSend(v5, "maximumValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "doubleValueForUnit:", v4);
    -[HKInteractiveChartSinglePointData setMaxValue:](v6, "setMaxValue:");

    -[HKInteractiveChartSinglePointData setUnit:](v6, "setUnit:", v4);
    -[HKInteractiveChartSinglePointData setRepresentsRange:](v6, "setRepresentsRange:", 1);
  }
  return v6;
}

- (BOOL)_displayTypeRequiresAverageAndDuration:(id)a3
{
  return objc_msgSend(a3, "categoryIdentifier") == 12;
}

- (id)_overlayChartCacheForDataSource:(id)a3 templateDisplayType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HKChartCache *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[HKInteractiveChartOverlayViewController customNamedCaches](self, "customNamedCaches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (HKChartCache *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v10 = objc_alloc_init(HKChartCache);
    objc_msgSend(v6, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKChartCache setDataSource:](v10, "setDataSource:", v11);

    +[HKOutstandingFetchOperationManager sharedOperationManager](HKOutstandingFetchOperationManager, "sharedOperationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKChartCache setOperationManager:](v10, "setOperationManager:", v12);

    -[HKInteractiveChartOverlayViewController customNamedCaches](self, "customNamedCaches");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v10, v14);

    -[HKInteractiveChartViewController chartDataCacheController](self, "chartDataCacheController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addCustomChartCache:forDisplayType:", v10, v7);

  }
  return v10;
}

- (id)_dataSourceForDistributionStyle:(int64_t)a3 timeScope:(int64_t)a4 namedPredicate:(id)a5
{
  void *v5;
  HKCacheBackedChartSeriesDataSource *v6;

  -[HKInteractiveChartOverlayViewController _overlayChartCacheForDistributionStyle:timeScope:namedPredicate:](self, "_overlayChartCacheForDistributionStyle:timeScope:namedPredicate:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(HKCacheBackedChartSeriesDataSource);
  -[HKCacheBackedChartSeriesDataSource setChartCache:](v6, "setChartCache:", v5);

  return v6;
}

- (id)_dataSourceForQuantityType:(id)a3 timeScope:(int64_t)a4 customDataSource:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HKCacheBackedChartSeriesDataSource *v15;

  v8 = a5;
  v9 = a3;
  -[HKInteractiveChartViewController displayTypeController](self, "displayTypeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "displayTypeForObjectType:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HKInteractiveChartOverlayViewController _overlayChartCacheForDataSource:templateDisplayType:](self, "_overlayChartCacheForDataSource:templateDisplayType:", v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKInteractiveChartViewController chartDataCacheController](self, "chartDataCacheController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "interactiveChartsCacheForDisplayType:timeScope:", v12, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = objc_alloc_init(HKCacheBackedChartSeriesDataSource);
  -[HKCacheBackedChartSeriesDataSource setChartCache:](v15, "setChartCache:", v13);

  return v15;
}

- (id)_dataSourceForNamedDataSource:(id)a3 templateDisplayType:(id)a4
{
  void *v4;
  HKCacheBackedChartSeriesDataSource *v5;

  -[HKInteractiveChartOverlayViewController _overlayChartCacheForDataSource:templateDisplayType:](self, "_overlayChartCacheForDataSource:templateDisplayType:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(HKCacheBackedChartSeriesDataSource);
  -[HKCacheBackedChartSeriesDataSource setChartCache:](v5, "setChartCache:", v4);

  return v5;
}

- (BOOL)_deliverCachedDataFromSource:(id)a3 graphSeriesContext:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 startDate:(id)a7 endDate:(id)a8 completion:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  int v18;
  BOOL v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  BOOL v32;
  id v33;
  int64_t v34;
  int64_t v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  int64_t v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  int64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v37 = a4;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v50 = 0uLL;
  v51 = 0;
  if (v14)
  {
    objc_msgSend(v14, "blockPathForX:zoom:resolution:", v15, a5, a6);
    v48 = 0uLL;
    v49 = 0;
    objc_msgSend(v14, "blockPathForX:zoom:resolution:", v16, a5, a6);
  }
  else
  {
    v48 = 0uLL;
    v49 = 0;
  }
  v46 = v50;
  v47 = v51;
  v44 = v48;
  v45 = v49;
  v18 = objc_msgSend(v14, "hasAllBlocksAvailableBetweenStartPath:endPath:", &v46, &v44);
  v19 = v18;
  if (v18)
  {
    v32 = v18;
    v33 = v17;
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = v50;
    if ((uint64_t)v50 <= (uint64_t)v48)
    {
      v35 = a6;
      v36 = v14;
      v34 = a5;
      do
      {
        v39 = v21;
        *(_QWORD *)&v46 = v21;
        *((_QWORD *)&v46 + 1) = a5;
        v47 = a6;
        objc_msgSend(v14, "cachedBlockForPath:context:", &v46, v37);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v38 = v22;
        objc_msgSend(v22, "chartPoints");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v41 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
              objc_msgSend(v28, "minXValueAsGenericType");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "maxXValueAsGenericType");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v30, "hk_isBeforeDate:", v15) & 1) == 0
                && (objc_msgSend(v29, "hk_isAfterDate:", v16) & 1) == 0)
              {
                objc_msgSend(v20, "addObject:", v28);
              }

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
          }
          while (v25);
        }

        v21 = v39 + 1;
        a6 = v35;
        v14 = v36;
        a5 = v34;
      }
      while (v39 < (uint64_t)v48);
    }
    v17 = v33;
    (*((void (**)(id, id, uint64_t, _QWORD))v33 + 2))(v33, v20, 1, 0);

    v19 = v32;
  }

  return v19;
}

- (id)lollipopAnnotationColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopBackgroundColor");
}

- (id)lollipopExtensionColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopStickColor");
}

- (id)seriesSelectionLineColorForGraphView:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopStickColor", a3);
}

- (HKDisplayType)primaryDisplayType
{
  return self->_primaryDisplayType;
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(int64_t)a3
{
  self->_displayMode = a3;
}

- (HKValueRange)initialVisibleDateRange
{
  return self->_initialVisibleDateRange;
}

- (void)setInitialVisibleDateRange:(id)a3
{
  objc_storeStrong((id *)&self->_initialVisibleDateRange, a3);
}

- (HKDisplayType)overlayDisplayType
{
  return self->_overlayDisplayType;
}

- (void)setOverlayDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_overlayDisplayType, a3);
}

- (UIColor)currentOverlayColor
{
  return self->_currentOverlayColor;
}

- (void)setCurrentOverlayColor:(id)a3
{
  objc_storeStrong((id *)&self->_currentOverlayColor, a3);
}

- (NSMutableDictionary)overlayChartCaches
{
  return self->_overlayChartCaches;
}

- (void)setOverlayChartCaches:(id)a3
{
  objc_storeStrong((id *)&self->_overlayChartCaches, a3);
}

- (NSMutableDictionary)customNamedCaches
{
  return self->_customNamedCaches;
}

- (void)setCustomNamedCaches:(id)a3
{
  objc_storeStrong((id *)&self->_customNamedCaches, a3);
}

- (_HKInteractiveChartOverlayWaitForCacheData)waitForCacheData
{
  return self->_waitForCacheData;
}

- (void)setWaitForCacheData:(id)a3
{
  objc_storeStrong((id *)&self->_waitForCacheData, a3);
}

- (HKDisplayType)stackedDisplayType
{
  return self->_stackedDisplayType;
}

- (void)setStackedDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_stackedDisplayType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackedDisplayType, 0);
  objc_storeStrong((id *)&self->_waitForCacheData, 0);
  objc_storeStrong((id *)&self->_customNamedCaches, 0);
  objc_storeStrong((id *)&self->_overlayChartCaches, 0);
  objc_storeStrong((id *)&self->_currentOverlayColor, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_initialVisibleDateRange, 0);
  objc_storeStrong((id *)&self->_primaryDisplayType, 0);
}

- (void)displayTypeForQuantityDistributionStyle:(uint64_t)a1 timeScope:(NSObject *)a2 overlayColor:options:alternateFormatter:namedPredicate:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D7813000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Unable to determine the base series for an overlay", (uint8_t *)&v2, 0xCu);
}

@end
