@implementation HKOverlayRoomFactorAndTrendViewController

- (HKOverlayRoomFactorAndTrendViewController)initWithBaseChartDisplayType:(id)a3 trendModel:(id)a4 factorDisplayTypes:(id)a5 displayDate:(id)a6 applicationItems:(id)a7 mode:(int64_t)a8 timeScopeRanges:(id)a9 initialTimeScope:(int64_t)a10 wrappedOverlay:(id)a11 overrideFirstWeekday:(int64_t)a12 overrideCalendar:(id)a13 additionalChartOptions:(unint64_t)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  HKOverlayRoomFactorAndTrendViewController *v26;
  void *v28;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a9;
  v24 = a11;
  v25 = a13;
  if (objc_msgSend(v18, "displayTypeIdentifier") == 100)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomFactorAndTrendViewController.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("baseChartDisplayType.displayTypeIdentifier != HKDisplayTypeIdentifierActivitySummary"));

  }
  v26 = -[HKOverlayRoomFactorAndTrendViewController initWithBaseChartDisplayType:trendModel:factorDisplayTypes:displayDate:applicationItems:mode:timeScopeRanges:initialTimeScope:wrappedOverlay:overrideFirstWeekday:overrideCalendar:additionalChartOptions:activityMoveMode:activityOptions:](self, "initWithBaseChartDisplayType:trendModel:factorDisplayTypes:displayDate:applicationItems:mode:timeScopeRanges:initialTimeScope:wrappedOverlay:overrideFirstWeekday:overrideCalendar:additionalChartOptions:activityMoveMode:activityOptions:", v18, v19, v20, v21, v22, a8, v23, a10, v24, a12, v25, a14, 1, 0);

  return v26;
}

- (HKOverlayRoomFactorAndTrendViewController)initWithBaseChartDisplayType:(id)a3 trendModel:(id)a4 factorDisplayTypes:(id)a5 displayDate:(id)a6 applicationItems:(id)a7 mode:(int64_t)a8 timeScopeRanges:(id)a9 initialTimeScope:(int64_t)a10 wrappedOverlay:(id)a11 overrideFirstWeekday:(int64_t)a12 overrideCalendar:(id)a13 additionalChartOptions:(unint64_t)a14 activityMoveMode:(int64_t)a15 activityOptions:(unint64_t)a16
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  HKOverlayRoomFactorAndTrendViewController *v31;
  int64_t v32;
  id obj;
  id v37;
  id v38;
  void *v39;
  id v40;
  objc_super v41;

  v40 = a3;
  obj = a4;
  v22 = a4;
  v23 = a6;
  v38 = a9;
  v37 = a11;
  v24 = a13;
  v25 = a7;
  v26 = a5;
  +[HKOverlayRoomTrendContext findInitialDateFromTrendModel:](HKOverlayRoomTrendContext, "findInitialDateFromTrendModel:", v22);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  v39 = v23;
  if (v27)
    v29 = (void *)v27;
  else
    v29 = v23;
  v30 = v29;

  v41.receiver = self;
  v41.super_class = (Class)HKOverlayRoomFactorAndTrendViewController;
  v31 = -[HKOverlayRoomViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:](&v41, sel_initWithDisplayDate_applicationItems_factorDisplayTypes_mode_, v30, v25, v26, a8);

  if (v31)
  {
    objc_storeStrong((id *)&v31->_baseChartDisplayType, a3);
    objc_storeStrong((id *)&v31->_trendModel, obj);
    v32 = +[HKOverlayRoomTrendContext findStartingTimeScopeFromTrendModel:](HKOverlayRoomTrendContext, "findStartingTimeScopeFromTrendModel:", v22);
    if (v32 != 8)
      a10 = v32;
    v31->_startingTimeScope = a10;
    objc_storeStrong((id *)&v31->_timeScopeRanges, a9);
    objc_storeStrong((id *)&v31->_wrappedOverlayViewController, a11);
    -[HKOverlayRoomViewController setShouldSelectInitialOverlay:](v31, "setShouldSelectInitialOverlay:", objc_msgSend(v22, "selectTrendInitially"));
    v31->_overrideFirstWeekday = a12;
    objc_storeStrong((id *)&v31->_overrideCalendar, a13);
    -[HKOverlayRoomViewController setAdditionalChartOptions:](v31, "setAdditionalChartOptions:", a14 | 0x10000);
    v31->_activityMoveMode = a15;
    v31->_activityOptions = a16;
  }

  return v31;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HKOverlayRoomFactorAndTrendViewController baseChartDisplayType](self, "baseChartDisplayType", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
    -[HKOverlayRoomFactorAndTrendViewController _buildFullModeSectionContainerWithOverlayController:applicationItems:](self, "_buildFullModeSectionContainerWithOverlayController:applicationItems:", v9, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    v10 = [HKOverlayContextSectionContainer alloc];
    -[HKOverlayRoomFactorAndTrendViewController _primarySectionForApplicationItems:overlayChartController:](self, "_primarySectionForApplicationItems:overlayChartController:", v8, v9);
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

- (id)preferredInitialOverlayIndex
{
  return &unk_1E9CEB450;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  HKOverlayRoomViewController *wrappedOverlayViewController;
  id v8;
  HKOverlayRoomFactorAndTrendViewController *v9;
  void *v11;
  int64_t v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  HKOverlayRoomFactorAndTrendViewController *v20;
  id v21;

  wrappedOverlayViewController = self->_wrappedOverlayViewController;
  if (wrappedOverlayViewController)
  {
    v8 = a5;
    -[HKOverlayRoomViewController createViewControllerForMode:displayDate:applicationItems:](wrappedOverlayViewController, "createViewControllerForMode:displayDate:applicationItems:", a3, a4, v8);
    v9 = (HKOverlayRoomFactorAndTrendViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = a5;
    v20 = [HKOverlayRoomFactorAndTrendViewController alloc];
    -[HKOverlayRoomFactorAndTrendViewController baseChartDisplayType](self, "baseChartDisplayType");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomFactorAndTrendViewController trendModel](self, "trendModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController displayDate](self, "displayDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomFactorAndTrendViewController timeScopeRanges](self, "timeScopeRanges");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HKOverlayRoomFactorAndTrendViewController startingTimeScope](self, "startingTimeScope");
    -[HKOverlayRoomFactorAndTrendViewController wrappedOverlayViewController](self, "wrappedOverlayViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HKOverlayRoomFactorAndTrendViewController overrideFirstWeekday](self, "overrideFirstWeekday");
    -[HKOverlayRoomFactorAndTrendViewController overrideCalendar](self, "overrideCalendar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKOverlayRoomFactorAndTrendViewController initWithBaseChartDisplayType:trendModel:factorDisplayTypes:displayDate:applicationItems:mode:timeScopeRanges:initialTimeScope:wrappedOverlay:overrideFirstWeekday:overrideCalendar:additionalChartOptions:activityMoveMode:activityOptions:](v20, "initWithBaseChartDisplayType:trendModel:factorDisplayTypes:displayDate:applicationItems:mode:timeScopeRanges:initialTimeScope:wrappedOverlay:overrideFirstWeekday:overrideCalendar:additionalChartOptions:activityMoveMode:activityOptions:", v8, v19, v18, v17, v21, a3, v11, v12, v13, v14, v15, -[HKOverlayRoomViewController additionalChartOptions](self, "additionalChartOptions"), -[HKOverlayRoomFactorAndTrendViewController activityMoveMode](self, "activityMoveMode"), -[HKOverlayRoomFactorAndTrendViewController activityOptions](self, "activityOptions"));

  }
  return v9;
}

- (BOOL)supportsShowAllFilters
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  if (-[HKOverlayRoomViewController controllerMode](self, "controllerMode") == 3)
    return 0;
  if (self->_wrappedOverlayViewController)
    return 1;
  return v5;
}

- (id)createChartOverlayViewController
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HKInteractiveChartActivityController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HKInteractiveChartActivityController *v17;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HKInteractiveChartOverlayViewController *v35;
  void *v36;
  int64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HKInteractiveChartOverlayViewController *v42;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_super v57;

  -[HKOverlayRoomFactorAndTrendViewController timeScopeRanges](self, "timeScopeRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKOverlayRoomFactorAndTrendViewController timeScopeRanges](self, "timeScopeRanges");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HKOverlayRoomFactorAndTrendViewController startingTimeScope](self, "startingTimeScope") == 8)
    {
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeScopeController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = 4;
    }
    else
    {
      v19 = -[HKOverlayRoomFactorAndTrendViewController startingTimeScope](self, "startingTimeScope");
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeScopeController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = v19;
    }
    objc_msgSend(v21, "setSelectedTimeScope:", v23);

    -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "hk_interactiveChartOptions");

    if (-[HKOverlayRoomViewController shouldSelectInitialOverlay](self, "shouldSelectInitialOverlay"))
      v26 = 663552;
    else
      v26 = 655360;
    v44 = v26 | v25 | -[HKOverlayRoomViewController additionalChartOptions](self, "additionalChartOptions");
    v42 = [HKInteractiveChartOverlayViewController alloc];
    -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "healthStore");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "unitController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dateCache");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "chartDataCacheController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "timeScopeController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sampleDateRangeController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController displayDate](self, "displayDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomFactorAndTrendViewController overrideCalendar](self, "overrideCalendar");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[HKInteractiveChartOverlayViewController initWithTimeScopeRanges:healthStore:primaryDisplayType:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:](v42, "initWithTimeScopeRanges:healthStore:primaryDisplayType:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:", v55, v54, v52, v40, v27, v28, v30, v32, v33, v34, v44);

    -[HKOverlayRoomFactorAndTrendViewController overrideCalendar](self, "overrideCalendar");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
      -[HKInteractiveChartViewController setAnnotationDataSourceFirstWeekday:](v35, "setAnnotationDataSourceFirstWeekday:", -[HKOverlayRoomFactorAndTrendViewController overrideFirstWeekday](self, "overrideFirstWeekday"));

  }
  else
  {
    -[HKOverlayRoomFactorAndTrendViewController baseChartDisplayType](self, "baseChartDisplayType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isActivitySummary");

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB7038]);
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "healthStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v6, "initWithHealthStore:", v8);

      v10 = [HKInteractiveChartActivityController alloc];
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "healthStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "unitController");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "dateCache");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "chartDataCacheController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "timeScopeController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sampleDateRangeController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomViewController displayDate](self, "displayDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[HKInteractiveChartActivityController initWithHealthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:wheelchairUseCharacteristicCache:initialXValue:activityMoveMode:activityOptions:chartSharableModel:](v10, "initWithHealthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:wheelchairUseCharacteristicCache:initialXValue:activityMoveMode:activityOptions:chartSharableModel:", v11, v47, v43, v12, v13, v15, v9, v16, -[HKOverlayRoomFactorAndTrendViewController activityMoveMode](self, "activityMoveMode"), -[HKOverlayRoomFactorAndTrendViewController activityOptions](self, "activityOptions"), 0);

      return v17;
    }
    if (-[HKOverlayRoomViewController shouldSelectInitialOverlay](self, "shouldSelectInitialOverlay")
      && -[HKOverlayRoomFactorAndTrendViewController startingTimeScope](self, "startingTimeScope") != 8)
    {
      v37 = -[HKOverlayRoomFactorAndTrendViewController startingTimeScope](self, "startingTimeScope");
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "timeScopeController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setSelectedTimeScope:", v37);

    }
    v57.receiver = self;
    v57.super_class = (Class)HKOverlayRoomFactorAndTrendViewController;
    -[HKOverlayRoomViewController createChartOverlayViewController](&v57, sel_createChartOverlayViewController);
    v35 = (HKInteractiveChartOverlayViewController *)objc_claimAutoreleasedReturnValue();
  }
  return v35;
}

- (id)_primarySectionForApplicationItems:(id)a3 overlayChartController:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HKOverlayContextSection *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKOverlayRoomFactorAndTrendViewController trendModel](self, "trendModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HKOverlayRoomFactorAndTrendViewController _primaryTrendContextForApplicationItems:overlayChartController:](self, "_primaryTrendContextForApplicationItems:overlayChartController:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController chartController](self, "chartController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTrendAccessibilityDelegate:", v10);

    objc_msgSend(v8, "addObject:", v10);
  }
  v12 = -[HKOverlayContextSection initWithSectionTitle:overlayContextItems:]([HKOverlayContextSection alloc], "initWithSectionTitle:overlayContextItems:", 0, v8);
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_primaryTrendContextForApplicationItems:(id)a3 overlayChartController:(id)a4
{
  id v6;
  id v7;
  HKOverlayRoomTrendContext *v8;
  void *v9;
  void *v10;
  HKOverlayRoomTrendContext *v11;

  v6 = a4;
  v7 = a3;
  v8 = [HKOverlayRoomTrendContext alloc];
  -[HKOverlayRoomFactorAndTrendViewController baseChartDisplayType](self, "baseChartDisplayType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomFactorAndTrendViewController trendModel](self, "trendModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKOverlayRoomTrendContext initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:](v8, "initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:", v9, v10, v6, v7, -[HKOverlayRoomViewController controllerMode](self, "controllerMode"));

  return v11;
}

- (id)_buildFullModeSectionContainerWithOverlayController:(id)a3 applicationItems:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  HKOverlayContextSectionContainer *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  -[HKOverlayRoomFactorAndTrendViewController _primarySectionForApplicationItems:overlayChartController:](self, "_primarySectionForApplicationItems:overlayChartController:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObjectsFromArray:", v10);
  -[HKOverlayRoomViewController buildFactorContextSectionForChartController](self, "buildFactorContextSectionForChartController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v9, "addObject:", v11);
  v12 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:]([HKOverlayContextSectionContainer alloc], "initWithContainerTitle:overlayContextSections:", 0, v9);
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)buildFactorContextForDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8 allowsDeselection:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  char isKindOfClass;
  uint64_t v22;
  void *v23;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  -[HKOverlayRoomFactorAndTrendViewController baseChartDisplayType](self, "baseChartDisplayType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "isActivitySummary"))
  {

    goto LABEL_5;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_5:
    v25.receiver = self;
    v25.super_class = (Class)HKOverlayRoomFactorAndTrendViewController;
    -[HKOverlayRoomViewController buildFactorContextForDisplayType:factorDisplayType:overlayChartController:currentCalendarOverride:applicationItems:overlayMode:allowsDeselection:](&v25, sel_buildFactorContextForDisplayType_factorDisplayType_overlayChartController_currentCalendarOverride_applicationItems_overlayMode_allowsDeselection_, v15, v16, v17, v18, v19, a8, a9);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v17, "buildFactorContextForDisplayType:factorDisplayType:overlayChartController:currentCalendarOverride:applicationItems:overlayMode:", v15, v16, v17, v18, v19, a8);
  v22 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v23 = (void *)v22;

  return v23;
}

- (HKDisplayType)baseChartDisplayType
{
  return self->_baseChartDisplayType;
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (HKOverlayRoomViewController)wrappedOverlayViewController
{
  return self->_wrappedOverlayViewController;
}

- (void)setWrappedOverlayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedOverlayViewController, a3);
}

- (NSDictionary)timeScopeRanges
{
  return self->_timeScopeRanges;
}

- (void)setTimeScopeRanges:(id)a3
{
  objc_storeStrong((id *)&self->_timeScopeRanges, a3);
}

- (int64_t)startingTimeScope
{
  return self->_startingTimeScope;
}

- (int64_t)overrideFirstWeekday
{
  return self->_overrideFirstWeekday;
}

- (NSCalendar)overrideCalendar
{
  return self->_overrideCalendar;
}

- (int64_t)activityMoveMode
{
  return self->_activityMoveMode;
}

- (unint64_t)activityOptions
{
  return self->_activityOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideCalendar, 0);
  objc_storeStrong((id *)&self->_timeScopeRanges, 0);
  objc_storeStrong((id *)&self->_wrappedOverlayViewController, 0);
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_storeStrong((id *)&self->_baseChartDisplayType, 0);
}

@end
