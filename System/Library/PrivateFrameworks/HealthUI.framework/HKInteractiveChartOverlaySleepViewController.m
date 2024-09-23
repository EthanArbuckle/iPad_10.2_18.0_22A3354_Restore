@implementation HKInteractiveChartOverlaySleepViewController

- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5
{
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKInteractiveChartOverlaySleepViewController;
  -[HKInteractiveChartOverlayViewController configureDisplayTypes:timeScope:stackOffset:](&v8, sel_configureDisplayTypes_timeScope_stackOffset_, a3, a4, a5);
  -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "graphView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setScrollingOptions:", 1);
}

- (int64_t)defaultAlignmentForTimeScope:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  if (a3 == 6)
  {
    -[HKInteractiveChartViewController currentOverlayLocationProvider](self, "currentOverlayLocationProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "segmentedControlSelectedIndex");
    v7 = HKIndexForOverlaySleepRoomSegment(2);

    if (v6 == v7)
      return 4;
  }
  v9.receiver = self;
  v9.super_class = (Class)HKInteractiveChartOverlaySleepViewController;
  return -[HKInteractiveChartViewController defaultAlignmentForTimeScope:](&v9, sel_defaultAlignmentForTimeScope_, a3);
}

- (id)makePrimaryGraphViewControllerWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  HKDateGraphViewController *v16;

  v10 = a6;
  -[HKInteractiveChartViewController currentOverlayLocationProvider](self, "currentOverlayLocationProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "segmentedControlSelectedIndex");
  -[HKInteractiveChartViewController currentOverlayLocationProvider](self, "currentOverlayLocationProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectedContextLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartOverlaySleepViewController _customDateAxisForTimeScope:segmentIndex:sectionIndex:currentCalendar:](self, "_customDateAxisForTimeScope:segmentIndex:sectionIndex:currentCalendar:", a3, v12, objc_msgSend(v14, "sectionIndex"), v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[HKDateGraphViewController initWithDateZoom:previousDateZoom:previousXAxisSpace:currentCalendar:customDateAxis:]([HKDateGraphViewController alloc], "initWithDateZoom:previousDateZoom:previousXAxisSpace:currentCalendar:customDateAxis:", a3, a4, v10, v15, a5);
  return v16;
}

- (id)_dayTimeScopeDateAxisStyleWithTextAlignment:(int64_t)a3 hyphenationFactor:(id)a4
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
  void *v14;

  v5 = a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v7, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAxisLineStyle:", v8);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartAxisLabelFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKAxisLabelStyle labelStyleWithColor:font:horizontalAlignment:verticalAlignment:hyphenationFactor:](HKAxisLabelStyle, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:hyphenationFactor:", v7, v9, a3, 3, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLabelStyle:", v10);
  objc_msgSend(v6, "setTickPositions:", 0);
  objc_msgSend(v6, "setAxisLabelPosition:", 1);
  objc_msgSend(v6, "setShowGridLines:", 1);
  objc_msgSend(v6, "setLocation:", 2);
  objc_msgSend(v6, "setFillInnerPadding:", 3.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartGrayGraphColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisMajorGridColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v12, 0.5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDashStyle:", 1);
  objc_msgSend(v6, "setGridLineStyle:", v13);
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v11, 0.5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDashStyle:", 0);
  objc_msgSend(v6, "setReferenceGridLineStyle:", v14);

  return v6;
}

- (id)addNoDataEntries:(id)a3 timeScope:(int64_t)a4 targetSeries:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  HKAccessibilityPointData *v32;
  void *v33;
  HKAccessibilityPointData *v34;
  objc_super v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (-[HKInteractiveChartOverlaySleepViewController _isSleepSeries:](self, "_isSleepSeries:", v9)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v8, "count"))
    {
      -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "graphView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "xAxis");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "graphView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "effectiveVisibleRangeActive");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "startDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "graphView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "effectiveVisibleRangeActive");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "endDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "transform");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "coordinateForValue:", v19);
      v26 = v25;

      objc_msgSend(v15, "pointTransform");
      v29 = HKLinearTransformValue(v27, v28, v26);
      +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v19, v23);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKInteractiveChartOverlaySleepViewController stringForValueRange:timeScope:](self, "stringForValueRange:timeScope:", v30, 5);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = [HKAccessibilityPointData alloc];
      HKUIMidDate(v19, v23);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[HKAccessibilityPointData initWithHorizontalScreenCoordinate:horizontalTimeCoordinate:horizontalDate:values:](v32, "initWithHorizontalScreenCoordinate:horizontalTimeCoordinate:horizontalDate:values:", v31, v33, 0, v29);

      v36[0] = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    v10 = v8;
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)HKInteractiveChartOverlaySleepViewController;
    -[HKInteractiveChartViewController addNoDataEntries:timeScope:targetSeries:](&v35, sel_addNoDataEntries_timeScope_targetSeries_, v8, a4, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
LABEL_8:

  return v11;
}

- (id)descriptionForStartX:(double)a3 endX:(double)a4 chartData:(id)a5 timeScope:(int64_t)a6 resolution:(int64_t)a7 graphView:(id)a8
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  objc_super v22;
  objc_super v23;
  objc_super v24;

  v14 = a5;
  v15 = a8;
  if (a6 == 6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16 = v14;
    v17 = objc_msgSend(v16, "seriesType");
    if (v17 == 4)
    {
      objc_msgSend(v16, "annotationOverrideDateRange");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        -[HKInteractiveChartOverlaySleepViewController stringForValueRange:timeScope:](self, "stringForValueRange:timeScope:", v19, 6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22.receiver = self;
        v22.super_class = (Class)HKInteractiveChartOverlaySleepViewController;
        -[HKInteractiveChartViewController replaceRangeClause:](&v22, sel_replaceRangeClause_, v20);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = &stru_1E9C4C428;
      }

    }
    else if (v17 == 6)
    {
      v23.receiver = self;
      v23.super_class = (Class)HKInteractiveChartOverlaySleepViewController;
      -[HKInteractiveChartViewController descriptionForStartX:endX:chartData:timeScope:resolution:graphView:](&v23, sel_descriptionForStartX_endX_chartData_timeScope_resolution_graphView_, v16, 6, a7, v15, a3, a4);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = &stru_1E9C4C428;
    }

  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)HKInteractiveChartOverlaySleepViewController;
    -[HKInteractiveChartViewController descriptionForStartX:endX:chartData:timeScope:resolution:graphView:](&v24, sel_descriptionForStartX_endX_chartData_timeScope_resolution_graphView_, v14, a6, a7, v15, a3, a4);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (BOOL)_isSleepSeries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  v10[2] = objc_opt_class();
  v10[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__HKInteractiveChartOverlaySleepViewController__isSleepSeries___block_invoke;
  v8[3] = &unk_1E9C43480;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "hk_filter:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v6 != 0;

  return (char)v3;
}

uint64_t __63__HKInteractiveChartOverlaySleepViewController__isSleepSeries___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (void)graphView:(id)a3 didUpdateSeries:(id)a4 newDataArrived:(BOOL)a5 changeContext:(int64_t)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v7 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKInteractiveChartOverlaySleepViewController;
  -[HKInteractiveChartViewController graphView:didUpdateSeries:newDataArrived:changeContext:](&v18, sel_graphView_didUpdateSeries_newDataArrived_changeContext_, a3, v10, v7, a6);
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      _HKInitializeLogging();
      v11 = (void *)*MEMORY[0x1E0CB5368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        v13 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v20 = v13;
        v14 = v13;
        _os_log_impl(&dword_1D7813000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating x axis labels for the stage day series", buf, 0xCu);

      }
      -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "graphView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "xAxis");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "invalidateAxisLabelCache");

    }
  }

}

- (id)dateRangeFromSelectionContext:(id)a3 timeScope:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "annotationOverrideDateRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)updateSelectionAnnotationDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v10 = a4;
  -[HKInteractiveChartViewController currentOverlayLocationProvider](self, "currentOverlayLocationProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "segmentedControlSelectedIndex");
  -[HKInteractiveChartViewController currentOverlayLocationProvider](self, "currentOverlayLocationProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectedContextLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKInteractiveChartOverlaySleepViewController effectiveAnnotationTimeScopeForTimeScope:displayType:segmentIndex:sectionIndex:](self, "effectiveAnnotationTimeScopeForTimeScope:displayType:segmentIndex:sectionIndex:", a5, v10, v12, objc_msgSend(v14, "sectionIndex"));

  -[HKInteractiveChartViewController annotationDataSource](self, "annotationDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v12) = objc_opt_isKindOfClass();

  if ((v12 & 1) != 0)
  {
    -[HKInteractiveChartViewController annotationDataSource](self, "annotationDataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController healthStore](self, "healthStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateWithSelectionContext:displayType:timeScope:resolution:healthStore:viewController:", v19, v10, v15, a6, v18, self);

  }
}

- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  int64_t v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  objc_msgSend(v6, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  if (v10 >= 86400.0 && a4 == 6)
    v12 = 5;
  else
    v12 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKInteractiveChartOverlaySleepViewController;
  -[HKInteractiveChartViewController stringForValueRange:timeScope:](&v15, sel_stringForValueRange_timeScope_, v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (int64_t)effectiveAnnotationTimeScopeForTimeScope:(int64_t)a3 displayType:(id)a4 segmentIndex:(int64_t)a5 sectionIndex:(int64_t)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v9 = a4;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "sampleType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "code") == 5)
    {

      goto LABEL_11;
    }
    objc_msgSend(v10, "sampleType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "code");

    if (v13 == 61)
      goto LABEL_11;
  }
  if (a3 == 6
    && (HKIndexForOverlaySleepRoomSegment(0) == a5
     || HKIndexForOverlaySleepRoomSegment(2) == a5
     || a6 == 1 && HKIndexForOverlaySleepRoomSegment(1) == a5))
  {
    a3 = 5;
  }
LABEL_11:

  return a3;
}

- (id)_customDateAxisForTimeScope:(int64_t)a3 segmentIndex:(int64_t)a4 sectionIndex:(int64_t)a5 currentCalendar:(id)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  int64_t v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x1E0CB5368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v17 = 138544130;
    v18 = (id)objc_opt_class();
    v19 = 2048;
    v20 = a3;
    v21 = 2048;
    v22 = a4;
    v23 = 2048;
    v24 = a5;
    v13 = v18;
    _os_log_impl(&dword_1D7813000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating date axis for timeScope: %ld segmentIndex: %ld sectionIndex: %ld", (uint8_t *)&v17, 0x2Au);

  }
  if (a3 != 6)
    goto LABEL_14;
  if (HKIndexForOverlaySleepRoomSegment(0) != a4)
  {
    if (HKIndexForOverlaySleepRoomSegment(2) == a4)
    {
      -[HKInteractiveChartOverlaySleepViewController _sleepComparisonDayAxisWithCalendar:](self, "_sleepComparisonDayAxisWithCalendar:", v10);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (a5 == 1 && HKIndexForOverlaySleepRoomSegment(1) == a4)
    {
      -[HKInteractiveChartOverlaySleepViewController _sleepStageDurationDayAxisWithCalendar:](self, "_sleepStageDurationDayAxisWithCalendar:", v10);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (HKIndexForOverlaySleepRoomSegment(1) == a4)
    {
      -[HKInteractiveChartOverlaySleepViewController _sleepStageDayAxisWithCalendar:](self, "_sleepStageDayAxisWithCalendar:", v10);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  -[HKInteractiveChartOverlaySleepViewController _sleepAnalysisDayAxisWithCalendar:](self, "_sleepAnalysisDayAxisWithCalendar:", v10);
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v15 = (void *)v14;
LABEL_15:

  return v15;
}

- (id)_sleepAnalysisDayAxisWithCalendar:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HKCategoricalDateAxis *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TIME_IN_BED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TIME_ASLEEP"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartOverlaySleepViewController _dayTimeScopeDateAxisStyleWithTextAlignment:hyphenationFactor:](self, "_dayTimeScopeDateAxisStyleWithTextAlignment:hyphenationFactor:", 1, &unk_1E9CED538);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKCategoricalDateAxis initWithCurrentCalendar:axisStyle:categoryTitles:]([HKCategoricalDateAxis alloc], "initWithCurrentCalendar:axisStyle:categoryTitles:", v5, v11, v10);

  return v12;
}

- (id)_sleepComparisonDayAxisWithCalendar:(id)a3
{
  id v4;
  void *v5;
  _HKSleepComparisonDayAxis *v6;

  v4 = a3;
  -[HKInteractiveChartOverlaySleepViewController _dayTimeScopeDateAxisStyleWithTextAlignment:hyphenationFactor:](self, "_dayTimeScopeDateAxisStyleWithTextAlignment:hyphenationFactor:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKDateAxis initWithCurrentCalendar:axisStyle:]([_HKSleepComparisonDayAxis alloc], "initWithCurrentCalendar:axisStyle:", v4, v5);

  return v6;
}

- (id)_sleepStageDurationDayAxisWithCalendar:(id)a3
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
  void *v13;
  HKCategoricalDateAxis *v14;
  id v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB34D0];
  v17 = a3;
  objc_msgSend(v3, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("STAGES_DURATION_DAY_AXIS_LABEL_AWAKE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("STAGES_DURATION_DAY_AXIS_LABEL_REM"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STAGES_DURATION_DAY_AXIS_LABEL_CORE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v9;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("STAGES_DURATION_DAY_AXIS_LABEL_DEEP"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartOverlaySleepViewController _dayTimeScopeDateAxisStyleWithTextAlignment:hyphenationFactor:](self, "_dayTimeScopeDateAxisStyleWithTextAlignment:hyphenationFactor:", 1, &unk_1E9CED538);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKCategoricalDateAxis initWithCurrentCalendar:axisStyle:categoryTitles:]([HKCategoricalDateAxis alloc], "initWithCurrentCalendar:axisStyle:categoryTitles:", v17, v13, v12);

  return v14;
}

- (id)_sleepStageDayAxisWithCalendar:(id)a3
{
  id v4;
  void *v5;
  HKSleepStageDayAxis *v6;

  v4 = a3;
  -[HKInteractiveChartOverlaySleepViewController _dayTimeScopeDateAxisStyleWithTextAlignment:hyphenationFactor:](self, "_dayTimeScopeDateAxisStyleWithTextAlignment:hyphenationFactor:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKDateAxis initWithCurrentCalendar:axisStyle:]([HKSleepStageDayAxis alloc], "initWithCurrentCalendar:axisStyle:", v4, v5);

  -[HKSleepStageDayAxis setDelegate:](v6, "setDelegate:", self);
  return v6;
}

- (id)sleepDaySummaryForDate:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_semaphore_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  dispatch_time_t v18;
  os_log_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  os_log_t v24;
  NSObject *v25;
  id v27;
  _QWORD v28[5];
  NSObject *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _BYTE v37[32];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (os_log_t *)MEMORY[0x1E0CB5368];
  v6 = (void *)*MEMORY[0x1E0CB5368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEBUG))
    -[HKInteractiveChartOverlaySleepViewController(HKSleepStageDayAxisDelegate) sleepDaySummaryForDate:].cold.4(v6, (uint64_t)self, v4);
  -[HKInteractiveChartOverlayViewController primaryDisplayType](self, "primaryDisplayType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HKInteractiveChartOverlayViewController primaryDisplayType](self, "primaryDisplayType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "graphSeriesForTimeScope:", 6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v10;
      -[HKInteractiveChartViewController currentCalendar](self, "currentCalendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startOfDayForDate:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v12, 86400.0);
      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__12;
      v35 = __Block_byref_object_dispose__12;
      v36 = 0;
      v14 = dispatch_semaphore_create(0);
      objc_msgSend(v13, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __100__HKInteractiveChartOverlaySleepViewController_HKSleepStageDayAxisDelegate__sleepDaySummaryForDate___block_invoke;
      v28[3] = &unk_1E9C434A8;
      v30 = &v31;
      v28[4] = self;
      v17 = v14;
      v29 = v17;
      -[HKInteractiveChartOverlayViewController cachedDataForCustomGraphSeries:timeScope:resolution:startDate:endDate:queryIfNeeded:completion:](self, "cachedDataForCustomGraphSeries:timeScope:resolution:startDate:endDate:queryIfNeeded:completion:", v27, 6, 0, v15, v16, 0, v28);

      v18 = dispatch_time(0, 250000000);
      dispatch_semaphore_wait(v17, v18);
      _HKInitializeLogging();
      v19 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
      {
        v20 = v19;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v21 = (id)objc_opt_class();
          objc_msgSend(v4, "description");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKInteractiveChartOverlaySleepViewController(HKSleepStageDayAxisDelegate) sleepDaySummaryForDate:].cold.1(v21, v22, (uint64_t)v37, v20);
        }

      }
      v23 = (id)v32[5];

      _Block_object_dispose(&v31, 8);
    }
    else
    {
      _HKInitializeLogging();
      v25 = *v5;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[HKInteractiveChartOverlaySleepViewController(HKSleepStageDayAxisDelegate) sleepDaySummaryForDate:].cold.2(v25, (uint64_t)self, v10);
      v23 = 0;
    }

  }
  else
  {
    _HKInitializeLogging();
    v24 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      -[HKInteractiveChartOverlaySleepViewController(HKSleepStageDayAxisDelegate) sleepDaySummaryForDate:].cold.3(v24);
    v23 = 0;
  }

  return v23;
}

void __100__HKInteractiveChartOverlaySleepViewController_HKSleepStageDayAxisDelegate__sleepDaySummaryForDate___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a4;
  if (a3)
  {
    objc_msgSend(a2, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "sleepDaySummary");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    else if (v9)
    {
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x1E0CB5368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_ERROR))
        __100__HKInteractiveChartOverlaySleepViewController_HKSleepStageDayAxisDelegate__sleepDaySummaryForDate___block_invoke_cold_1(a1, v14);
    }

  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x1E0CB5368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_ERROR))
      __100__HKInteractiveChartOverlaySleepViewController_HKSleepStageDayAxisDelegate__sleepDaySummaryForDate___block_invoke_cold_2(a1, v13, (uint64_t)v7);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __100__HKInteractiveChartOverlaySleepViewController_HKSleepStageDayAxisDelegate__sleepDaySummaryForDate___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)objc_opt_class();
  v4 = OUTLINED_FUNCTION_3(v3);
  OUTLINED_FUNCTION_3_6(&dword_1D7813000, v2, v5, "[%{public}@] Fetched user info was of wrong type, expected HKSleepChartPointUserInfo", v6);

  OUTLINED_FUNCTION_1();
}

void __100__HKInteractiveChartOverlaySleepViewController_HKSleepStageDayAxisDelegate__sleepDaySummaryForDate___block_invoke_cold_2(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v7 = 138543618;
  v8 = (id)OUTLINED_FUNCTION_2_4();
  v9 = 2114;
  v10 = a3;
  v5 = v8;
  OUTLINED_FUNCTION_4_2(&dword_1D7813000, v4, v6, "[%{public}@] Error fetching cached data for sleep stage day axis %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_0_2();
}

@end
