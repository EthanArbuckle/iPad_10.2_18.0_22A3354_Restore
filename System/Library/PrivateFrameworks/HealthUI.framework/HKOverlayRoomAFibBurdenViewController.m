@implementation HKOverlayRoomAFibBurdenViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  HKOverlayRoomAFibBurdenViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  HKOverlayRoomAFibBurdenViewController *v26;
  void *v27;
  HKOverlayRoomAFibBurdenViewController *v28;
  void *v29;
  HKOverlayRoomFactorAndTrendViewController *v30;
  void *v32;
  void *v33;
  id v36;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v36 = a9;
  v18 = a10;
  v19 = a8;
  objc_msgSend(v15, "sleepDataSourceProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKOverlayRoomAFibBurdenViewController.m"), 80, CFSTR("The AFib Burden experience requires an externally provided data source provider."));

  }
  objc_msgSend(v15, "sleepChartFormatter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKOverlayRoomAFibBurdenViewController.m"), 81, CFSTR("The AFib Burden experience requires an externally provided sleep chart formatter."));

  }
  v22 = [HKOverlayRoomAFibBurdenViewController alloc];
  objc_msgSend(v15, "sleepDataSourceProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sleepChartFormatter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addDataViewControllerProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v22;
  v27 = v17;
  v28 = -[HKOverlayRoomAFibBurdenViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:sleepDataSourceProvider:sleepChartFormatter:preferredOverlay:addDataViewControllerProvider:](v26, "initWithDisplayDate:applicationItems:factorDisplayTypes:mode:sleepDataSourceProvider:sleepChartFormatter:preferredOverlay:addDataViewControllerProvider:", v17, v16, v18, 0, v23, v24, a7, v25);

  -[HKOverlayRoomViewController setRestorationUserActivity:](v28, "setRestorationUserActivity:", v19);
  -[HKOverlayRoomViewController setAdditionalChartOptions:](v28, "setAdditionalChartOptions:", a11);
  if (v36)
  {
    -[HKOverlayRoomAFibBurdenViewController primaryDisplayTypeWithApplicationItems:](v28, "primaryDisplayTypeWithApplicationItems:", v16);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[HKOverlayRoomFactorAndTrendViewController initWithBaseChartDisplayType:trendModel:factorDisplayTypes:displayDate:applicationItems:mode:timeScopeRanges:initialTimeScope:wrappedOverlay:overrideFirstWeekday:overrideCalendar:additionalChartOptions:]([HKOverlayRoomFactorAndTrendViewController alloc], "initWithBaseChartDisplayType:trendModel:factorDisplayTypes:displayDate:applicationItems:mode:timeScopeRanges:initialTimeScope:wrappedOverlay:overrideFirstWeekday:overrideCalendar:additionalChartOptions:", v29, v36, v18, v27, v16, 1, 0, 8, v28, -1, 0, a11);

  }
  else
  {
    v30 = v28;
  }

  return v30;
}

- (HKOverlayRoomAFibBurdenViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6 sleepDataSourceProvider:(id)a7 sleepChartFormatter:(id)a8 preferredOverlay:(int64_t)a9 addDataViewControllerProvider:(id)a10
{
  id v16;
  id v17;
  id v18;
  HKOverlayRoomAFibBurdenViewController *v19;
  HKOverlayRoomAFibBurdenViewController *v20;
  NSNumber *preferredOverlayIndex;
  NSCalendar *v22;
  NSCalendar *currentCalendar;
  NSCalendar *v24;
  HKInteractiveChartDisplayType *v25;
  HKInteractiveChartDisplayType *afibBurdenDisplayType;
  HKInteractiveChartDisplayType *v27;
  uint64_t v28;
  OS_dispatch_queue *analyticsSubmissionQueue;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  HKAnalyticsEventSubmissionManager *analyticsEventSubmissionManager;
  id v36;
  objc_super v37;

  v16 = a4;
  v36 = a7;
  v17 = a8;
  v18 = a10;
  v37.receiver = self;
  v37.super_class = (Class)HKOverlayRoomAFibBurdenViewController;
  v19 = -[HKOverlayRoomViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:](&v37, sel_initWithDisplayDate_applicationItems_factorDisplayTypes_mode_, a3, v16, a5, a6);
  v20 = v19;
  if (v19)
  {
    preferredOverlayIndex = v19->_preferredOverlayIndex;
    v19->_preferredOverlayIndex = 0;

    v20->_preferredOverlay = a9;
    objc_storeStrong((id *)&v20->_sleepDataSourceProvider, a7);
    objc_storeStrong((id *)&v20->_sleepChartFormatter, a8);
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
    v22 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setFirstWeekday:](v22, "setFirstWeekday:", 2);
    currentCalendar = v20->_currentCalendar;
    v20->_currentCalendar = v22;
    v24 = v22;

    -[HKOverlayRoomViewController setShouldSelectInitialOverlay:](v20, "setShouldSelectInitialOverlay:", a6 == 3);
    -[HKOverlayRoomAFibBurdenViewController _generateAFibBurdenDisplayTypeWithApplicationItems:mode:](v20, "_generateAFibBurdenDisplayTypeWithApplicationItems:mode:", v16, a6);
    v25 = (HKInteractiveChartDisplayType *)objc_claimAutoreleasedReturnValue();
    afibBurdenDisplayType = v20->_afibBurdenDisplayType;
    v20->_afibBurdenDisplayType = v25;
    v27 = v25;

    objc_storeStrong((id *)&v20->_addDataViewControllerProvider, a10);
    HKCreateSerialDispatchQueue();
    v28 = objc_claimAutoreleasedReturnValue();
    analyticsSubmissionQueue = v20->_analyticsSubmissionQueue;
    v20->_analyticsSubmissionQueue = (OS_dispatch_queue *)v28;

    v30 = objc_alloc(MEMORY[0x1E0CB62B8]);
    HKLogAFibBurden();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "healthStore");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v30, "initWithLoggingCategory:healthDataSource:", v31, v32);
    analyticsEventSubmissionManager = v20->_analyticsEventSubmissionManager;
    v20->_analyticsEventSubmissionManager = (HKAnalyticsEventSubmissionManager *)v33;

  }
  return v20;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HKOverlayRoomAFibBurdenViewController;
  -[HKOverlayRoomViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (id)_generateAFibBurdenDisplayTypeWithApplicationItems:(id)a3 mode:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HKInteractiveChartAFibBurdenFormatter *v11;
  void *v12;
  void *v13;
  void *v14;
  HKInteractiveChartDisplayType *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB6A70];
  v7 = a3;
  objc_msgSend(v6, "_quantityTypeWithCode:", 248);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayTypeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayTypeForObjectType:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(HKInteractiveChartAFibBurdenFormatter);
  -[HKOverlayRoomAFibBurdenViewController _aFibBurdenSeriesForTimeScope:displayType:mode:applicationItems:](self, "_aFibBurdenSeriesForTimeScope:displayType:mode:applicationItems:", 4, v10, a4, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomAFibBurdenViewController _aFibBurdenSeriesForTimeScope:displayType:mode:applicationItems:](self, "_aFibBurdenSeriesForTimeScope:displayType:mode:applicationItems:", 3, v10, a4, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = &unk_1E9CEAC58;
  v17[1] = &unk_1E9CEAC70;
  v18[0] = v12;
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKInteractiveChartDisplayType initWithBaseDisplayType:valueFormatter:dataTypeCode:seriesForTimeScopeMapping:]([HKInteractiveChartDisplayType alloc], "initWithBaseDisplayType:valueFormatter:dataTypeCode:seriesForTimeScopeMapping:", v10, v11, 248, v14);

  return v15;
}

- (id)_aFibBurdenSeriesForTimeScope:(int64_t)a3 displayType:(id)a4 mode:(int64_t)a5 applicationItems:(id)a6
{
  id v10;
  uint64_t v11;
  id v12;
  HKNumericAxisConfiguration *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (a5 == 3)
    v11 = 3;
  else
    v11 = 5;
  v12 = a6;
  v13 = objc_alloc_init(HKNumericAxisConfiguration);
  -[HKAxisConfiguration setMinLabels:](v13, "setMinLabels:", v11);
  -[HKAxisConfiguration setMaxLabels:](v13, "setMaxLabels:", v11);
  if (-[HKOverlayRoomViewController controllerMode](self, "controllerMode") == 3)
  {
    -[HKNumericAxisConfiguration setTopVerticalLabelPadding:](v13, "setTopVerticalLabelPadding:", 4.0);
    -[HKNumericAxisConfiguration setBottomVerticalLabelPadding:](v13, "setBottomVerticalLabelPadding:", 2.0);
  }
  objc_msgSend(v10, "displayCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unitController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "chartDataCacheController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "hk_standardSeriesForTimeScope:displayCategory:unitController:dataCacheController:numericAxisConfigurationOverrides:", a3, v14, v15, v16, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 50.0;
  if (a5 != 3)
    v19 = 100.0;
  objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v18, 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v18, 100.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v21, v22);
  v23 = objc_claimAutoreleasedReturnValue();
  +[HKQuantityMinimumRangeAxisScalingRule ruleWithDefaultYAxisRange:minimumValue:maximumValue:axisRangeOverrides:](HKQuantityMinimumRangeAxisScalingRule, "ruleWithDefaultYAxisRange:minimumValue:maximumValue:axisRangeOverrides:", v20, v21, v22, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)v23;
  objc_msgSend(v24, "setNoDataAxisBounds:", v23);
  objc_msgSend(v24, "setUnit:", v18);
  objc_msgSend(v17, "setAxisScalingRule:", v24);
  v55 = v17;
  objc_msgSend(v17, "yAxis");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    if (-[HKOverlayRoomViewController controllerMode](self, "controllerMode") == 3)
    {
      objc_msgSend(v10, "localization");
      v52 = v20;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "shortenedDisplayName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
      v28 = v10;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKLegendEntry legendEntryWithTitle:labelColor:](HKLegendEntry, "legendEntryWithTitle:labelColor:", v27, v29);
      v51 = v21;
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v28;
      v20 = v52;
      v56[0] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setTitleLegendEntries:", v31);

      v21 = v51;
    }
  }
  else
  {
    v53 = v20;
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "showSensitiveLogItems");

    if (v33)
    {
      _HKInitializeLogging();
      v34 = *MEMORY[0x1E0CB5378];
      v20 = v53;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_FAULT))
        -[HKOverlayRoomAFibBurdenViewController _aFibBurdenSeriesForTimeScope:displayType:mode:applicationItems:].cold.1(v34, v35, v36, v37, v38, v39, v40, v41);
    }
    else
    {
      v42 = os_log_create("com.apple.Health.AFibBurden", "default");
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        -[HKOverlayRoomAFibBurdenViewController _aFibBurdenSeriesForTimeScope:displayType:mode:applicationItems:].cold.1(v42, v43, v44, v45, v46, v47, v48, v49);

      v20 = v53;
    }
  }

  return v55;
}

- (BOOL)supportsHealthFactors
{
  return 1;
}

- (id)_contextItemOrder
{
  return &unk_1E9CE9BF0;
}

- (id)_overlayContextForOverlayContextItem:(unint64_t)a3 sleepDataSourceProvider:(id)a4 sleepChartFormatter:(id)a5 overlayChartController:(id)a6 applicationItems:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void (**v17)(void *, void *);
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  HKOverlayRoomAFibBurdenViewController *v31;
  _QWORD aBlock[5];
  id v33;
  id v34;

  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __162__HKOverlayRoomAFibBurdenViewController__overlayContextForOverlayContextItem_sleepDataSourceProvider_sleepChartFormatter_overlayChartController_applicationItems___block_invoke;
  aBlock[3] = &unk_1E9C3FAC8;
  aBlock[4] = self;
  v15 = v12;
  v33 = v15;
  v16 = v13;
  v34 = v16;
  v17 = (void (**)(void *, void *))_Block_copy(aBlock);
  v27[0] = v14;
  v27[1] = 3221225472;
  v27[2] = __162__HKOverlayRoomAFibBurdenViewController__overlayContextForOverlayContextItem_sleepDataSourceProvider_sleepChartFormatter_overlayChartController_applicationItems___block_invoke_2;
  v27[3] = &unk_1E9C3FAF0;
  v18 = v16;
  v28 = v18;
  v19 = v15;
  v29 = v19;
  v20 = v11;
  v30 = v20;
  v31 = self;
  v21 = _Block_copy(v27);
  v22 = v21;
  switch(a3)
  {
    case 0uLL:
      (*((void (**)(void *))v21 + 2))(v21);
      a3 = objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      v23 = (void *)MEMORY[0x1E0CB6B00];
      v24 = 251;
      goto LABEL_7;
    case 2uLL:
      v23 = (void *)MEMORY[0x1E0CB6B00];
      v24 = 75;
      goto LABEL_7;
    case 3uLL:
      v23 = (void *)MEMORY[0x1E0CB6B00];
      v24 = 99;
      goto LABEL_7;
    case 4uLL:
      v23 = (void *)MEMORY[0x1E0CB6B00];
      v24 = 3;
LABEL_7:
      objc_msgSend(v23, "dataTypeWithCode:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2](v17, v25);
      a3 = objc_claimAutoreleasedReturnValue();

      break;
    default:
      break;
  }

  return (id)a3;
}

HKOverlayRoomStackedContext *__162__HKOverlayRoomAFibBurdenViewController__overlayContextForOverlayContextItem_sleepDataSourceProvider_sleepChartFormatter_overlayChartController_applicationItems___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  HKOverlayRoomStackedContext *v4;
  uint64_t v6;

  v3 = a2;
  LOBYTE(v6) = 0;
  v4 = -[HKOverlayRoomStackedContext initWithDisplayType:overlayDisplayType:stackedSampleType:overlayChartController:currentCalendarOverride:applicationItems:isInfoButtonHidden:]([HKOverlayRoomStackedContext alloc], "initWithDisplayType:overlayDisplayType:stackedSampleType:overlayChartController:currentCalendarOverride:applicationItems:isInfoButtonHidden:", *(_QWORD *)(a1[4] + 1328), 0, v3, a1[5], *(_QWORD *)(a1[4] + 1376), a1[6], v6);

  return v4;
}

HKOverlayRoomSleepDurationStackedContext *__162__HKOverlayRoomAFibBurdenViewController__overlayContextForOverlayContextItem_sleepDataSourceProvider_sleepChartFormatter_overlayChartController_applicationItems___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;

  LOBYTE(v2) = 0;
  return -[HKOverlayRoomSleepDurationStackedContext initWithApplicationItems:overlayChartController:sleepChartFormatter:primaryDisplayType:uniqueIdentifier:firstWeekdayOverride:currentCalendarOverride:isInfoButtonHidden:]([HKOverlayRoomSleepDurationStackedContext alloc], "initWithApplicationItems:overlayChartController:sleepChartFormatter:primaryDisplayType:uniqueIdentifier:firstWeekdayOverride:currentCalendarOverride:isInfoButtonHidden:", a1[4], a1[5], a1[6], *(_QWORD *)(a1[7] + 1328), CFSTR("AFibBurden"), &unk_1E9CEAD00, *(_QWORD *)(a1[7] + 1376), v2);
}

- (id)_displayTypeForOverlayContextItem:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  switch(a3)
  {
    case 0uLL:
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "healthStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = &unk_1E9CEAD18;
      goto LABEL_7;
    case 1uLL:
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "healthStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = &unk_1E9CEAD30;
      goto LABEL_7;
    case 2uLL:
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "healthStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = &unk_1E9CEAD48;
      goto LABEL_7;
    case 3uLL:
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "healthStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = &unk_1E9CEAD60;
      goto LABEL_7;
    case 4uLL:
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "healthStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = &unk_1E9CEAC70;
LABEL_7:
      objc_msgSend(v6, "displayTypeWithIdentifier:", v8);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

- (id)_generateOverlayContextsWithPrimaryDisplayType:(id)a3 sleepDataSourceProvider:(id)a4 sleepChartFormatter:(id)a5 overlayChartController:(id)a6 applicationItems:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[HKOverlayRoomAFibBurdenViewController _contextItemOrder](self, "_contextItemOrder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __172__HKOverlayRoomAFibBurdenViewController__generateOverlayContextsWithPrimaryDisplayType_sleepDataSourceProvider_sleepChartFormatter_overlayChartController_applicationItems___block_invoke;
  v22[3] = &unk_1E9C3FB18;
  v22[4] = self;
  v23 = v11;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  objc_msgSend(v15, "hk_map:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

uint64_t __172__HKOverlayRoomAFibBurdenViewController__generateOverlayContextsWithPrimaryDisplayType_sleepDataSourceProvider_sleepChartFormatter_overlayChartController_applicationItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_overlayContextForOverlayContextItem:sleepDataSourceProvider:sleepChartFormatter:overlayChartController:applicationItems:", (int)objc_msgSend(a2, "intValue"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (id)_lifeFactorViewControllerForKey:(id)a3 logButtonAction:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKInfographicTitleDetailOptionalButtonItem *v14;
  HKInfographicViewController *v15;
  void *v16;
  HKInfographicViewController *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v7, CFSTR("_AND_AFIB_TITLE"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v23, &stru_1E9C4C428);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v7, CFSTR("_AND_AFIB_BODY"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v22, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-AFibBurden"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v7, CFSTR("_AND_AFIB_LOGGING"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", v11, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-AFibBurden"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HKInfographicTitleDetailOptionalButtonItem initWithTitle:detail:buttonTextString:buttonAction:]([HKInfographicTitleDetailOptionalButtonItem alloc], "initWithTitle:detail:buttonTextString:buttonAction:", v21, v10, v13, v6);
  v15 = [HKInfographicViewController alloc];
  v24[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HKInfographicViewController initWithItems:](v15, "initWithItems:", v16);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("LIFE_FACTOR"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-AFibBurden"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController setTitle:](v17, "setTitle:", v19);

  return v17;
}

- (id)_infographicViewControllerForDisplayType:(id)a3 secondaryDisplayType:(id)a4 addDataViewControllerProvider:(id)a5 healthStore:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  HKModalNavigationController *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__0;
  v44 = __Block_byref_object_dispose__0;
  v45 = 0;
  v32 = MEMORY[0x1E0C809B0];
  v33 = 3221225472;
  v34 = __145__HKOverlayRoomAFibBurdenViewController__infographicViewControllerForDisplayType_secondaryDisplayType_addDataViewControllerProvider_healthStore___block_invoke;
  v35 = &unk_1E9C3FB68;
  v14 = v13;
  v36 = v14;
  v15 = v11;
  v37 = v15;
  v16 = v12;
  v38 = v16;
  v39 = &v40;
  v17 = _Block_copy(&v32);
  if (objc_msgSend(v10, "displayTypeIdentifier", v32, v33, v34, v35) != 248)
  {
    v18 = 0;
LABEL_16:
    v30 = 0;
    goto LABEL_17;
  }
  if (objc_msgSend(v15, "displayTypeIdentifier") == 63)
  {
    -[HKOverlayRoomAFibBurdenViewController _lifeFactorViewControllerForKey:logButtonAction:](self, "_lifeFactorViewControllerForKey:logButtonAction:", CFSTR("SLEEP"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  if (objc_msgSend(v15, "displayTypeIdentifier") == 251)
  {
    -[HKOverlayRoomAFibBurdenViewController _lifeFactorViewControllerForKey:logButtonAction:](self, "_lifeFactorViewControllerForKey:logButtonAction:", CFSTR("ALCOHOL"), v17);
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  if (objc_msgSend(v15, "displayTypeIdentifier") == 75)
  {
    -[HKOverlayRoomAFibBurdenViewController _lifeFactorViewControllerForKey:logButtonAction:](self, "_lifeFactorViewControllerForKey:logButtonAction:", CFSTR("EXERCISE"), 0);
    v20 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v20;
  }
  if (objc_msgSend(v15, "displayTypeIdentifier") == 99)
  {
    -[HKOverlayRoomAFibBurdenViewController _lifeFactorViewControllerForKey:logButtonAction:](self, "_lifeFactorViewControllerForKey:logButtonAction:", CFSTR("MINDFUL_SESSION"), v17);
    v21 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v21;
  }
  if (objc_msgSend(v15, "displayTypeIdentifier") == 3)
  {
    -[HKOverlayRoomAFibBurdenViewController _lifeFactorViewControllerForKey:logButtonAction:](self, "_lifeFactorViewControllerForKey:logButtonAction:", CFSTR("BODY_MASS"), v17);
    v22 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v22;
  }
  if (!v18)
    goto LABEL_16;
  v23 = -[HKModalNavigationController initWithRootViewController:]([HKModalNavigationController alloc], "initWithRootViewController:", v18);
  v24 = (void *)v41[5];
  v41[5] = (uint64_t)v23;

  v25 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("LIFE_FACTORS_CANCEL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v25, "initWithTitle:style:target:action:", v27, 2, self, sel_dismissWithAnimation_);
  objc_msgSend((id)v41[5], "navigationItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setRightBarButtonItem:", v28);

  v30 = (id)v41[5];
LABEL_17:

  _Block_object_dispose(&v40, 8);
  return v30;
}

void __145__HKOverlayRoomAFibBurdenViewController__infographicViewControllerForDisplayType_secondaryDisplayType_addDataViewControllerProvider_healthStore___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent *v4;
  void *v5;
  HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  HKLogAFibBurden();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB62B8]), "initWithLoggingCategory:healthDataSource:", v2, *(_QWORD *)(a1 + 32));
  v4 = [HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent alloc];
  objc_msgSend(*(id *)(a1 + 40), "sampleType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent initWithSampleType:context:](v4, "initWithSampleType:context:", v5, 0);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __145__HKOverlayRoomAFibBurdenViewController__infographicViewControllerForDisplayType_secondaryDisplayType_addDataViewControllerProvider_healthStore___block_invoke_2;
  v11[3] = &unk_1E9C3FB40;
  v12 = v2;
  v7 = v2;
  objc_msgSend(v3, "submitEvent:completion:", v6, v11);
  v8 = objc_alloc(MEMORY[0x1E0DC3A40]);
  objc_msgSend(*(id *)(a1 + 48), "addDataViewControllerForDisplayType:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithRootViewController:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "hk_presentModalCardViewController:fullScreen:animated:completion:", v10, 0, 1, 0);
}

void __145__HKOverlayRoomAFibBurdenViewController__infographicViewControllerForDisplayType_secondaryDisplayType_addDataViewControllerProvider_healthStore___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _HKInitializeLogging();
    v5 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __145__HKOverlayRoomAFibBurdenViewController__infographicViewControllerForDisplayType_secondaryDisplayType_addDataViewControllerProvider_healthStore___block_invoke_2_cold_1((uint64_t)v4, v5);
  }

}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  void *v3;
  void *v4;

  HKHealthKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_BURDEN"), &stru_1E9C4C428, CFSTR("Localizable-AFibBurden"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)showAllFiltersButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHOW_LIFE_FACTORS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)supportsShowAllFilters
{
  objc_super v4;

  if (!-[HKOverlayRoomViewController controllerMode](self, "controllerMode"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)HKOverlayRoomAFibBurdenViewController;
  return -[HKOverlayRoomViewController supportsShowAllFilters](&v4, sel_supportsShowAllFilters);
}

- (void)didChangeFromContextItem:(id)a3 toContextItem:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *analyticsSubmissionQueue;
  _QWORD block[4];
  id v13;
  id v14;
  HKOverlayRoomAFibBurdenViewController *v15;

  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  if (v6 | v7)
  {
    objc_msgSend((id)v6, "analyticsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v7, "analyticsIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if ((v10 & 1) == 0)
    {
      analyticsSubmissionQueue = self->_analyticsSubmissionQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__HKOverlayRoomAFibBurdenViewController_didChangeFromContextItem_toContextItem___block_invoke;
      block[3] = &unk_1E9C3FB90;
      v13 = (id)v6;
      v14 = (id)v7;
      v15 = self;
      dispatch_async(analyticsSubmissionQueue, block);

    }
  }

}

void __80__HKOverlayRoomAFibBurdenViewController_didChangeFromContextItem_toContextItem___block_invoke(_QWORD *a1)
{
  void *v2;
  HKChartOverlaySelectedAnalyticsEvent *v3;
  HKChartOverlaySelectedAnalyticsEventConfiguration *v4;

  v4 = -[HKChartOverlaySelectedAnalyticsEventConfiguration initWithEventName:previousContextItemPropertyName:currentContextItemPropertyName:]([HKChartOverlaySelectedAnalyticsEventConfiguration alloc], "initWithEventName:previousContextItemPropertyName:currentContextItemPropertyName:", CFSTR("com.apple.health.burden.chart.overlay.selected"), CFSTR("previousLifeFactor"), CFSTR("currentLifeFactor"));
  -[HKChartOverlaySelectedAnalyticsEventConfiguration setFeatureIdentifier:](v4, "setFeatureIdentifier:", *MEMORY[0x1E0CB4FF8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CB74F8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKChartOverlaySelectedAnalyticsEventConfiguration setMinimumAge:](v4, "setMinimumAge:", v2);

  v3 = -[HKChartOverlaySelectedAnalyticsEvent initWithConfiguration:previousItem:currentItem:]([HKChartOverlaySelectedAnalyticsEvent alloc], "initWithConfiguration:previousItem:currentItem:", v4, a1[4], a1[5]);
  objc_msgSend(*(id *)(a1[6] + 1392), "submitEvent:error:", v3, 0);

}

- (id)createChartOverlayViewController
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HKInteractiveChartOverlayViewController *v15;
  void *v17;
  void *v18;
  HKInteractiveChartOverlayViewController *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  -[HKInteractiveChartDisplayType baseDisplayType](self->_afibBurdenDisplayType, "baseDisplayType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hk_interactiveChartOptions");

  if (-[HKOverlayRoomViewController controllerMode](self, "controllerMode") == 3)
    v5 = v4 | 0x2020;
  else
    v5 = v4;
  v20 = v5 | -[HKOverlayRoomViewController additionalChartOptions](self, "additionalChartOptions");
  v19 = [HKInteractiveChartOverlayViewController alloc];
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "healthStore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "unitController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dateCache");
  v7 = objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "chartDataCacheController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeScopeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sampleDateRangeController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController displayDate](self, "displayDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)v7;
  v15 = -[HKInteractiveChartOverlayViewController initWithHealthStore:primaryDisplayType:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:](v19, "initWithHealthStore:primaryDisplayType:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:", v24, v17, v6, v7, v8, v10, v12, v13, self->_currentCalendar, v20);

  -[HKInteractiveChartViewController setCurrentValueViewDataSourceDelegate:](v15, "setCurrentValueViewDataSourceDelegate:", self);
  return v15;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HKOverlayContextSection *v16;
  void *v17;
  void *v18;
  HKOverlayContextSection *v19;
  NSNumber *v20;
  NSNumber *preferredOverlayIndex;
  HKOverlayContextSectionContainer *v22;
  void *v23;
  HKOverlayContextSectionContainer *v24;
  void *v25;
  NSNumber *v26;
  HKOverlayContextSection *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  -[HKOverlayRoomAFibBurdenViewController afibBurdenDisplayType](self, "afibBurdenDisplayType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomAFibBurdenViewController sleepDataSourceProvider](self, "sleepDataSourceProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomAFibBurdenViewController sleepChartFormatter](self, "sleepChartFormatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomAFibBurdenViewController _generateOverlayContextsWithPrimaryDisplayType:sleepDataSourceProvider:sleepChartFormatter:overlayChartController:applicationItems:](self, "_generateOverlayContextsWithPrimaryDisplayType:sleepDataSourceProvider:sleepChartFormatter:overlayChartController:applicationItems:", v10, v11, v12, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomViewController buildFactorContextsAllowingDeselection:](self, "buildFactorContextsAllowingDeselection:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[HKOverlayRoomViewController combineFactors:standardFactors:](self, "combineFactors:standardFactors:", v14, v13);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }
  v16 = [HKOverlayContextSection alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("LIFE_FACTORS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-AFibBurden"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HKOverlayContextSection initWithSectionTitle:overlayContextItems:](v16, "initWithSectionTitle:overlayContextItems:", v18, v13);

  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
    v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    preferredOverlayIndex = self->_preferredOverlayIndex;
    self->_preferredOverlayIndex = v20;

    v22 = [HKOverlayContextSectionContainer alloc];
    v28 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v22, "initWithContainerTitle:overlayContextSections:", 0, v23);
    v29[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = self->_preferredOverlayIndex;
    self->_preferredOverlayIndex = 0;

    v25 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v25;
}

- (id)preferredInitialOverlayIndex
{
  return self->_preferredOverlayIndex;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  HKOverlayRoomAFibBurdenViewController *v12;
  void *v13;
  HKOverlayRoomAFibBurdenViewController *v14;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3 == 3)
  {
    objc_msgSend(v9, "timeScopeController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSelectedTimeScope:", 3);

  }
  v12 = [HKOverlayRoomAFibBurdenViewController alloc];
  -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKOverlayRoomAFibBurdenViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:sleepDataSourceProvider:sleepChartFormatter:preferredOverlay:addDataViewControllerProvider:](v12, "initWithDisplayDate:applicationItems:factorDisplayTypes:mode:sleepDataSourceProvider:sleepChartFormatter:preferredOverlay:addDataViewControllerProvider:", v8, v10, v13, a3, self->_sleepDataSourceProvider, self->_sleepChartFormatter, self->_preferredOverlay, self->_addDataViewControllerProvider);

  -[HKOverlayRoomViewController setAdditionalChartOptions:](v14, "setAdditionalChartOptions:", -[HKOverlayRoomViewController filteredInteractiveChartOptionsForMode:](self, "filteredInteractiveChartOptionsForMode:", a3));
  return v14;
}

- (void)contextView:(id)a3 didTapOnInfoButtonAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  int64_t v21;
  void *v22;
  HKAddDataViewControllerProvider *addDataViewControllerProvider;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  -[HKOverlayRoomViewController applicationItems](self, "applicationItems", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayTypeWithIdentifier:", &unk_1E9CEAD78);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomAFibBurdenViewController _contextItemOrder](self, "_contextItemOrder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController buildFactorContextsAllowingDeselection:](self, "buildFactorContextsAllowingDeselection:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeFactorContexts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  v13 = objc_msgSend(v9, "count");
  objc_msgSend(v10, "inactiveFactorContexts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  v16 = a4 - v12;
  if (a4 >= v12)
  {
    v19 = v13 + v12;
    v20 = __OFSUB__(a4, v13 + v12);
    v21 = a4 - (v13 + v12);
    if (v21 < 0 != v20)
    {
      objc_msgSend(v9, "objectAtIndex:", v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomAFibBurdenViewController _displayTypeForOverlayContextItem:](self, "_displayTypeForOverlayContextItem:", (int)objc_msgSend(v22, "intValue"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      addDataViewControllerProvider = self->_addDataViewControllerProvider;
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "healthStore");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomAFibBurdenViewController _infographicViewControllerForDisplayType:secondaryDisplayType:addDataViewControllerProvider:healthStore:](self, "_infographicViewControllerForDisplayType:secondaryDisplayType:addDataViewControllerProvider:healthStore:", v29, v18, addDataViewControllerProvider, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (v15 + v19 <= a4)
      goto LABEL_11;
    objc_msgSend(v10, "inactiveFactorContexts", v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v10, "activeFactorContexts", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v18, "stackedBaseDisplayType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "healthStore");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKInteractiveChartInfographicFactory infographicViewControllerForDisplayType:factorDisplayType:healthStore:](HKInteractiveChartInfographicFactory, "infographicViewControllerForDisplayType:factorDisplayType:healthStore:", v29, v24, v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  if (v26)
  {
    -[UIViewController hk_presentModalCardViewController:fullScreen:animated:completion:](self, "hk_presentModalCardViewController:fullScreen:animated:completion:", v26, 0, 1, 0);

  }
LABEL_11:

}

- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringForValueRange:timeScope:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)processSelectedRangeData:(id)a3 displayType:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v7 = a4;
  v8 = objc_msgSend(v22, "statisticsType");
  objc_msgSend(v7, "sampleType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "code");
  if (v10 > 98)
  {
    if (v10 == 99)
    {
      if (objc_msgSend(v22, "statisticsType") != 8 && v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomAFibBurdenViewController.m"), 586, CFSTR("Mindful Minutes Should always display daily average for the interval"));

      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("MINDFUL_MINUTES_LOLLIPOP_TITLE");
      goto LABEL_31;
    }
    v11 = v22;
    if (v10 == 248)
    {
      v15 = -[HKOverlayRoomViewController controllerMode](self, "controllerMode") == 3;
      v11 = v22;
      if (!v15)
        goto LABEL_33;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("AFIB_BURDEN_LOLLIPOP_TITLE");
      goto LABEL_31;
    }
    if (v10 == 251)
    {
      if (objc_msgSend(v22, "statisticsType") != 8 && v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomAFibBurdenViewController.m"), 600, CFSTR("Alcohol Type Should always display daily average for the interval"));

      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("ALCOHOL_LOLLIPOP_TITLE");
      goto LABEL_31;
    }
  }
  else
  {
    if (v10 == 3)
    {
      if (objc_msgSend(v22, "statisticsType") != 3 && v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomAFibBurdenViewController.m"), 579, CFSTR("Body Mass Should always display average for the interval"));

      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("BODY_MASS_LOLLIPOP_TITLE");
      goto LABEL_31;
    }
    v11 = v22;
    if (v10 == 63)
    {
      if (objc_msgSend(v22, "dataType") == 9)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = CFSTR("SLEEP_INBED_LOLLIPOP_TITLE");
      }
      else
      {
        if (objc_msgSend(v22, "dataType") != 10)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomAFibBurdenViewController.m"), 613, CFSTR("Sleep should only contain InBed or Asleep data types. Unrecognized: %ld"), objc_msgSend(v22, "dataType"));
          goto LABEL_32;
        }
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = CFSTR("SLEEP_ASLEEP_LOLLIPOP_TITLE");
      }
LABEL_31:
      objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-AFibBurden"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedUppercaseString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTitleOverride:", v17);

LABEL_32:
      v11 = v22;
      goto LABEL_33;
    }
    if (v10 == 75)
    {
      if (objc_msgSend(v22, "statisticsType") != 8 && v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomAFibBurdenViewController.m"), 593, CFSTR("Exercise Minutes Should always display daily average for the interval"));

      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("EXERCISE_MINUTES_LOLLIPOP_TITLE");
      goto LABEL_31;
    }
  }
LABEL_33:

}

- (HKInteractiveChartDisplayType)afibBurdenDisplayType
{
  return self->_afibBurdenDisplayType;
}

- (NSNumber)preferredOverlayIndex
{
  return self->_preferredOverlayIndex;
}

- (int64_t)preferredOverlay
{
  return self->_preferredOverlay;
}

- (HKSleepDataSourceProvider)sleepDataSourceProvider
{
  return self->_sleepDataSourceProvider;
}

- (HKInteractiveChartDataFormatter)sleepChartFormatter
{
  return self->_sleepChartFormatter;
}

- (HKAddDataViewControllerProvider)addDataViewControllerProvider
{
  return self->_addDataViewControllerProvider;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (OS_dispatch_queue)analyticsSubmissionQueue
{
  return self->_analyticsSubmissionQueue;
}

- (HKAnalyticsEventSubmissionManager)analyticsEventSubmissionManager
{
  return self->_analyticsEventSubmissionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventSubmissionManager, 0);
  objc_storeStrong((id *)&self->_analyticsSubmissionQueue, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_addDataViewControllerProvider, 0);
  objc_storeStrong((id *)&self->_sleepChartFormatter, 0);
  objc_storeStrong((id *)&self->_sleepDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_preferredOverlayIndex, 0);
  objc_storeStrong((id *)&self->_afibBurdenDisplayType, 0);
}

- (void)_aFibBurdenSeriesForTimeScope:(uint64_t)a3 displayType:(uint64_t)a4 mode:(uint64_t)a5 applicationItems:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D7813000, a1, a3, "Numeric Axis missing from AFib Controller", a5, a6, a7, a8, 0);
}

void __145__HKOverlayRoomAFibBurdenViewController__infographicViewControllerForDisplayType_secondaryDisplayType_addDataViewControllerProvider_healthStore___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D7813000, a2, OS_LOG_TYPE_ERROR, "[HKInteractiveChartInfographicFactory] Error sending life factor logging initiated analytics event: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
