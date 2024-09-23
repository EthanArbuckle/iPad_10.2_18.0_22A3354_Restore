@implementation HKOverlayRoomSleepViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  HKOverlayRoomSleepViewController *v27;
  void *v28;
  void *v29;
  HKOverlayRoomSleepViewController *v30;

  v16 = a4;
  v17 = a9;
  v18 = a10;
  v19 = a8;
  v20 = a6;
  v21 = a5;
  objc_msgSend(v16, "sleepDataSourceProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKOverlayRoomSleepViewController.m"), 227, CFSTR("The sleep experience requires an externally provided data source provider."));

  }
  objc_msgSend(v16, "sleepChartFormatter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    if (!v17)
    {
LABEL_8:
      v24 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKOverlayRoomSleepViewController.m"), 228, CFSTR("The sleep experience requires an externally provided sleep chart formatter."));

    if (!v17)
      goto LABEL_8;
  }
  if ((objc_msgSend(v17, "selectTrendInitially") & 1) == 0)
    goto LABEL_8;
  v24 = 1;
LABEL_9:
  v27 = [HKOverlayRoomSleepViewController alloc];
  objc_msgSend(v16, "sleepDataSourceProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sleepChartFormatter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[HKOverlayRoomSleepViewController initWithDisplayDate:applicationItems:sleepDataSourceProvider:sleepChartFormatter:mode:trendModel:factorDisplayTypes:](v27, "initWithDisplayDate:applicationItems:sleepDataSourceProvider:sleepChartFormatter:mode:trendModel:factorDisplayTypes:", v20, v21, v28, v29, v24, v17, v18);

  -[HKOverlayRoomViewController setRestorationUserActivity:](v30, "setRestorationUserActivity:", v19);
  -[HKOverlayRoomViewController setAdditionalChartOptions:](v30, "setAdditionalChartOptions:", a11);

  return v30;
}

- (HKOverlayRoomSleepViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 sleepDataSourceProvider:(id)a5 sleepChartFormatter:(id)a6 mode:(int64_t)a7 trendModel:(id)a8 factorDisplayTypes:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  HKOverlayRoomSleepViewController *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  HKDisplayType *sleepDisplayType;
  HKDisplayType *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSDictionary *sleepChartCaches;
  HKOverlayContextLocation *trendContextLocation;
  HKOverlayContextLocation *comparisonContextLocation;
  id obj;
  id obja;
  id v43;
  objc_super v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  obj = a8;
  v43 = a6;
  v18 = a8;
  v19 = a9;
  +[HKOverlayRoomTrendContext findInitialDateFromTrendModel:](HKOverlayRoomTrendContext, "findInitialDateFromTrendModel:", v18);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (void *)v20;
  else
    v22 = v15;
  v23 = v22;

  v44.receiver = self;
  v44.super_class = (Class)HKOverlayRoomSleepViewController;
  v24 = -[HKOverlayRoomViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:](&v44, sel_initWithDisplayDate_applicationItems_factorDisplayTypes_mode_, v23, v16, v19, a7);

  if (v24)
  {
    _HKInitializeLogging();
    v25 = (void *)*MEMORY[0x1E0CB5368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      v27 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v46 = v27;
      v28 = v27;
      _os_log_impl(&dword_1D7813000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] init", buf, 0xCu);

    }
    v29 = -[HKOverlayRoomSleepViewController _initialTrendSelectedForMode:trendModel:](v24, "_initialTrendSelectedForMode:trendModel:", a7, v18, obj, v43);
    objc_storeWeak((id *)&v24->_sleepDataSourceProvider, v17);
    objc_storeStrong((id *)&v24->_sleepChartFormatter, a6);
    -[HKOverlayRoomSleepViewController _setDefaultChartFormatterFonts](v24, "_setDefaultChartFormatterFonts");
    v24->baseDisplayIsSchedule = v29 ^ 1;
    v24->shouldHighlightBaseDisplayContext = 0;
    objc_msgSend(v16, "displayTypeController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "displayTypeWithIdentifier:", &unk_1E9CED118);
    v31 = objc_claimAutoreleasedReturnValue();
    sleepDisplayType = v24->_sleepDisplayType;
    v24->_sleepDisplayType = (HKDisplayType *)v31;

    v33 = v24->_sleepDisplayType;
    objc_msgSend(v16, "chartDataCacheController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "healthStore");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKSleepUtilities buildSleepChartCachesWithDisplayType:dataSourceProvider:cacheController:healthStore:](HKSleepUtilities, "buildSleepChartCachesWithDisplayType:dataSourceProvider:cacheController:healthStore:", v33, v17, v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    sleepChartCaches = v24->_sleepChartCaches;
    v24->_sleepChartCaches = (NSDictionary *)v36;

    -[HKOverlayRoomSleepViewController _installUpdateObserversForGoalsAndSchedulesWithApplicationItems:](v24, "_installUpdateObserversForGoalsAndSchedulesWithApplicationItems:", v16);
    objc_storeStrong((id *)&v24->_trendModel, obja);
    -[HKOverlayRoomViewController setShouldSelectInitialOverlay:](v24, "setShouldSelectInitialOverlay:", v29);
    trendContextLocation = v24->_trendContextLocation;
    v24->_trendContextLocation = 0;

    comparisonContextLocation = v24->_comparisonContextLocation;
    v24->_comparisonContextLocation = 0;

  }
  return v24;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  id v5;
  objc_super v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E0CB5368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543362;
    v8 = (id)objc_opt_class();
    v5 = v8;
    _os_log_impl(&dword_1D7813000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] dealloc", buf, 0xCu);

  }
  v6.receiver = self;
  v6.super_class = (Class)HKOverlayRoomSleepViewController;
  -[HKOverlayRoomViewController dealloc](&v6, sel_dealloc);
}

+ (int64_t)indexForOverlaySleepRoomSegment:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 != 1;
}

- (BOOL)_initialTrendSelectedForMode:(int64_t)a3 trendModel:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v12;
  id v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (a3 == 3)
    v7 = 0;
  else
    v7 = objc_msgSend(v5, "selectTrendInitially");
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x1E0CB5368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v12 = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 1024;
    v15 = v7;
    v10 = v13;
    _os_log_impl(&dword_1D7813000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Returning initial trend selected: %d", (uint8_t *)&v12, 0x12u);

  }
  return v7;
}

- (void)_installUpdateObserversForGoalsAndSchedulesWithApplicationItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "displayTypeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayTypeWithIdentifier:", &unk_1E9CED130);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "displayTypeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayTypeWithIdentifier:", &unk_1E9CED148);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomSleepViewController sleepChartCaches](self, "sleepChartCaches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HKSleepChartCacheIdentifierSleepConsistency"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "chartDataCacheController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addCustomChartCache:forDisplayType:", v9, v12);

  objc_msgSend(v4, "chartDataCacheController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addCustomChartCache:forDisplayType:", v9, v7);
}

- (void)_setDefaultChartFormatterFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HKOverlayRoomSleepViewController sleepChartFormatter](self, "sleepChartFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "majorFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueValueFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomSleepViewController sleepChartFormatter](self, "sleepChartFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMajorFont:", v5);

  }
  -[HKOverlayRoomSleepViewController sleepChartFormatter](self, "sleepChartFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minorFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueUnitFont");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomSleepViewController sleepChartFormatter](self, "sleepChartFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMinorFont:", v10);

  }
}

- (void)viewDidLoad
{
  void *v3;
  NSObject *v4;
  id v5;
  objc_super v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E0CB5368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543362;
    v8 = (id)objc_opt_class();
    v5 = v8;
    _os_log_impl(&dword_1D7813000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] viewDidLoad", buf, 0xCu);

  }
  v6.receiver = self;
  v6.super_class = (Class)HKOverlayRoomSleepViewController;
  -[HKOverlayRoomViewController viewDidLoad](&v6, sel_viewDidLoad);
}

- (BOOL)supportsHealthFactors
{
  return 1;
}

- (void)setDurationContextSelected:(BOOL)a3
{
  self->durationContextSelected = a3;
  if (a3)
    -[HKOverlayRoomSleepViewController setBaseDisplayIsDuration](self, "setBaseDisplayIsDuration");
}

- (void)setScheduleContextSelected:(BOOL)a3
{
  self->scheduleContextSelected = a3;
  if (a3)
    -[HKOverlayRoomSleepViewController setBaseDisplayIsSchedule](self, "setBaseDisplayIsSchedule");
}

- (void)setComparisonContextSelected:(BOOL)a3
{
  self->comparisonContextSelected = a3;
  if (a3)
    -[HKOverlayRoomSleepViewController setBaseDisplayIsDuration](self, "setBaseDisplayIsDuration");
}

- (void)setBaseDisplayIsDuration
{
  if (self->baseDisplayIsSchedule)
  {
    self->baseDisplayIsSchedule = 0;
    -[HKOverlayRoomViewController refreshOverlayContextItems](self, "refreshOverlayContextItems");
  }
}

- (void)setBaseDisplayIsSchedule
{
  if (!self->baseDisplayIsSchedule)
  {
    self->baseDisplayIsSchedule = 1;
    -[HKOverlayRoomViewController refreshOverlayContextItems](self, "refreshOverlayContextItems");
  }
}

- (void)setShouldHighlightBaseDisplayContext
{
  if (!self->shouldHighlightBaseDisplayContext)
  {
    self->shouldHighlightBaseDisplayContext = 1;
    -[HKOverlayRoomViewController refreshOverlayContextItems](self, "refreshOverlayContextItems");
  }
}

- (void)setStagePercentageContextSelected:(BOOL)a3
{
  _BOOL4 stagePercentageContextSelected;
  void *v6;

  stagePercentageContextSelected = self->stagePercentageContextSelected;
  if (stagePercentageContextSelected != a3
    && stagePercentageContextSelected != self->stagePercentageContextWillBeSelected)
  {
    -[HKOverlayRoomViewController chartController](self, "chartController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatePrimaryGraphViewController");

    self->stagePercentageContextSelected = a3;
  }
}

- (void)didChangeFromContextItem:(id)a3 toContextItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x1E0CB5368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v10 = v13;
    _os_log_impl(&dword_1D7813000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] didChangeFromContextItem", buf, 0xCu);

  }
  v11.receiver = self;
  v11.super_class = (Class)HKOverlayRoomSleepViewController;
  -[HKOverlayRoomViewController didChangeFromContextItem:toContextItem:](&v11, sel_didChangeFromContextItem_toContextItem_, v7, v6);

}

- (id)createChartOverlayViewController
{
  int64_t v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HKInteractiveChartOverlaySleepViewController *v16;
  void *v18;
  void *v19;
  HKInteractiveChartOverlaySleepViewController *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  if (-[HKOverlayRoomViewController controllerMode](self, "controllerMode") != 3)
  {
    v3 = +[HKOverlayRoomTrendContext findStartingTimeScopeFromTrendModel:](HKOverlayRoomTrendContext, "findStartingTimeScopeFromTrendModel:", self->_trendModel);
    if (v3 != 8)
    {
      v4 = v3;
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeScopeController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSelectedTimeScope:", v4);

    }
  }
  v21 = -[HKOverlayRoomViewController additionalChartOptions](self, "additionalChartOptions") | 0x12200;
  v20 = [HKInteractiveChartOverlaySleepViewController alloc];
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "healthStore");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "unitController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dateCache");
  v8 = objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "chartDataCacheController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeScopeController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sampleDateRangeController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController displayDate](self, "displayDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)v8;
  v16 = -[HKInteractiveChartOverlayViewController initWithHealthStore:primaryDisplayType:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:](v20, "initWithHealthStore:primaryDisplayType:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:", v25, v18, v7, v8, v9, v11, v13, v14, 0, v21);

  -[HKInteractiveChartViewController setCurrentValueViewDataSourceDelegate:](v16, "setCurrentValueViewDataSourceDelegate:", self);
  -[HKInteractiveChartViewController setCurrentOverlayLocationProvider:](v16, "setCurrentOverlayLocationProvider:", self);
  return v16;
}

- (id)_buildSleepDisplayTypeWithApplicationItems:(id)a3 sleepSeriesType:(int64_t)a4 customSleepSeriesMapping:(id)a5 customSleepChartFormatter:(id)a6 isStackedChart:(BOOL)a7
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
  void *v21;
  uint64_t v23;
  void *v25;
  void *v26;
  id v27;

  v11 = a3;
  v27 = a5;
  v12 = a6;
  v25 = v12;
  if (v12)
  {
    v13 = v12;
  }
  else
  {
    -[HKOverlayRoomSleepViewController sleepChartFormatter](self, "sleepChartFormatter");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v13;
  objc_msgSend(v11, "healthStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController sleepDisplayType](self, "sleepDisplayType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unitController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayTypeController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "chartDataCacheController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController sleepChartCaches](self, "sleepChartCaches");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = a7;
  +[HKSleepUtilities sleepDisplayTypesWithHealthStore:sleepDisplayType:unitController:displayTypeController:chartCacheController:sleepChartFormatter:sleepSeriesType:sleepChartCaches:customSleepSeriesMapping:isStackedChart:](HKSleepUtilities, "sleepDisplayTypesWithHealthStore:sleepDisplayType:unitController:displayTypeController:chartCacheController:sleepChartFormatter:sleepSeriesType:sleepChartCaches:customSleepSeriesMapping:isStackedChart:", v14, v15, v16, v17, v18, v26, a4, v19, v27, v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_buildConsistencyDisplayTypeWithApplicationItems:(id)a3
{
  return -[HKOverlayRoomSleepViewController _buildSleepDisplayTypeWithApplicationItems:sleepSeriesType:customSleepSeriesMapping:customSleepChartFormatter:isStackedChart:](self, "_buildSleepDisplayTypeWithApplicationItems:sleepSeriesType:customSleepSeriesMapping:customSleepChartFormatter:isStackedChart:", a3, 1, 0, 0, 0);
}

- (id)_buildScheduleDisplayTypeWithApplicationItems:(id)a3
{
  return -[HKOverlayRoomSleepViewController _buildSleepDisplayTypeWithApplicationItems:sleepSeriesType:customSleepSeriesMapping:customSleepChartFormatter:isStackedChart:](self, "_buildSleepDisplayTypeWithApplicationItems:sleepSeriesType:customSleepSeriesMapping:customSleepChartFormatter:isStackedChart:", a3, 3, 0, 0, 0);
}

- (id)_buildDurationDisplayTypeWithApplicationItems:(id)a3
{
  return -[HKOverlayRoomSleepViewController _buildSleepDisplayTypeWithApplicationItems:sleepSeriesType:customSleepSeriesMapping:customSleepChartFormatter:isStackedChart:](self, "_buildSleepDisplayTypeWithApplicationItems:sleepSeriesType:customSleepSeriesMapping:customSleepChartFormatter:isStackedChart:", a3, 0, 0, 0, 0);
}

- (id)_buildDurationGoalDisplayTypeWithApplicationItems:(id)a3
{
  return -[HKOverlayRoomSleepViewController _buildSleepDisplayTypeWithApplicationItems:sleepSeriesType:customSleepSeriesMapping:customSleepChartFormatter:isStackedChart:](self, "_buildSleepDisplayTypeWithApplicationItems:sleepSeriesType:customSleepSeriesMapping:customSleepChartFormatter:isStackedChart:", a3, 2, 0, 0, 0);
}

- (id)_buildDurationAverageDisplayTypeWithApplicationItems:(id)a3 customSleepSeriesMapping:(id)a4 customSleepChartFormatter:(id)a5
{
  return -[HKOverlayRoomSleepViewController _buildSleepDisplayTypeWithApplicationItems:sleepSeriesType:customSleepSeriesMapping:customSleepChartFormatter:isStackedChart:](self, "_buildSleepDisplayTypeWithApplicationItems:sleepSeriesType:customSleepSeriesMapping:customSleepChartFormatter:isStackedChart:", a3, 0, a4, a5, 0);
}

- (id)_buildDurationDisplayTypeForStackedWithApplicationItems:(id)a3
{
  return -[HKOverlayRoomSleepViewController _buildSleepDisplayTypeWithApplicationItems:sleepSeriesType:customSleepSeriesMapping:customSleepChartFormatter:isStackedChart:](self, "_buildSleepDisplayTypeWithApplicationItems:sleepSeriesType:customSleepSeriesMapping:customSleepChartFormatter:isStackedChart:", a3, 6, 0, 0, 1);
}

- (id)_buildStagesDisplayTypeWithApplicationItems:(id)a3
{
  return -[HKOverlayRoomSleepViewController _buildSleepDisplayTypeWithApplicationItems:sleepSeriesType:customSleepSeriesMapping:customSleepChartFormatter:isStackedChart:](self, "_buildSleepDisplayTypeWithApplicationItems:sleepSeriesType:customSleepSeriesMapping:customSleepChartFormatter:isStackedChart:", a3, 4, 0, 0, 0);
}

- (id)_buildStagesDurationDisplayTypeWithApplicationItems:(id)a3
{
  return -[HKOverlayRoomSleepViewController _buildSleepDisplayTypeWithApplicationItems:sleepSeriesType:customSleepSeriesMapping:customSleepChartFormatter:isStackedChart:](self, "_buildSleepDisplayTypeWithApplicationItems:sleepSeriesType:customSleepSeriesMapping:customSleepChartFormatter:isStackedChart:", a3, 5, 0, 0, 0);
}

- (id)_buildDurationAverageSeries
{
  _HKSleepDurationAverageSeries *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(_HKSleepDurationAverageSeries);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAsleepColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v3, 2.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDashStyle:", 0);
  -[HKSleepDurationSeries setGoalLineStrokeStyle:](v2, "setGoalLineStrokeStyle:", v4);
  -[HKSleepDurationSeries setGoalLineMarkerStyle:](v2, "setGoalLineMarkerStyle:", 0);
  -[HKBarSeries setTiledStrokeStyle:](v2, "setTiledStrokeStyle:", 0);
  -[HKSleepDurationSeries setDefaultFillStyles:](v2, "setDefaultFillStyles:", 0);

  return v2;
}

- (id)_buildDurationAverageFormatter
{
  _HKSleepDurationAverageFormatter *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(_HKSleepDurationAverageFormatter);
  -[HKOverlayRoomSleepViewController sleepChartFormatter](self, "sleepChartFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "majorFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter setMajorFont:](v3, "setMajorFont:", v5);

  -[HKOverlayRoomSleepViewController sleepChartFormatter](self, "sleepChartFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minorFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter setMinorFont:](v3, "setMinorFont:", v7);

  -[HKInteractiveChartDataFormatter setUnitController:](v3, "setUnitController:", 0);
  -[HKInteractiveChartDataFormatter setDisplayType:](v3, "setDisplayType:", 0);
  return v3;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SLEEP"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController sleepDisplayType](self, "sleepDisplayType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unitController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayTypeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chartDataCacheController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomSleepViewController sleepChartFormatter](self, "sleepChartFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKOverlayRoomSleepViewController initialSleepSeriesType](self, "initialSleepSeriesType");
  -[HKOverlayRoomSleepViewController sleepChartCaches](self, "sleepChartCaches");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = 0;
  +[HKSleepUtilities sleepDisplayTypesWithHealthStore:sleepDisplayType:unitController:displayTypeController:chartCacheController:sleepChartFormatter:sleepSeriesType:sleepChartCaches:customSleepSeries:isStackedChart:](HKSleepUtilities, "sleepDisplayTypesWithHealthStore:sleepDisplayType:unitController:displayTypeController:chartCacheController:sleepChartFormatter:sleepSeriesType:sleepChartCaches:customSleepSeries:isStackedChart:", v5, v6, v7, v8, v9, v10, v11, v12, 0, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  id v8;
  id v9;
  HKOverlayContextSectionContainer *v10;
  void *v11;
  HKOverlayContextSectionContainer *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (a3 == 3)
  {
    -[HKOverlayRoomSleepViewController _fullContextsForApplicationItems:overlayChartController:](self, "_fullContextsForApplicationItems:overlayChartController:", v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    v10 = [HKOverlayContextSectionContainer alloc];
    -[HKOverlayRoomSleepViewController _primaryContextForApplicationItems:overlayChartController:](self, "_primaryContextForApplicationItems:overlayChartController:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v10, "initWithContainerTitle:overlayContextSections:", 0, v11);
    v15[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (BOOL)supportsShowAllFilters
{
  objc_super v4;

  if (!-[HKOverlayRoomViewController controllerMode](self, "controllerMode"))
    return -[HKOverlayRoomSleepViewController initialSleepSeriesType](self, "initialSleepSeriesType") == 4;
  v4.receiver = self;
  v4.super_class = (Class)HKOverlayRoomSleepViewController;
  return -[HKOverlayRoomViewController supportsShowAllFilters](&v4, sel_supportsShowAllFilters);
}

- (int64_t)initialSleepSeriesType
{
  HKOverlayRoomSleepViewController *v2;
  int64_t v3;
  void *v4;

  v2 = self;
  v3 = -[HKOverlayRoomViewController controllerMode](self, "controllerMode");
  -[HKOverlayRoomSleepViewController trendModel](v2, "trendModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = -[HKOverlayRoomSleepViewController _initialTrendSelectedForMode:trendModel:](v2, "_initialTrendSelectedForMode:trendModel:", v3, v4);

  if ((_DWORD)v2)
    return 0;
  else
    return 4;
}

- (id)_primaryContextForApplicationItems:(id)a3 overlayChartController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  HKOverlayContextLocation *v13;
  void *v14;
  HKOverlayContextSection *v15;
  void *v16;
  HKOverlayContextSection *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HKOverlayRoomSleepViewController trendModel](self, "trendModel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[HKOverlayRoomSleepViewController trendModel](self, "trendModel"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "selectTrendInitially"),
        v10,
        v9,
        v11))
  {
    -[HKOverlayRoomSleepViewController _buildSleepTrendContext:overlayChartController:](self, "_buildSleepTrendContext:overlayChartController:", v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKOverlayContextLocation initWithContainerIndex:sectionIndex:itemIndex:]([HKOverlayContextLocation alloc], "initWithContainerIndex:sectionIndex:itemIndex:", 0, 0, 0);
    -[HKOverlayRoomSleepViewController setTrendContextLocation:](self, "setTrendContextLocation:", v13);

  }
  else
  {
    -[HKOverlayRoomSleepViewController _consistencyContextForApplicationItems:overlayMode:isPrimaryContext:](self, "_consistencyContextForApplicationItems:overlayMode:isPrimaryContext:", v6, 1, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKOverlayContextSection initWithSectionTitle:overlayContextItems:]([HKOverlayContextSection alloc], "initWithSectionTitle:overlayContextItems:", 0, v14);
  v18 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_buildSleepTrendContext:(id)a3 overlayChartController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _HKSleepTrendContext *v9;
  void *v10;
  _HKSleepTrendContext *v11;

  v6 = a4;
  v7 = a3;
  -[HKOverlayRoomSleepViewController _buildDurationDisplayTypeWithApplicationItems:](self, "_buildDurationDisplayTypeWithApplicationItems:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [_HKSleepTrendContext alloc];
  -[HKOverlayRoomSleepViewController trendModel](self, "trendModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_HKSleepTrendContext initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:contextChangeDelegate:](v9, "initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:contextChangeDelegate:", v8, v10, v6, v7, -[HKOverlayRoomViewController controllerMode](self, "controllerMode"), self);

  return v11;
}

- (id)_fullContextsForApplicationItems:(id)a3 overlayChartController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HKOverlayContextLocation *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  HKOverlayContextSection *v21;
  void *v22;
  uint64_t v23;
  id v24;
  _HKSleepComparisonContext *v25;
  void *v26;
  uint64_t v27;
  _HKSleepComparisonContext *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _HKSleepComparisonContext *v32;
  void *v33;
  id v34;
  uint64_t v35;
  HKOverlayRoomSleepViewController *v36;
  void *v37;
  HKOverlayRoomSleepViewController *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _HKSleepComparisonFactorContext *v44;
  void *v45;
  _HKSleepComparisonFactorContext *v46;
  HKOverlayRoomSleepViewController *v47;
  HKOverlayContextSectionContainer *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  HKOverlayContextSection *v53;
  HKOverlayContextSection *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  HKOverlayContextSection *v63;
  HKOverlayContextSectionContainer *v64;
  void *v65;
  void *v66;
  HKOverlayContextSectionContainer *v67;
  HKOverlayContextSectionContainer *v68;
  void *v69;
  void *v70;
  void *v71;
  HKOverlayContextSectionContainer *v72;
  HKOverlayContextLocation *v73;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  HKOverlayContextSection *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  HKOverlayContextSectionContainer *v88;
  HKOverlayContextSection *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  HKOverlayContextSection *v104;
  HKOverlayContextSection *v105;
  id obj;
  id obja;
  void *v108;
  void *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  HKOverlayContextSection *v114;
  _QWORD v115[4];
  _QWORD v116[4];
  _QWORD v117[2];
  _QWORD v118[2];
  _BYTE v119[128];
  _QWORD v120[2];
  uint64_t v121;
  _QWORD v122[6];

  v122[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HKOverlayRoomSleepViewController _buildDurationDisplayTypeWithApplicationItems:](self, "_buildDurationDisplayTypeWithApplicationItems:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController _durationAmountContextForApplicationItems:durationDisplayType:](self, "_durationAmountContextForApplicationItems:durationDisplayType:", v6, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController _durationGoalContextForApplicationItems:durationDisplayType:overlayMode:isPrimaryContext:](self, "_durationGoalContextForApplicationItems:durationDisplayType:overlayMode:isPrimaryContext:", v6, v8, 3, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController _durationAverageContextForApplicationItems:durationDisplayType:useInBedAverage:](self, "_durationAverageContextForApplicationItems:durationDisplayType:useInBedAverage:", v6, v8, 1);
  v11 = objc_claimAutoreleasedReturnValue();
  v102 = (void *)v8;
  -[HKOverlayRoomSleepViewController _durationAverageContextForApplicationItems:durationDisplayType:useInBedAverage:](self, "_durationAverageContextForApplicationItems:durationDisplayType:useInBedAverage:", v6, v8, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v100 = (void *)v10;
  v101 = (void *)v9;
  v122[0] = v9;
  v122[1] = v10;
  v98 = (void *)v12;
  v99 = (void *)v11;
  v122[2] = v11;
  v122[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v14);

  -[HKOverlayRoomSleepViewController trendModel](self, "trendModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HKOverlayRoomSleepViewController _buildSleepTrendContext:overlayChartController:](self, "_buildSleepTrendContext:overlayChartController:", v6, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v16);
    v17 = -[HKOverlayContextLocation initWithContainerIndex:sectionIndex:itemIndex:]([HKOverlayContextLocation alloc], "initWithContainerIndex:sectionIndex:itemIndex:", 1, 1, objc_msgSend(v13, "count") - 1);
    -[HKOverlayRoomSleepViewController setTrendContextLocation:](self, "setTrendContextLocation:", v17);

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SLEEP_AMOUNT_SECTION_HEADER"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
  v19 = objc_claimAutoreleasedReturnValue();

  v96 = (void *)v19;
  v97 = v13;
  v105 = -[HKOverlayContextSection initWithSectionTitle:overlayContextItems:]([HKOverlayContextSection alloc], "initWithSectionTitle:overlayContextItems:", v19, v13);
  -[HKOverlayRoomSleepViewController _consistencyContextForApplicationItems:overlayMode:isPrimaryContext:](self, "_consistencyContextForApplicationItems:overlayMode:isPrimaryContext:", v6, 3, 1);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = [HKOverlayContextSection alloc];
  v95 = (void *)v20;
  v121 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v121, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = -[HKOverlayContextSection initWithSectionTitle:overlayContextItems:](v21, "initWithSectionTitle:overlayContextItems:", 0, v22);

  -[HKOverlayRoomSleepViewController _buildDurationDisplayTypeForStackedWithApplicationItems:](self, "_buildDurationDisplayTypeForStackedWithApplicationItems:", v6);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = [_HKSleepComparisonContext alloc];
  objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[_HKSleepComparisonContext initWithStackedSampleType:currentCalendarOverride:overlayChartController:applicationItems:contextChangeDelegate:primarySleepDisplayType:](v25, "initWithStackedSampleType:currentCalendarOverride:overlayChartController:applicationItems:contextChangeDelegate:primarySleepDisplayType:", v26, 0, v7, v6, self, v23);

  v28 = [_HKSleepComparisonContext alloc];
  objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 61);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[_HKSleepComparisonContext initWithStackedSampleType:currentCalendarOverride:overlayChartController:applicationItems:contextChangeDelegate:primarySleepDisplayType:](v28, "initWithStackedSampleType:currentCalendarOverride:overlayChartController:applicationItems:contextChangeDelegate:primarySleepDisplayType:", v29, 0, v7, v6, self, v23);

  v93 = (void *)v30;
  v94 = (void *)v27;
  v120[0] = v27;
  v120[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObjectsFromArray:", v31);

  v32 = [_HKSleepComparisonContext alloc];
  objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 256);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = (void *)v23;
  v109 = v7;
  v34 = v6;
  v35 = -[_HKSleepComparisonContext initWithStackedSampleType:currentCalendarOverride:overlayChartController:applicationItems:contextChangeDelegate:primarySleepDisplayType:](v32, "initWithStackedSampleType:currentCalendarOverride:overlayChartController:applicationItems:contextChangeDelegate:primarySleepDisplayType:", v33, 0, v7, v6, self, v23);

  v36 = self;
  v37 = v24;
  v92 = (void *)v35;
  objc_msgSend(v24, "addObject:", v35);
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v38 = v36;
  -[HKOverlayRoomViewController factorDisplayTypes](v36, "factorDisplayTypes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v111;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v111 != v41)
          objc_enumerationMutation(obj);
        v43 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * v42);
        v44 = [_HKSleepComparisonFactorContext alloc];
        -[HKOverlayRoomSleepViewController sleepChartFormatter](v38, "sleepChartFormatter");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = -[_HKSleepComparisonFactorContext initWithStackedFactorDisplayType:currentCalendarOverride:overlayChartController:applicationItems:contextChangeDelegate:primarySleepDisplayType:sleepChartFormatter:](v44, "initWithStackedFactorDisplayType:currentCalendarOverride:overlayChartController:applicationItems:contextChangeDelegate:primarySleepDisplayType:sleepChartFormatter:", v43, 0, v109, v34, v38, v108, v45);

        if (-[HKOverlayRoomViewController factorDisplayTypeIsActive:](v38, "factorDisplayTypeIsActive:", v43))
          objc_msgSend(v37, "insertObject:atIndex:", v46, 0);
        else
          objc_msgSend(v37, "addObject:", v46);

        ++v42;
      }
      while (v40 != v42);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
    }
    while (v40);
  }

  v91 = v37;
  v89 = -[HKOverlayContextSection initWithSectionTitle:overlayContextItems:]([HKOverlayContextSection alloc], "initWithSectionTitle:overlayContextItems:", 0, v37);
  v86 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47 = v38;
  -[HKOverlayRoomSleepViewController _buildConsistencyDisplayTypeWithApplicationItems:](v38, "_buildConsistencyDisplayTypeWithApplicationItems:", v34);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = [HKOverlayContextSectionContainer alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("SLEEP_ANALYSIS_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v104;
  v118[1] = v105;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:primaryDisplayType:](v48, "initWithContainerTitle:overlayContextSections:primaryDisplayType:", v50, v51, v90);

  objc_msgSend(v86, "addObject:", v88);
  -[HKOverlayRoomSleepViewController _buildStagesDisplayTypeWithApplicationItems:](v38, "_buildStagesDisplayTypeWithApplicationItems:", v34);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v87 = v34;
  -[HKOverlayRoomSleepViewController _buildStagesDurationDisplayTypeWithApplicationItems:](v38, "_buildStagesDurationDisplayTypeWithApplicationItems:", v34);
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = [HKOverlayContextSection alloc];
  -[HKOverlayRoomSleepViewController _stageDurationContextForApplicationItems:baseDisplayType:sleepCategoryValue:](v38, "_stageDurationContextForApplicationItems:baseDisplayType:sleepCategoryValue:", v34, obja, 2);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v116[0] = v84;
  -[HKOverlayRoomSleepViewController _stageDurationContextForApplicationItems:baseDisplayType:sleepCategoryValue:](v38, "_stageDurationContextForApplicationItems:baseDisplayType:sleepCategoryValue:", v34, obja, 5);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v116[1] = v83;
  -[HKOverlayRoomSleepViewController _stageDurationContextForApplicationItems:baseDisplayType:sleepCategoryValue:](v38, "_stageDurationContextForApplicationItems:baseDisplayType:sleepCategoryValue:", v34, obja, 3);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v116[2] = v82;
  -[HKOverlayRoomSleepViewController _stageDurationContextForApplicationItems:baseDisplayType:sleepCategoryValue:](v38, "_stageDurationContextForApplicationItems:baseDisplayType:sleepCategoryValue:", v34, obja, 4);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v116[3] = v81;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 4);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = -[HKOverlayContextSection initWithSectionTitle:overlayContextItems:](v53, "initWithSectionTitle:overlayContextItems:", 0, v80);
  v117[0] = v79;
  v54 = [HKOverlayContextSection alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("SLEEP_STAGES_PERCENTAGE_SECTION_HEADER"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](v38, "applicationItems");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v52;
  -[HKOverlayRoomSleepViewController _sleepStagePercentageContextForStage:applicationItems:baseDisplayType:](v38, "_sleepStagePercentageContextForStage:applicationItems:baseDisplayType:", 2, v77, v52);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = v76;
  -[HKOverlayRoomViewController applicationItems](v38, "applicationItems");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)v52;
  -[HKOverlayRoomSleepViewController _sleepStagePercentageContextForStage:applicationItems:baseDisplayType:](v38, "_sleepStagePercentageContextForStage:applicationItems:baseDisplayType:", 5, v75, v52);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v115[1] = v57;
  -[HKOverlayRoomViewController applicationItems](v47, "applicationItems");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController _sleepStagePercentageContextForStage:applicationItems:baseDisplayType:](v47, "_sleepStagePercentageContextForStage:applicationItems:baseDisplayType:", 3, v58, v52);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v115[2] = v59;
  -[HKOverlayRoomViewController applicationItems](v47, "applicationItems");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController _sleepStagePercentageContextForStage:applicationItems:baseDisplayType:](v47, "_sleepStagePercentageContextForStage:applicationItems:baseDisplayType:", 4, v60, v56);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v115[3] = v61;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 4);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = -[HKOverlayContextSection initWithSectionTitle:overlayContextItems:](v54, "initWithSectionTitle:overlayContextItems:", v55, v62);
  v117[1] = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 2);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = [HKOverlayContextSectionContainer alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("SLEEP_STAGES_OVERLAY_CONTAINER_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:primaryDisplayType:](v64, "initWithContainerTitle:overlayContextSections:primaryDisplayType:", v66, v103, obja);

  objc_msgSend(v86, "insertObject:atIndex:", v67, 0);
  v68 = [HKOverlayContextSectionContainer alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "localizedStringForKey:value:table:", CFSTR("SLEEP_COMPARISON_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v89;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v68, "initWithContainerTitle:overlayContextSections:", v70, v71);

  objc_msgSend(v86, "addObject:", v72);
  v73 = -[HKOverlayContextLocation initWithContainerIndex:sectionIndex:itemIndex:]([HKOverlayContextLocation alloc], "initWithContainerIndex:sectionIndex:itemIndex:", 2, 0, 0);
  -[HKOverlayRoomSleepViewController setComparisonContextLocation:](v47, "setComparisonContextLocation:", v73);

  return v86;
}

- (id)_durationGoalContextForApplicationItems:(id)a3 durationDisplayType:(id)a4 overlayMode:(int64_t)a5 isPrimaryContext:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  _HKSleepDurationGoalContext *v12;
  void *v13;
  _HKSleepDurationGoalContext *v14;

  v6 = a6;
  v10 = a4;
  -[HKOverlayRoomSleepViewController _buildDurationGoalDisplayTypeWithApplicationItems:](self, "_buildDurationGoalDisplayTypeWithApplicationItems:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [_HKSleepDurationGoalContext alloc];
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[_HKSleepDurationGoalContext initWithBaseDisplayType:overlayDisplayType:overlayChartController:overlayMode:isPrimaryContext:contextChangeDelegate:](v12, "initWithBaseDisplayType:overlayDisplayType:overlayChartController:overlayMode:isPrimaryContext:contextChangeDelegate:", v10, v11, v13, a5, v6, self);

  return v14;
}

- (id)_consistencyContextForApplicationItems:(id)a3 overlayMode:(int64_t)a4 isPrimaryContext:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  _HKSleepScheduleContext *v11;
  void *v12;
  _HKSleepScheduleContext *v13;

  v5 = a5;
  v8 = a3;
  -[HKOverlayRoomSleepViewController _buildConsistencyDisplayTypeWithApplicationItems:](self, "_buildConsistencyDisplayTypeWithApplicationItems:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController _buildScheduleDisplayTypeWithApplicationItems:](self, "_buildScheduleDisplayTypeWithApplicationItems:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [_HKSleepScheduleContext alloc];
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_HKSleepScheduleContext initWithBaseDisplayType:overlayDisplayType:overlayChartController:overlayMode:isPrimaryContext:contextChangeDelegate:](v11, "initWithBaseDisplayType:overlayDisplayType:overlayChartController:overlayMode:isPrimaryContext:contextChangeDelegate:", v9, v10, v12, a4, v5, self);

  return v13;
}

- (id)_durationAverageContextForApplicationItems:(id)a3 durationDisplayType:(id)a4 useInBedAverage:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _HKSleepDurationAverageContext *v18;
  void *v19;
  _HKSleepDurationAverageContext *v20;
  id v22;
  _QWORD v23[4];
  _QWORD v24[5];

  v5 = a5;
  v24[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v22 = a4;
  -[HKOverlayRoomSleepViewController sleepDisplayType](self, "sleepDisplayType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unitController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSleepUtilities buildSleepGraphSeriesForSleepSeriesType:sleepDisplayType:unitController:numericAxisConfigurationOverrides:timeScope:](HKSleepUtilities, "buildSleepGraphSeriesForSleepSeriesType:sleepDisplayType:unitController:numericAxisConfigurationOverrides:timeScope:", 0, v9, v10, 0, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v11, "setHighlightedSleepValue:", &unk_1E9CED160);
    -[HKOverlayRoomSleepViewController _buildDurationAverageSeries](self, "_buildDurationAverageSeries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAverageValueType:", &unk_1E9CED160);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", _HKCategoryValueSleepAnalysisDefaultAsleepValue());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHighlightedSleepValue:", v13);

    -[HKOverlayRoomSleepViewController _buildDurationAverageSeries](self, "_buildDurationAverageSeries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", _HKCategoryValueSleepAnalysisDefaultAsleepValue());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAverageValueType:", v14);

  }
  v23[0] = &unk_1E9CED178;
  v23[1] = &unk_1E9CED190;
  v24[0] = v11;
  v24[1] = v12;
  v23[2] = &unk_1E9CED1A8;
  v23[3] = &unk_1E9CED1C0;
  v24[2] = v12;
  v24[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController _buildDurationAverageFormatter](self, "_buildDurationAverageFormatter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController _buildDurationAverageDisplayTypeWithApplicationItems:customSleepSeriesMapping:customSleepChartFormatter:](self, "_buildDurationAverageDisplayTypeWithApplicationItems:customSleepSeriesMapping:customSleepChartFormatter:", v8, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [_HKSleepDurationAverageContext alloc];
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[_HKSleepDurationAverageContext initWithBaseDisplayType:overlayDisplayType:overlayChartController:useInBedAverage:contextChangeDelegate:overlayAverageSeries:averageChartFormatter:](v18, "initWithBaseDisplayType:overlayDisplayType:overlayChartController:useInBedAverage:contextChangeDelegate:overlayAverageSeries:averageChartFormatter:", v22, v17, v19, v5, self, v12, v16);

  return v20;
}

- (id)_durationAmountContextForApplicationItems:(id)a3 durationDisplayType:(id)a4
{
  id v5;
  _HKSleepDurationAmountContext *v6;
  void *v7;
  _HKSleepDurationAmountContext *v8;

  v5 = a4;
  v6 = [_HKSleepDurationAmountContext alloc];
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_HKSleepDurationAmountContext initWithBaseDisplayType:overlayChartController:contextChangeDelegate:](v6, "initWithBaseDisplayType:overlayChartController:contextChangeDelegate:", v5, v7, self);

  return v8;
}

- (id)_sleepStagePercentageContextForStage:(int64_t)a3 applicationItems:(id)a4 baseDisplayType:(id)a5
{
  id v8;
  void *v9;
  HKSleepStagePercentageContext *v10;
  void *v11;
  HKSleepStagePercentageContext *v12;

  v8 = a5;
  -[HKOverlayRoomSleepViewController _buildStagesDurationDisplayTypeWithApplicationItems:](self, "_buildStagesDurationDisplayTypeWithApplicationItems:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController _updateHighlightedSleepStage:onDisplayType:](self, "_updateHighlightedSleepStage:onDisplayType:", a3, v9);
  v10 = [HKSleepStagePercentageContext alloc];
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKSleepStagePercentageContext initWithSleepStage:baseDisplayType:overlayDisplayType:overlayChartController:contextChangeDelegate:](v10, "initWithSleepStage:baseDisplayType:overlayDisplayType:overlayChartController:contextChangeDelegate:", a3, v8, v9, v11, self);

  return v12;
}

- (id)_stageDurationContextForApplicationItems:(id)a3 baseDisplayType:(id)a4 sleepCategoryValue:(int64_t)a5
{
  id v8;
  void *v9;
  HKSleepStageDurationContext *v10;
  void *v11;
  HKSleepStageDurationContext *v12;

  v8 = a4;
  -[HKOverlayRoomSleepViewController _buildStagesDisplayTypeWithApplicationItems:](self, "_buildStagesDisplayTypeWithApplicationItems:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController _updateHighlightedSleepStage:onDisplayType:](self, "_updateHighlightedSleepStage:onDisplayType:", a5, v9);
  v10 = [HKSleepStageDurationContext alloc];
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKSleepStageDurationContext initWithBaseDisplayType:overlayDisplayType:overlayChartController:contextChangeDelegate:sleepValue:](v10, "initWithBaseDisplayType:overlayDisplayType:overlayChartController:contextChangeDelegate:sleepValue:", v8, v9, v11, self, a5);

  return v12;
}

- (void)_updateHighlightedSleepStage:(int64_t)a3 onDisplayType:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v9, "seriesForTimeScopeMapping");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __79__HKOverlayRoomSleepViewController__updateHighlightedSleepStage_onDisplayType___block_invoke;
    v10[3] = &__block_descriptor_40_e27_v24__0__HKGraphSeries_8_B16l;
    v10[4] = a3;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  }
}

void __79__HKOverlayRoomSleepViewController__updateHighlightedSleepStage_onDisplayType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F01C9B08))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHighlightedSleepStage:", v3);

  }
}

- (int64_t)initialSelectedContainerIndexForMode:(int64_t)a3
{
  void *v5;
  char v6;
  objc_super v8;

  if (a3 == 3)
  {
    -[HKOverlayRoomSleepViewController trendModel](self, "trendModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "selectTrendInitially");

    if ((v6 & 1) != 0)
      return 1;
  }
  v8.receiver = self;
  v8.super_class = (Class)HKOverlayRoomSleepViewController;
  return -[HKOverlayRoomViewController initialSelectedContainerIndexForMode:](&v8, sel_initialSelectedContainerIndexForMode_, a3);
}

- (id)initialSelectedContextForMode:(int64_t)a3 containerIndex:(int64_t)a4
{
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _BYTE v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)v19 = 138543618;
    *(_QWORD *)&v19[4] = objc_opt_class();
    *(_WORD *)&v19[12] = 2048;
    *(_QWORD *)&v19[14] = a4;
    v8 = *(id *)&v19[4];
    _os_log_impl(&dword_1D7813000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Determining initial selected context for container index: %ld", v19, 0x16u);

  }
  -[HKOverlayRoomViewController chartController](self, "chartController", *(_OWORD *)v19, *(_QWORD *)&v19[16], v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updatePrimaryGraphViewController");

  -[HKOverlayRoomSleepViewController comparisonContextLocation](self, "comparisonContextLocation");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10
    || (v11 = (void *)v10,
        -[HKOverlayRoomSleepViewController comparisonContextLocation](self, "comparisonContextLocation"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "containerIndex"),
        v12,
        v11,
        v13 != a4))
  {
    -[HKOverlayRoomSleepViewController trendModel](self, "trendModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "selectTrendInitially") & 1) != 0)
    {
      -[HKOverlayRoomSleepViewController trendContextLocation](self, "trendContextLocation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "containerIndex");

      if (v17 == a4)
      {
        -[HKOverlayRoomSleepViewController trendContextLocation](self, "trendContextLocation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        return v14;
      }
    }
    else
    {

    }
    v14 = 0;
    return v14;
  }
  -[HKOverlayRoomSleepViewController comparisonContextLocation](self, "comparisonContextLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  return v14;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8;
  id v9;
  HKOverlayRoomSleepViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HKOverlayRoomSleepViewController *v15;

  v8 = a5;
  v9 = a4;
  v10 = [HKOverlayRoomSleepViewController alloc];
  -[HKOverlayRoomSleepViewController sleepDataSourceProvider](self, "sleepDataSourceProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController sleepChartFormatter](self, "sleepChartFormatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController trendModel](self, "trendModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKOverlayRoomSleepViewController initWithDisplayDate:applicationItems:sleepDataSourceProvider:sleepChartFormatter:mode:trendModel:factorDisplayTypes:](v10, "initWithDisplayDate:applicationItems:sleepDataSourceProvider:sleepChartFormatter:mode:trendModel:factorDisplayTypes:", v9, v8, v11, v12, a3, v13, v14);

  -[HKOverlayRoomViewController setAdditionalChartOptions:](v15, "setAdditionalChartOptions:", -[HKOverlayRoomViewController filteredInteractiveChartOptionsForMode:](self, "filteredInteractiveChartOptionsForMode:", a3));
  return v15;
}

- (BOOL)infographicSupportedForDisplayType:(id)a3 healthStore:(id)a4
{
  return -[HKOverlayRoomViewController segmentedControlSelectedIndex](self, "segmentedControlSelectedIndex", a3, a4) == 0;
}

- (id)infographicViewControllerForDisplayType:(id)a3 healthStore:(id)a4
{
  HKInfographicViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKInfographicViewController *v14;
  void *v15;
  void *v16;
  HKModalNavigationController *v17;
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  v5 = [HKInfographicViewController alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SLEEP_STAGES_DESCRIPTION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController _itemForTitle:titleAccessoryColor:description:](self, "_itemForTitle:titleAccessoryColor:description:", 0, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController _itemForSleepStageInfographicWithStage:](self, "_itemForSleepStageInfographicWithStage:", 2, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v9;
  -[HKOverlayRoomSleepViewController _itemForSleepStageInfographicWithStage:](self, "_itemForSleepStageInfographicWithStage:", 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v10;
  -[HKOverlayRoomSleepViewController _itemForSleepStageInfographicWithStage:](self, "_itemForSleepStageInfographicWithStage:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v11;
  -[HKOverlayRoomSleepViewController _itemForSleepStageInfographicWithStage:](self, "_itemForSleepStageInfographicWithStage:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKInfographicViewController initWithItems:](v5, "initWithItems:", v13);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SLEEP_STAGES"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController setTitle:](v14, "setTitle:", v16);

  v17 = -[HKModalNavigationController initWithRootViewController:]([HKModalNavigationController alloc], "initWithRootViewController:", v14);
  return v17;
}

- (id)_itemForTitle:(id)a3 titleAccessoryColor:(id)a4 description:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  unint64_t v12;
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
  HKInfographicContentItem *v23;
  void *v25;

  v7 = a3;
  v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E0CB3778];
  v10 = a5;
  v11 = objc_alloc_init(v9);
  v12 = 0x1E0CB3000;
  if (v7)
  {
    HKInteractiveChartInfographicTitleAttributes();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("circle.fill"), v15);
      v25 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "imageWithRenderingMode:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendAttributedString:", v19);

      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
      objc_msgSend(v11, "appendAttributedString:", v20);

      objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v8, 0, objc_msgSend(v11, "length"));
      v14 = v25;

      v12 = 0x1E0CB3000uLL;
    }
    v21 = (void *)objc_msgSend(objc_alloc(*(Class *)(v12 + 1176)), "initWithString:attributes:", v7, v13);
    objc_msgSend(v11, "appendAttributedString:", v21);

  }
  v22 = (void *)objc_msgSend(objc_alloc(*(Class *)(v12 + 1176)), "initWithString:", v10);

  v23 = -[HKInfographicContentItem initWithTitle:description:]([HKInfographicContentItem alloc], "initWithTitle:description:", v11, v22);
  return v23;
}

- (id)_itemForSleepStageInfographicWithStage:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[HKSleepUtilities localizedInfographicTitleForCategoryValue:](HKSleepUtilities, "localizedInfographicTitleForCategoryValue:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSleepUtilities localizedInfographicDescriptionForCategoryValue:](HKSleepUtilities, "localizedInfographicDescriptionForCategoryValue:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepColorForSleepAnalysis:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepViewController _itemForTitle:titleAccessoryColor:description:](self, "_itemForTitle:titleAccessoryColor:description:", v5, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dateRangeFromSelectionContext:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateRangeFromSelectionContext:timeScope:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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

- (id)titleForSelectedRangeData:(id)a3 displayType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  -[HKOverlayRoomSleepViewController _sleepColorForSelectedRangeData:](self, "_sleepColorForSelectedRangeData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartLollipopKeyFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSelectedRangeLabel attributedStringForSelectedRangeData:font:foregroundColor:prefixColor:prefersImageAffixes:embedded:](HKSelectedRangeLabel, "attributedStringForSelectedRangeData:font:foregroundColor:prefixColor:prefersImageAffixes:embedded:", v5, v7, v8, v6, objc_msgSend(v5, "prefersImageAffixes"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_sleepColorForSelectedRangeData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "prefixColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "prefixColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = -[HKOverlayRoomSleepViewController durationContextSelected](self, "durationContextSelected")
      || -[HKOverlayRoomSleepViewController scheduleContextSelected](self, "scheduleContextSelected")
      || -[HKOverlayRoomSleepViewController stageDurationContextSelected](self, "stageDurationContextSelected")
      || -[HKOverlayRoomSleepViewController stagePercentageContextSelected](self, "stagePercentageContextSelected");
    if (objc_msgSend(v4, "dataType") == 9)
    {
      if (v9)
        objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInactiveInBedColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInBedColor");
    }
    else
    {
      if (objc_msgSend(v4, "dataType") != 10)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKSelectedRangeLabel standardPrefixColorForSelectedRangeData:defaultColor:](HKSelectedRangeLabel, "standardPrefixColorForSelectedRangeData:defaultColor:", v4, v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_4;
      }
      if (v9)
        objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInactiveAsleepColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAsleepColor");
    }
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_4:

  return v7;
}

- (void)restoreUserActivityState:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = v7;
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    _os_log_impl(&dword_1D7813000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Restoring sleep chart with userInfo: %{public}@", buf, 0x16u);

  }
  v10.receiver = self;
  v10.super_class = (Class)HKOverlayRoomSleepViewController;
  -[HKOverlayRoomViewController restoreUserActivityState:](&v10, sel_restoreUserActivityState_, v4);

}

- (id)restorationStateDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("bundleName");
  v9[1] = CFSTR("chartContext");
  v10[0] = CFSTR("SleepHealthAppPlugin");
  v3 = objc_alloc_init(MEMORY[0x1E0C99E38]);
  v10[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8.receiver = self;
  v8.super_class = (Class)HKOverlayRoomSleepViewController;
  -[HKOverlayRoomViewController restorationStateDictionary](&v8, sel_restorationStateDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKInteractiveChartViewController mergeRestorationDictionary:otherDictionary:](HKInteractiveChartViewController, "mergeRestorationDictionary:otherDictionary:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)saveRestorationState
{
  void *v3;
  id v4;

  -[HKOverlayRoomSleepViewController restorationStateDictionary](self, "restorationStateDictionary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[HKInteractiveChartViewController baseRestorationUserActivity:activityType:title:](HKInteractiveChartViewController, "baseRestorationUserActivity:activityType:title:", v4, CFSTR("com.apple.health.plugin"), CFSTR("Sleep"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKInteractiveChartViewController saveRestorationUserActivity:viewController:](HKInteractiveChartViewController, "saveRestorationUserActivity:viewController:", v3, self);

}

- (BOOL)durationContextSelected
{
  return self->durationContextSelected;
}

- (BOOL)scheduleContextSelected
{
  return self->scheduleContextSelected;
}

- (BOOL)comparisonContextSelected
{
  return self->comparisonContextSelected;
}

- (BOOL)baseDisplayIsSchedule
{
  return self->baseDisplayIsSchedule;
}

- (void)setBaseDisplayIsSchedule:(BOOL)a3
{
  self->baseDisplayIsSchedule = a3;
}

- (BOOL)shouldHighlightBaseDisplayContext
{
  return self->shouldHighlightBaseDisplayContext;
}

- (void)setShouldHighlightBaseDisplayContext:(BOOL)a3
{
  self->shouldHighlightBaseDisplayContext = a3;
}

- (BOOL)stageDurationContextSelected
{
  return self->stageDurationContextSelected;
}

- (void)setStageDurationContextSelected:(BOOL)a3
{
  self->stageDurationContextSelected = a3;
}

- (BOOL)stagePercentageContextSelected
{
  return self->stagePercentageContextSelected;
}

- (BOOL)stagePercentageContextWillBeSelected
{
  return self->stagePercentageContextWillBeSelected;
}

- (void)setStagePercentageContextWillBeSelected:(BOOL)a3
{
  self->stagePercentageContextWillBeSelected = a3;
}

- (HKSleepDataSourceProvider)sleepDataSourceProvider
{
  return (HKSleepDataSourceProvider *)objc_loadWeakRetained((id *)&self->_sleepDataSourceProvider);
}

- (void)setSleepDataSourceProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sleepDataSourceProvider, a3);
}

- (HKInteractiveChartDataFormatter)sleepChartFormatter
{
  return self->_sleepChartFormatter;
}

- (void)setSleepChartFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_sleepChartFormatter, a3);
}

- (HKDisplayType)sleepDisplayType
{
  return self->_sleepDisplayType;
}

- (void)setSleepDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_sleepDisplayType, a3);
}

- (NSDictionary)sleepChartCaches
{
  return self->_sleepChartCaches;
}

- (void)setSleepChartCaches:(id)a3
{
  objc_storeStrong((id *)&self->_sleepChartCaches, a3);
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (HKOverlayContextLocation)trendContextLocation
{
  return self->_trendContextLocation;
}

- (void)setTrendContextLocation:(id)a3
{
  objc_storeStrong((id *)&self->_trendContextLocation, a3);
}

- (HKOverlayContextLocation)comparisonContextLocation
{
  return self->_comparisonContextLocation;
}

- (void)setComparisonContextLocation:(id)a3
{
  objc_storeStrong((id *)&self->_comparisonContextLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparisonContextLocation, 0);
  objc_storeStrong((id *)&self->_trendContextLocation, 0);
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_storeStrong((id *)&self->_sleepChartCaches, 0);
  objc_storeStrong((id *)&self->_sleepDisplayType, 0);
  objc_storeStrong((id *)&self->_sleepChartFormatter, 0);
  objc_destroyWeak((id *)&self->_sleepDataSourceProvider);
}

@end
