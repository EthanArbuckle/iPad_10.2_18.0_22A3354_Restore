@implementation HKOverlayRoomViewController

- (HKOverlayRoomViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  HKOverlayRoomViewController *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDateInterval *currentChartDateInterval;
  HKOverlayContextLocation *currentSelectedContextLocation;
  HKDisplayType *primaryDisplayType;
  NSArray *overlayContextSectionContainers;
  HKOverlayContextLocation *initialSelectedContextLocation;
  NSUserActivity *showAllFiltersActivity;
  HKOverlayContextLocation *restorationContextLocation;
  UISegmentedControl *segmentedControl;
  UIView *topLevelChartView;
  UIView *topLevelOverlaysWithOptionalSegmentView;
  UIStackView *chartOverlayStackView;
  uint64_t v32;
  OS_dispatch_queue *contextUpdateQueue;
  HKValueRange *initialVisibleDateRange;
  void *v35;
  HKMaximumSizeView *singleContextMaximumSizeView;
  _TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager *v37;
  void *v38;
  uint64_t v39;
  _TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager *analyticsManager;
  void *v41;
  uint64_t v42;
  UITraitChangeRegistration *traitChangeRegistration;
  NSArray *previousStackHeights;
  objc_super v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v46.receiver = self;
  v46.super_class = (Class)HKOverlayRoomViewController;
  v14 = -[HKOverlayRoomViewController initWithNibName:bundle:](&v46, sel_initWithNibName_bundle_, 0, 0);
  if (v14)
  {
    if (v11)
    {
      v15 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;
    objc_storeStrong((id *)&v14->_applicationItems, a4);
    objc_msgSend(v12, "timeScopeController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14->_currentChartTimeScope = objc_msgSend(v17, "selectedTimeScope");

    v18 = (void *)MEMORY[0x1E0CB3588];
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hk_dateIntervalForDayFromDate:calendar:", v16, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    currentChartDateInterval = v14->_currentChartDateInterval;
    v14->_currentChartDateInterval = (NSDateInterval *)v20;

    currentSelectedContextLocation = v14->_currentSelectedContextLocation;
    v14->_currentSelectedContextLocation = 0;

    objc_storeStrong((id *)&v14->_displayDate, a3);
    v14->_controllerMode = a6;
    v14->_userHasOverriddenPreferredOverlay = 0;
    primaryDisplayType = v14->_primaryDisplayType;
    v14->_primaryDisplayType = 0;

    overlayContextSectionContainers = v14->_overlayContextSectionContainers;
    v14->_overlayContextSectionContainers = (NSArray *)MEMORY[0x1E0C9AA60];

    initialSelectedContextLocation = v14->_initialSelectedContextLocation;
    v14->_initialSelectedContextLocation = 0;

    v14->_showAllFiltersVisible = 0;
    showAllFiltersActivity = v14->_showAllFiltersActivity;
    v14->_showAllFiltersActivity = 0;

    restorationContextLocation = v14->_restorationContextLocation;
    v14->_restorationContextLocation = 0;

    segmentedControl = v14->_segmentedControl;
    v14->_segmentedControl = 0;

    topLevelChartView = v14->_topLevelChartView;
    v14->_topLevelChartView = 0;

    topLevelOverlaysWithOptionalSegmentView = v14->_topLevelOverlaysWithOptionalSegmentView;
    v14->_topLevelOverlaysWithOptionalSegmentView = 0;

    v14->_topLevelAxis = 1;
    chartOverlayStackView = v14->_chartOverlayStackView;
    v14->_chartOverlayStackView = 0;

    HKCreateSerialDispatchQueue();
    v32 = objc_claimAutoreleasedReturnValue();
    contextUpdateQueue = v14->_contextUpdateQueue;
    v14->_contextUpdateQueue = (OS_dispatch_queue *)v32;

    v14->_shouldSelectInitialOverlay = 1;
    v14->_additionalChartOptions = 0;
    initialVisibleDateRange = v14->_initialVisibleDateRange;
    v14->_initialVisibleDateRange = 0;

    v14->_previousHorizontalSizeClass = 0;
    v14->_previousWidthDesignation = 1;
    -[HKOverlayRoomViewController navigationItem](v14, "navigationItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setLargeTitleDisplayMode:", 2);

    singleContextMaximumSizeView = v14->_singleContextMaximumSizeView;
    v14->_singleContextMaximumSizeView = 0;

    v37 = [_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager alloc];
    objc_msgSend(v12, "healthStore");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[HKInteractiveChartInteractionAnalyticsManager initWithHealthStore:](v37, "initWithHealthStore:", v38);
    analyticsManager = v14->_analyticsManager;
    v14->_analyticsManager = (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager *)v39;

    v47[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController registerForTraitChanges:withTarget:action:](v14, "registerForTraitChanges:withTarget:action:", v41, v14, sel__horizontalSizeClassChanged_);
    v42 = objc_claimAutoreleasedReturnValue();
    traitChangeRegistration = v14->_traitChangeRegistration;
    v14->_traitChangeRegistration = (UITraitChangeRegistration *)v42;

    objc_storeStrong((id *)&v14->_factorDisplayTypes, a5);
    previousStackHeights = v14->_previousStackHeights;
    v14->_previousStackHeights = 0;

  }
  return v14;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("class %@ (%p)"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomViewController.m"), 208, CFSTR("Subclasses must implement controllerTitleWithApplicationItems"));

  return CFSTR("**NO**TITLE**");
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3488];
  v6 = a3;
  objc_msgSend(v5, "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomViewController.m"), 214, CFSTR("Subclasses must implement primaryDisplayTypeWithApplicationItems:"));

  objc_msgSend(v6, "displayTypeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "displayTypeWithIdentifier:", &unk_1E9CEADF0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomViewController.m"), 221, CFSTR("Subclasses must implement contextSectionContainersForMode:applicationItems:overlayChartController"));

  return (id)MEMORY[0x1E0C9AA60];
}

- (int64_t)initialSelectedContainerIndexForMode:(int64_t)a3
{
  return 0;
}

- (id)initialSelectedContextForMode:(int64_t)a3 containerIndex:(int64_t)a4
{
  void *v6;
  HKOverlayContextLocation *v7;

  -[HKOverlayRoomViewController preferredInitialOverlayIndex](self, "preferredInitialOverlayIndex", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && -[HKOverlayRoomViewController containerIndexForHealthFactors](self, "containerIndexForHealthFactors") != a4)
    v7 = -[HKOverlayContextLocation initWithContainerIndex:sectionIndex:itemIndex:]([HKOverlayContextLocation alloc], "initWithContainerIndex:sectionIndex:itemIndex:", a4, 0, objc_msgSend(v6, "integerValue"));
  else
    v7 = 0;

  return v7;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomViewController.m"), 248, CFSTR("Subclasses must implement createViewControllerMode:displayDate:applicationItems:"));

  return 0;
}

- (BOOL)supportsShowAllFilters
{
  return (unint64_t)(-[HKOverlayRoomViewController controllerMode](self, "controllerMode") - 1) < 2;
}

- (id)showAllFiltersButtonTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v4, "isEqualToString:", &stru_1E9C4C428) & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHOW_MORE_%@_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHOW_MORE_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)preferredInitialOverlayIndex
{
  return 0;
}

- (unint64_t)filteredInteractiveChartOptionsForMode:(int64_t)a3
{
  unint64_t result;

  result = -[HKOverlayRoomViewController additionalChartOptions](self, "additionalChartOptions");
  if (a3 == 3)
    result |= 0x2000uLL;
  return result;
}

- (id)buildFactorContextSectionForChartController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HKOverlayContextSection *v8;
  void *v9;
  HKOverlayContextSection *v10;

  -[HKOverlayRoomViewController buildFactorContextsAllowingDeselection:](self, "buildFactorContextsAllowingDeselection:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "activeFactorContexts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inactiveFactorContexts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [HKOverlayContextSection alloc];
    -[HKOverlayRoomViewController _healthFactorsSectionTitle](self, "_healthFactorsSectionTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HKOverlayContextSection initWithSectionTitle:overlayContextItems:](v8, "initWithSectionTitle:overlayContextItems:", v9, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)buildFactorContextsAllowingDeselection:(BOOL)a3
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HKOverlayRoomActiveInactiveFactorContexts *v17;
  void *v19;
  uint64_t v20;
  id obj;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[HKOverlayRoomViewController healthFactorsEnabled](self, "healthFactorsEnabled"))
  {
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomViewController.m"), 315, CFSTR("Nil primary display type"));

    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10);
          -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKOverlayRoomViewController chartController](self, "chartController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v20) = a3;
          -[HKOverlayRoomViewController buildFactorContextForDisplayType:factorDisplayType:overlayChartController:currentCalendarOverride:applicationItems:overlayMode:allowsDeselection:](self, "buildFactorContextForDisplayType:factorDisplayType:overlayChartController:currentCalendarOverride:applicationItems:overlayMode:allowsDeselection:", v12, v11, v13, 0, v14, -[HKOverlayRoomViewController controllerMode](self, "controllerMode"), v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            if (-[HKOverlayRoomViewController factorDisplayTypeIsActive:](self, "factorDisplayTypeIsActive:", v11))
              v16 = v23;
            else
              v16 = v22;
            objc_msgSend(v16, "addObject:", v15);
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v8);
    }

    v17 = -[HKOverlayRoomActiveInactiveFactorContexts initWithActiveFactorContexts:inactiveFactorContexts:]([HKOverlayRoomActiveInactiveFactorContexts alloc], "initWithActiveFactorContexts:inactiveFactorContexts:", v23, v22);
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (BOOL)factorDisplayTypeIsActive:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;

  objc_msgSend(a3, "sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sampleDateRangeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dateRangeForSampleType:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "containsValue:exclusiveStart:exclusiveEnd:", v9, 0, 0);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)combineFactors:(id)a3 standardFactors:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "activeFactorContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "inactiveFactorContexts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)buildFactorContextForDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8 allowsDeselection:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HKOverlayRoomFactorContext *v20;
  uint64_t v22;

  v14 = a3;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v14;
    LOBYTE(v22) = a9;
    v20 = -[HKOverlayRoomFactorContext initWithPrimaryInteractiveChartDisplayType:factorDisplayType:overlayChartController:currentCalendarOverride:applicationItems:overlayMode:allowsDeselection:]([HKOverlayRoomFactorContext alloc], "initWithPrimaryInteractiveChartDisplayType:factorDisplayType:overlayChartController:currentCalendarOverride:applicationItems:overlayMode:allowsDeselection:", v19, v18, v17, v16, v15, a8, v22);

  }
  else
  {
    LOBYTE(v22) = a9;
    v20 = -[HKOverlayRoomFactorContext initWithPrimaryDisplayType:factorDisplayType:overlayChartController:currentCalendarOverride:applicationItems:overlayMode:allowsDeselection:]([HKOverlayRoomFactorContext alloc], "initWithPrimaryDisplayType:factorDisplayType:overlayChartController:currentCalendarOverride:applicationItems:overlayMode:allowsDeselection:", v14, v18, v17, v16, v15, a8, v22);
  }

  return v20;
}

- (id)_addHealthFactorsIfNecessary:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HKOverlayContextSection *v10;
  HKOverlayContextSectionContainer *v11;
  void *v12;
  void *v13;
  HKOverlayContextSectionContainer *v14;
  void *v15;
  HKOverlayContextSectionContainer *v16;
  void *v17;
  void *v18;
  void *v19;
  HKOverlayContextSectionContainer *v20;
  void *v22;
  uint8_t buf[4];
  HKOverlayRoomViewController *v24;
  _QWORD v25[2];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (-[HKOverlayRoomViewController supportsHealthFactors](self, "supportsHealthFactors"))
  {
    v5 = v4;
    if (!-[HKOverlayRoomViewController _containersContainHealthFactorsSection:](self, "_containersContainHealthFactorsSection:", v4))
    {
      v5 = v4;
      if (-[HKOverlayRoomViewController controllerMode](self, "controllerMode") == 3)
      {
        if (objc_msgSend(v4, "count") == 1)
        {
          -[HKOverlayRoomViewController buildFactorContextsAllowingDeselection:](self, "buildFactorContextsAllowingDeselection:", 1);
          v6 = objc_claimAutoreleasedReturnValue();
          v7 = v6;
          if (v6)
          {
            -[NSObject activeFactorContexts](v6, "activeFactorContexts");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject inactiveFactorContexts](v7, "inactiveFactorContexts");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v10 = -[HKOverlayContextSection initWithSectionTitle:overlayContextItems:]([HKOverlayContextSection alloc], "initWithSectionTitle:overlayContextItems:", 0, v22);
            v11 = [HKOverlayContextSectionContainer alloc];
            -[HKOverlayRoomViewController _healthFactorsSectionTitle](self, "_healthFactorsSectionTitle");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v26[0] = v10;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v11, "initWithContainerTitle:overlayContextSections:", v12, v13);

            objc_msgSend(v4, "firstObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = [HKOverlayContextSectionContainer alloc];
            -[HKOverlayRoomViewController _healthFactorsMeasurementSectionTitle](self, "_healthFactorsMeasurementSectionTitle");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "overlayContextSections");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "primaryDisplayType");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:primaryDisplayType:](v16, "initWithContainerTitle:overlayContextSections:primaryDisplayType:", v17, v18, v19);

            v25[0] = v20;
            v25[1] = v14;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
            v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
            goto LABEL_11;
          }
        }
        else
        {
          _HKInitializeLogging();
          HKUILogCharting();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v24 = self;
            _os_log_impl(&dword_1D7813000, v7, OS_LOG_TYPE_DEFAULT, "HKOverlayRoomViewController %@: Supports health factors but does not define a location for the factor contexts", buf, 0xCu);
          }
        }
        v5 = v4;
        goto LABEL_10;
      }
    }
  }
LABEL_11:

  return v5;
}

- (int64_t)containerIndexForHealthFactors
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  unint64_t v12;

  -[HKOverlayRoomViewController _healthFactorsSectionTitle](self, "_healthFactorsSectionTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    while (1)
    {
      -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "localizedContainerTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", v3);

      if ((v10 & 1) != 0)
        break;
      ++v6;
      -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v6 >= v12)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v6 = -1;
  }

  return v6;
}

- (BOOL)_containersContainHealthFactorsSection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  BOOL v22;
  uint64_t v24;
  uint64_t v25;
  HKOverlayRoomViewController *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v38;
    v26 = self;
    v24 = *(_QWORD *)v38;
    do
    {
      v7 = 0;
      v25 = v5;
      do
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v7);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v8, "overlayContextSections");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v28)
        {
          v10 = *(_QWORD *)v34;
          v27 = *(_QWORD *)v34;
          while (2)
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v34 != v10)
                objc_enumerationMutation(v9);
              v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend(v12, "localizedSectionTitle");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKOverlayRoomViewController _healthFactorsSectionTitle](self, "_healthFactorsSectionTitle");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v13, "isEqualToString:", v14);

              if ((v15 & 1) != 0)
              {
LABEL_27:

                v22 = 1;
                goto LABEL_29;
              }
              v31 = 0u;
              v32 = 0u;
              v29 = 0u;
              v30 = 0u;
              objc_msgSend(v12, "overlayContextItems");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v30;
                while (2)
                {
                  for (j = 0; j != v18; ++j)
                  {
                    if (*(_QWORD *)v30 != v19)
                      objc_enumerationMutation(v16);
                    v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
                    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v21, "healthFactorContext") & 1) != 0)
                    {

                      goto LABEL_27;
                    }
                  }
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
                  if (v18)
                    continue;
                  break;
                }
              }

              v10 = v27;
              self = v26;
            }
            v6 = v24;
            v28 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
            if (v28)
              continue;
            break;
          }
        }

        ++v7;
      }
      while (v7 != v25);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      v22 = 0;
    }
    while (v5);
  }
  else
  {
    v22 = 0;
  }
LABEL_29:

  return v22;
}

- (id)_healthFactorsSectionTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEALTH_EVENTS_SECTION_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Seahorse"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_healthFactorsMeasurementSectionTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEALTH_EVENTS_MEASUREMENT_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Seahorse"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)supportsHealthFactors
{
  return 1;
}

- (BOOL)healthFactorsEnabled
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[HKOverlayRoomViewController supportsHealthFactors](self, "supportsHealthFactors"))
    return 0;
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

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKOverlayRoomViewController;
  -[HKOverlayRoomViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[HKOverlayRoomViewController _setupPrimaryDisplayType](self, "_setupPrimaryDisplayType");
  -[HKOverlayRoomViewController _setupInterface](self, "_setupInterface");
  -[HKOverlayRoomViewController _setupOverlayContextItems](self, "_setupOverlayContextItems");
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sampleDateRangeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

  -[HKOverlayRoomViewController _subscribeToSampleTypeUpdates](self, "_subscribeToSampleTypeUpdates");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKOverlayRoomViewController;
  -[HKOverlayRoomViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[HKOverlayRoomViewController _layoutSegmentedControl](self, "_layoutSegmentedControl");
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v4;
  void *v5;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKOverlayRoomViewController;
  -[HKOverlayRoomViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  v4 = -[UIViewController hk_viewIsHidden](self, "hk_viewIsHidden");
  -[HKOverlayRoomViewController restorationUserActivity](self, "restorationUserActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!v4)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__HKOverlayRoomViewController_viewDidAppear___block_invoke;
      block[3] = &unk_1E9C3F0D0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

void __45__HKOverlayRoomViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "restorationUserActivity");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "restoreUserActivityState:", v2);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sampleDateRangeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sampleTypeUpdateController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sampleType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:forType:", self, v8);

  -[HKOverlayRoomViewController traitChangeRegistration](self, "traitChangeRegistration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController unregisterForTraitChanges:](self, "unregisterForTraitChanges:", v9);

  v10.receiver = self;
  v10.super_class = (Class)HKOverlayRoomViewController;
  -[HKOverlayRoomViewController dealloc](&v10, sel_dealloc);
}

- (void)reloadOverlayContextItems
{
  -[HKOverlayRoomViewController _unselectCurrentContext](self, "_unselectCurrentContext");
  -[HKOverlayRoomViewController _setupOverlayContainers](self, "_setupOverlayContainers");
  -[HKOverlayRoomViewController _setupOverlayContextItems](self, "_setupOverlayContextItems");
}

- (void)refreshOverlayContextItems
{
  -[HKOverlayRoomViewController _refreshContextItemsAndUpdateChart:](self, "_refreshContextItemsAndUpdateChart:", 0);
}

- (void)_updateContextTiles
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

  -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HKOverlayRoomViewController sectionedContextView](self, "sectionedContextView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HKOverlayRoomViewController initialSelectedContextLocation](self, "initialSelectedContextLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[HKOverlayRoomViewController sectionedContextView](self, "sectionedContextView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", -[HKOverlayRoomViewController segmentedControlSelectedIndex](self, "segmentedControlSelectedIndex"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "overlayContextSections");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setDisplayTypeContextSections:", v11);
LABEL_7:

        if (!-[HKOverlayRoomViewController userHasOverriddenPreferredOverlay](self, "userHasOverriddenPreferredOverlay"))-[HKOverlayRoomViewController _selectPreferredItem](self, "_selectPreferredItem");
        return;
      }
      -[HKOverlayRoomViewController initialSelectedContextLocation](self, "initialSelectedContextLocation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v8;
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v8, "containerIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "overlayContextSections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDisplayTypeContextSections:", v12);

    goto LABEL_7;
  }
}

- (void)_selectPreferredItem
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[HKOverlayRoomViewController initialSelectedContextLocation](self, "initialSelectedContextLocation");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[HKOverlayRoomViewController initialSelectedContextLocation](self, "initialSelectedContextLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      -[HKOverlayRoomViewController initialSelectedContextLocation](self, "initialSelectedContextLocation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomViewController setCurrentSelectedContextLocation:](self, "setCurrentSelectedContextLocation:", v8);

      -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomViewController setSegmentedControlSelectedIndex:](self, "setSegmentedControlSelectedIndex:", objc_msgSend(v9, "containerIndex"));

      v10 = (void *)MEMORY[0x1E0CB36B0];
      -[HKOverlayRoomViewController initialSelectedContextLocation](self, "initialSelectedContextLocation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "itemIndex");
      -[HKOverlayRoomViewController initialSelectedContextLocation](self, "initialSelectedContextLocation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "indexPathForRow:inSection:", v12, objc_msgSend(v13, "sectionIndex"));
      v16 = (id)objc_claimAutoreleasedReturnValue();

      -[HKOverlayRoomViewController sectionedContextView](self, "sectionedContextView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "selectItemAtIndexPath:animated:scrollPosition:", v16, 0, 0);

      -[HKOverlayRoomViewController initialSelectedContextLocation](self, "initialSelectedContextLocation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomViewController _updateChartForOverlaySelection:previousSelection:](self, "_updateChartForOverlaySelection:previousSelection:", v15, 0);

    }
  }
}

- (void)_setupPrimaryDisplayType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController primaryDisplayTypeWithApplicationItems:](self, "primaryDisplayTypeWithApplicationItems:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "presentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyWithIsCriticalForAutoscale:", 1);
  v6 = (void *)objc_msgSend(v7, "copyWithPresentation:", v5);
  -[HKOverlayRoomViewController setPrimaryDisplayType:](self, "setPrimaryDisplayType:", v6);

}

- (id)createChartOverlayViewController
{
  void *v3;
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  unint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HKInteractiveChartOverlayViewController *v24;
  void *v26;
  void *v27;
  HKInteractiveChartOverlayViewController *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hk_interactiveChartOptions");

  -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "baseDisplayType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v4 = objc_msgSend(v8, "hk_interactiveChartOptions");

  }
  if (-[HKOverlayRoomViewController conformsToProtocol:](self, "conformsToProtocol:", &unk_1F01833E8)
    && (-[HKOverlayRoomViewController getChartSummaryTrendModelToModify](self, "getChartSummaryTrendModelToModify"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "selectTrendInitially"),
        v10,
        (v11 & 1) != 0)
    || self->_controllerMode == 3)
  {
    v4 |= 0x2000uLL;
  }
  v12 = -[HKOverlayRoomViewController additionalChartOptions](self, "additionalChartOptions") | v4;
  v13 = -[HKOverlayRoomViewController prefersOpaqueLegends](self, "prefersOpaqueLegends");
  v14 = v12 | 0x10000;
  if (!v13)
    v14 = v12;
  v29 = v14;
  v28 = [HKInteractiveChartOverlayViewController alloc];
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "healthStore");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "unitController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dateCache");
  v16 = objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "chartDataCacheController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeScopeController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sampleDateRangeController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController displayDate](self, "displayDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v16;
  v24 = -[HKInteractiveChartOverlayViewController initWithHealthStore:primaryDisplayType:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:](v28, "initWithHealthStore:primaryDisplayType:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:", v33, v26, v15, v16, v17, v19, v21, v22, 0, v29);

  -[HKInteractiveChartViewController setCurrentOverlayLocationProvider:](v24, "setCurrentOverlayLocationProvider:", self);
  return v24;
}

- (BOOL)prefersOpaqueLegends
{
  return 1;
}

- (id)_segmentedControlTitles
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        if (v9)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "localizedContainerTitle");
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = (void *)v10;
            objc_msgSend(v9, "localizedContainerTitle");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "length");

            if (v13)
            {
              objc_msgSend(v9, "localizedContainerTitle");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v14);

            }
          }
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_setupInterface
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HKOverlayRoomViewController _setupTopLevelChartView](self, "_setupTopLevelChartView");
  -[HKOverlayRoomViewController _setupOverlayContainers](self, "_setupOverlayContainers");
  -[HKOverlayRoomViewController _setupTopLevelOverlaysWithOptionalSegmentView](self, "_setupTopLevelOverlaysWithOptionalSegmentView");
  -[HKOverlayRoomViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  -[HKOverlayRoomViewController _configureStackViewsUsingHorizontalSizeClass:](self, "_configureStackViewsUsingHorizontalSizeClass:", v4);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartOverlayAccessibilityIdentifier:", CFSTR("Top"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", v7);

  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController controllerTitleWithApplicationItems:](self, "controllerTitleWithApplicationItems:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController setTitle:](self, "setTitle:", v9);

}

- (void)_setupTopLevelChartView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  UIView *v11;
  UIView *topLevelChartView;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *chartControllerViewToTopLevelChartViewBottomConstraint;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *topLevelChartViewTrailingConstraint;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *topLevelChartViewLeadingConstraint;
  void *v30;
  void *v31;
  NSLayoutConstraint *v32;
  NSLayoutConstraint *topLevelChartViewBottomConstraint;
  void *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *chartControllerViewHeightConstraint;
  NSLayoutConstraint *v37;
  NSLayoutConstraint *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSLayoutConstraint *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[11];

  v59[9] = *MEMORY[0x1E0C80C00];
  -[HKOverlayRoomViewController createChartOverlayViewController](self, "createChartOverlayViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController setChartController:](self, "setChartController:", v3);

  -[HKOverlayRoomViewController chartController](self, "chartController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addChartViewObserver:", self);

  -[HKOverlayRoomViewController chartController](self, "chartController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController addChildViewController:](self, "addChildViewController:", v5);

  -[HKOverlayRoomViewController chartController](self, "chartController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKOverlayRoomViewController initialVisibleDateRange](self, "initialVisibleDateRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInitialVisibleDateRange:", v8);

  v10 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v11 = (UIView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  topLevelChartView = self->_topLevelChartView;
  self->_topLevelChartView = v11;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_topLevelChartView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKOverlayRoomViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_topLevelChartView);

  -[UIView addSubview:](self->_topLevelChartView, "addSubview:", v7);
  objc_msgSend(v7, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_topLevelChartView, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  chartControllerViewToTopLevelChartViewBottomConstraint = self->_chartControllerViewToTopLevelChartViewBottomConstraint;
  self->_chartControllerViewToTopLevelChartViewBottomConstraint = v16;

  -[UIView trailingAnchor](self->_topLevelChartView, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaLayoutGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v21);
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topLevelChartViewTrailingConstraint = self->_topLevelChartViewTrailingConstraint;
  self->_topLevelChartViewTrailingConstraint = v22;

  -[UIView leadingAnchor](self->_topLevelChartView, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "safeAreaLayoutGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v27);
  v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topLevelChartViewLeadingConstraint = self->_topLevelChartViewLeadingConstraint;
  self->_topLevelChartViewLeadingConstraint = v28;

  -[UIView bottomAnchor](self->_topLevelChartView, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topLevelChartViewBottomConstraint = self->_topLevelChartViewBottomConstraint;
  self->_topLevelChartViewBottomConstraint = v32;

  objc_msgSend(v7, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintGreaterThanOrEqualToConstant:", 100.0);
  v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  chartControllerViewHeightConstraint = self->_chartControllerViewHeightConstraint;
  self->_chartControllerViewHeightConstraint = v35;

  v52 = (void *)MEMORY[0x1E0CB3718];
  v37 = self->_topLevelChartViewTrailingConstraint;
  v59[0] = self->_topLevelChartViewLeadingConstraint;
  v59[1] = v37;
  -[UIView topAnchor](self->_topLevelChartView, "topAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController view](self, "view");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "safeAreaLayoutGuide");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = self->_topLevelChartViewBottomConstraint;
  v59[2] = v54;
  v59[3] = v38;
  v39 = v7;
  objc_msgSend(v7, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_topLevelChartView, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v59[4] = v40;
  v53 = v39;
  objc_msgSend(v39, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_topLevelChartView, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v59[5] = v43;
  objc_msgSend(v39, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_topLevelChartView, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = self->_chartControllerViewToTopLevelChartViewBottomConstraint;
  v59[6] = v46;
  v59[7] = v47;
  v59[8] = self->_chartControllerViewHeightConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 9);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "activateConstraints:", v48);

  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartOverlayAccessibilityIdentifier:", CFSTR("Top.Chart"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setAccessibilityIdentifier:](self->_topLevelChartView, "setAccessibilityIdentifier:", v49);

}

- (void)_setupTopLevelOverlaysWithOptionalSegmentView
{
  UIStackView *v3;
  UIStackView *overlaysWithOptionalSegmentController;
  id v5;
  UIView *v6;
  UIView *topLevelOverlaysWithOptionalSegmentView;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *overlaysWithOptionalSegmentLeadingConstraint;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *overlaysWithOptionalSegmentTrailingConstraint;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *overlaysWithOptionalSegmentTopConstraint;
  void *v24;
  NSLayoutConstraint *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSLayoutConstraint *v41;
  NSLayoutConstraint *topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
  void *v43;
  void *v44;
  NSLayoutConstraint *v45;
  NSLayoutConstraint *topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  void *v47;
  NSLayoutConstraint *v48;
  NSLayoutConstraint *topLevelOverlaysWithOptionalSegmentViewWidthConstraint;
  void *v50;
  NSLayoutConstraint *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  _QWORD v59[5];

  v59[4] = *MEMORY[0x1E0C80C00];
  -[HKOverlayRoomViewController _createOverlaysWithOptionalSegmentedControllerStackView](self, "_createOverlaysWithOptionalSegmentedControllerStackView");
  v3 = (UIStackView *)objc_claimAutoreleasedReturnValue();
  overlaysWithOptionalSegmentController = self->_overlaysWithOptionalSegmentController;
  self->_overlaysWithOptionalSegmentController = v3;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_overlaysWithOptionalSegmentController, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v6 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  topLevelOverlaysWithOptionalSegmentView = self->_topLevelOverlaysWithOptionalSegmentView;
  self->_topLevelOverlaysWithOptionalSegmentView = v6;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_topLevelOverlaysWithOptionalSegmentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKOverlayRoomViewController _contextViewBackgroundColor](self, "_contextViewBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_topLevelOverlaysWithOptionalSegmentView, "setBackgroundColor:", v8);

  -[UIView addSubview:](self->_topLevelOverlaysWithOptionalSegmentView, "addSubview:", self->_overlaysWithOptionalSegmentController);
  -[UIStackView leadingAnchor](self->_overlaysWithOptionalSegmentController, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  overlaysWithOptionalSegmentLeadingConstraint = self->_overlaysWithOptionalSegmentLeadingConstraint;
  self->_overlaysWithOptionalSegmentLeadingConstraint = v11;

  -[UIStackView trailingAnchor](self->_overlaysWithOptionalSegmentController, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  overlaysWithOptionalSegmentTrailingConstraint = self->_overlaysWithOptionalSegmentTrailingConstraint;
  self->_overlaysWithOptionalSegmentTrailingConstraint = v15;

  -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v18 = 15.0;
  else
    v18 = 0.0;

  -[UIStackView topAnchor](self->_overlaysWithOptionalSegmentController, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView safeAreaLayoutGuide](self->_topLevelOverlaysWithOptionalSegmentView, "safeAreaLayoutGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, v18);
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  overlaysWithOptionalSegmentTopConstraint = self->_overlaysWithOptionalSegmentTopConstraint;
  self->_overlaysWithOptionalSegmentTopConstraint = v22;

  v24 = (void *)MEMORY[0x1E0CB3718];
  v25 = self->_overlaysWithOptionalSegmentTrailingConstraint;
  v59[0] = self->_overlaysWithOptionalSegmentLeadingConstraint;
  v59[1] = v25;
  v59[2] = self->_overlaysWithOptionalSegmentTopConstraint;
  -[UIStackView bottomAnchor](self->_overlaysWithOptionalSegmentController, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activateConstraints:", v29);

  -[HKOverlayRoomViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", self->_topLevelOverlaysWithOptionalSegmentView);

  -[UIView leadingAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "safeAreaLayoutGuide");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v34);
  v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topLevelOverlaysWithOptionalSegmentViewLeadingConstraint = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint = v35;

  -[UIView trailingAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "safeAreaLayoutGuide");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v40);
  v41 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topLevelOverlaysWithOptionalSegmentViewTrailingConstraint = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
  self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint = v41;

  -[UIView topAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_topLevelChartView, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topLevelOverlaysWithOptionalSegmentViewTopConstraint = self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint = v45;

  -[UIView widthAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "widthAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToConstant:", 336.0);
  v48 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topLevelOverlaysWithOptionalSegmentViewWidthConstraint = self->_topLevelOverlaysWithOptionalSegmentViewWidthConstraint;
  self->_topLevelOverlaysWithOptionalSegmentViewWidthConstraint = v48;

  v50 = (void *)MEMORY[0x1E0CB3718];
  v51 = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
  v58[0] = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  v58[1] = v51;
  v58[2] = self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  -[UIView bottomAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController view](self, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "activateConstraints:", v56);

  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartOverlayAccessibilityIdentifier:", CFSTR("Top.OverlaysWithOptionalSegment"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setAccessibilityIdentifier:](self->_topLevelOverlaysWithOptionalSegmentView, "setAccessibilityIdentifier:", v57);

}

- (id)_createOverlaysWithOptionalSegmentedControllerStackView
{
  id v3;
  void *v4;
  UIStackView *v5;
  UIStackView *chartOverlayStackView;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKOverlayRoomViewController _setupSegmentedControl](self, "_setupSegmentedControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[HKOverlayRoomViewController _createOverlayStackView](self, "_createOverlayStackView");
  v5 = (UIStackView *)objc_claimAutoreleasedReturnValue();
  chartOverlayStackView = self->_chartOverlayStackView;
  self->_chartOverlayStackView = v5;

  objc_msgSend(v3, "addObject:", self->_chartOverlayStackView);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v3);
  objc_msgSend(v7, "setAxis:", 1);

  return v7;
}

- (id)_createOverlayStackView
{
  id v3;
  _BOOL4 v4;
  HKDisplayTypeSectionedContextView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HKMaximumSizeView *v11;
  void *v12;
  HKMaximumSizeView *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[HKOverlayRoomViewController supportsShowAllFilters](self, "supportsShowAllFilters");
  if (-[HKOverlayRoomViewController _contextItemCount](self, "_contextItemCount") >= 1)
  {
    v5 = -[HKDisplayTypeSectionedContextView initWithStyle:]([HKDisplayTypeSectionedContextView alloc], "initWithStyle:", -[HKOverlayRoomViewController controllerMode](self, "controllerMode"));
    -[HKOverlayRoomViewController setSectionedContextView:](self, "setSectionedContextView:", v5);

    -[HKOverlayRoomViewController _contextViewBackgroundColor](self, "_contextViewBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController sectionedContextView](self, "sectionedContextView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    -[HKOverlayRoomViewController sectionedContextView](self, "sectionedContextView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

    -[HKOverlayRoomViewController sectionedContextView](self, "sectionedContextView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController _layoutNoVerticalExpansion:](self, "_layoutNoVerticalExpansion:", v9);

    if (-[HKOverlayRoomViewController controllerMode](self, "controllerMode") != 1 || v4)
    {
      -[HKOverlayRoomViewController sectionedContextView](self, "sectionedContextView");
    }
    else
    {
      v11 = [HKMaximumSizeView alloc];
      -[HKOverlayRoomViewController sectionedContextView](self, "sectionedContextView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HKMaximumSizeView initWithView:maximumSize:](v11, "initWithView:maximumSize:", v12, *MEMORY[0x1E0DC55F0], *MEMORY[0x1E0DC55F0]);
      -[HKOverlayRoomViewController setSingleContextMaximumSizeView:](self, "setSingleContextMaximumSizeView:", v13);

      -[HKOverlayRoomViewController singleContextMaximumSizeView](self, "singleContextMaximumSizeView");
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

    if (-[HKOverlayRoomViewController controllerMode](self, "controllerMode") == 3)
    {
      -[HKOverlayRoomViewController sectionedContextView](self, "sectionedContextView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setUseHorizontalInsets:", 1);

      objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isiPad");

      if (v17)
      {
        -[HKOverlayRoomViewController sectionedContextView](self, "sectionedContextView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setUseTopInsetsWithNoHeader:", 0);

      }
    }
  }
  if (v4)
  {
    -[HKOverlayRoomViewController showAllFiltersButtonTitle](self, "showAllFiltersButtonTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3518], "hk_chartShowMoreDataButtonWithTitleOverride:target:action:", v19, self, sel__showAllFilters_);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController _layoutNoVerticalExpansion:](self, "_layoutNoVerticalExpansion:", v20);
    objc_msgSend(v3, "addObject:", v20);

  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v3);
  objc_msgSend(v21, "setLayoutMarginsRelativeArrangement:", 1);
  -[HKOverlayRoomViewController _contextViewBackgroundColor](self, "_contextViewBackgroundColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBackgroundColor:", v22);

  return v21;
}

- (unint64_t)_fullViewRatioModeToAxis:(int64_t)a3
{
  return a3 != 1;
}

- (unint64_t)_fullModeTransitionToSizeClass:(int64_t)a3
{
  if ((unint64_t)a3 < 2)
    return 2 * (-[HKOverlayRoomViewController previousHorizontalSizeClass](self, "previousHorizontalSizeClass") != 1);
  if (a3 == 2)
    return -[HKOverlayRoomViewController previousHorizontalSizeClass](self, "previousHorizontalSizeClass") != 2;
  return 0;
}

- (unint64_t)_singleModeTransitionToSizeClass:(int64_t)a3
{
  if (-[HKOverlayRoomViewController previousHorizontalSizeClass](self, "previousHorizontalSizeClass")
    && -[HKOverlayRoomViewController previousHorizontalSizeClass](self, "previousHorizontalSizeClass") == a3)
  {
    return 0;
  }
  if (a3 == 2)
    return 1;
  return 2;
}

- (int64_t)_widthDesignationFromTraitCollection:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "valueForNSIntegerTrait:", objc_opt_class());

  return v4;
}

- (BOOL)_shouldStackSingleModeWithShowAllFiltersOverlayAreaVertically
{
  void *v3;
  int64_t v4;

  -[HKOverlayRoomViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKOverlayRoomViewController _widthDesignationFromTraitCollection:](self, "_widthDesignationFromTraitCollection:", v3);

  return (unint64_t)(v4 - 7) < 0xFFFFFFFFFFFFFFFDLL;
}

- (void)_configureStackViewsUsingHorizontalSizeClass:(int64_t)a3
{
  unint64_t v5;
  _BOOL4 v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;

  switch(-[HKOverlayRoomViewController controllerMode](self, "controllerMode"))
  {
    case 0:
    case 2:
      v5 = -[HKOverlayRoomViewController _singleModeTransitionToSizeClass:](self, "_singleModeTransitionToSizeClass:", a3);
      if (v5 == 2)
        goto LABEL_16;
      if (v5 == 1)
      {
        -[HKOverlayRoomViewController _configureMainAreaVertically](self, "_configureMainAreaVertically");
        goto LABEL_5;
      }
      goto LABEL_30;
    case 1:
      v6 = -[HKOverlayRoomViewController supportsShowAllFilters](self, "supportsShowAllFilters");
      v7 = -[HKOverlayRoomViewController _singleModeTransitionToSizeClass:](self, "_singleModeTransitionToSizeClass:", a3);
      if (v7 == 2)
      {
LABEL_16:
        -[HKOverlayRoomViewController _configureMainAreaVertically](self, "_configureMainAreaVertically");
LABEL_17:
        -[HKOverlayRoomViewController _configureOverlayAreaVertically](self, "_configureOverlayAreaVertically");
        goto LABEL_30;
      }
      if (v7 == 1)
      {
        -[HKOverlayRoomViewController _configureMainAreaVertically](self, "_configureMainAreaVertically");
        if (!v6)
          goto LABEL_5;
      }
      else if (v7 || !v6)
      {
        goto LABEL_30;
      }
      if (-[HKOverlayRoomViewController _shouldStackSingleModeWithShowAllFiltersOverlayAreaVertically](self, "_shouldStackSingleModeWithShowAllFiltersOverlayAreaVertically"))
      {
        goto LABEL_17;
      }
LABEL_5:
      -[HKOverlayRoomViewController _configureOverlayAreaHorizontally](self, "_configureOverlayAreaHorizontally");
      goto LABEL_30;
    case 3:
      v8 = -[HKOverlayRoomViewController _fullModeTransitionToSizeClass:](self, "_fullModeTransitionToSizeClass:", a3);
      if (v8 >= 2)
      {
        if (v8 != 2)
          goto LABEL_26;
        -[HKOverlayRoomViewController _configureMainAreaVertically](self, "_configureMainAreaVertically");
        goto LABEL_25;
      }
      if (a3 == 2)
      {
        v9 = -[HKOverlayRoomViewController _isInPortraitLayout](self, "_isInPortraitLayout");
        if (-[HKOverlayRoomViewController topLevelAxis](self, "topLevelAxis") != v9)
        {
          if (v9)
            -[HKOverlayRoomViewController _configureMainAreaVertically](self, "_configureMainAreaVertically");
          else
            -[HKOverlayRoomViewController _configureMainAreaHorizontally](self, "_configureMainAreaHorizontally");
        }
        -[HKOverlayRoomViewController chartOverlayStackView](self, "chartOverlayStackView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "axis");

        if (v11 != 1)
LABEL_25:
          -[HKOverlayRoomViewController _configureOverlayAreaVertically](self, "_configureOverlayAreaVertically");
      }
LABEL_26:
      v12 = -[HKOverlayRoomViewController _fullViewRatioModeToAxis:](self, "_fullViewRatioModeToAxis:", -[HKOverlayRoomViewController topLevelAxis](self, "topLevelAxis"));
      if (v12 == 1)
      {
        -[HKOverlayRoomViewController _configureChartHeightUsingDefault](self, "_configureChartHeightUsingDefault");
      }
      else if (!v12)
      {
        -[HKOverlayRoomViewController _configureChartHeightUsingViewRatio](self, "_configureChartHeightUsingViewRatio");
      }
LABEL_30:
      -[HKOverlayRoomViewController setPreviousHorizontalSizeClass:](self, "setPreviousHorizontalSizeClass:", a3);
      return;
    default:
      goto LABEL_30;
  }
}

- (BOOL)_isInPortraitLayout
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  HKOverlayRoomViewController *v12;
  void *v13;
  HKOverlayRoomViewController *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double Width;
  BOOL v28;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  -[HKOverlayRoomViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = self;
  -[HKOverlayRoomViewController parentViewController](v12, "parentViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    do
    {
      -[HKOverlayRoomViewController parentViewController](v12, "parentViewController");
      v14 = (HKOverlayRoomViewController *)objc_claimAutoreleasedReturnValue();

      -[HKOverlayRoomViewController parentViewController](v14, "parentViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v14;
    }
    while (v15);
  }
  else
  {
    v14 = v12;
  }
  -[HKOverlayRoomViewController presentationController](v14, "presentationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HKOverlayRoomViewController presentationController](v14, "presentationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frameOfPresentedViewInContainerView");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    v30.origin.x = v20;
    v30.origin.y = v22;
    v30.size.width = v24;
    v30.size.height = v26;
    if (!CGRectIsNull(v30))
    {
      v5 = v20;
      v7 = v22;
      v9 = v24;
      v11 = v26;
    }
  }
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  Width = CGRectGetWidth(v31);
  v32.origin.x = v5;
  v32.origin.y = v7;
  v32.size.width = v9;
  v32.size.height = v11;
  v28 = Width < CGRectGetHeight(v32);

  return v28;
}

- (id)_findMinimumSizeView
{
  void *v2;
  void *v3;
  id v4;

  -[HKOverlayRoomViewController chartController](self, "chartController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)_configureChartHeightUsingViewRatio
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *chartControllerViewHeightConstraint;
  id v25;

  -[HKOverlayRoomViewController _findMinimumSizeView](self, "_findMinimumSizeView");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[HKOverlayRoomViewController _edgeInsetsForWidthDesignation](self, "_edgeInsetsForWidthDesignation");
    v4 = v3;
    v6 = v5;
    -[HKOverlayRoomViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8 - v6 - v4;

    -[HKOverlayRoomViewController chartController](self, "chartController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minimumHeightForWidth:chartWidthToHeightRatio:", v9, 1.5);
    v12 = v11;

    v13 = 100.0;
    if (v12 >= 100.0)
      v13 = v12;
    objc_msgSend(v25, "setMinimumHeight:", v13);
    -[NSLayoutConstraint setActive:](self->_chartControllerViewHeightConstraint, "setActive:", 0);
    -[HKOverlayRoomViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safeAreaLayoutGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutFrame");
    v17 = v16 * 0.5;

    -[HKInteractiveChartViewController heightForChartHeight:](self->_chartController, "heightForChartHeight:", v17);
    v19 = v18;
    -[HKOverlayRoomViewController chartController](self, "chartController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintLessThanOrEqualToConstant:", v19);
    v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    chartControllerViewHeightConstraint = self->_chartControllerViewHeightConstraint;
    self->_chartControllerViewHeightConstraint = v23;

    -[NSLayoutConstraint setActive:](self->_chartControllerViewHeightConstraint, "setActive:", 1);
  }

}

- (void)_configureChartHeightUsingDefault
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *chartControllerViewHeightConstraint;
  id v11;

  -[HKOverlayRoomViewController _findMinimumSizeView](self, "_findMinimumSizeView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[HKOverlayRoomViewController chartController](self, "chartController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "minimumHeightForChart");
    v5 = v4;

    if (v5 < 100.0)
      v5 = 100.0;
    objc_msgSend(v11, "setMinimumHeight:", v5);
    -[NSLayoutConstraint setActive:](self->_chartControllerViewHeightConstraint, "setActive:", 0);
    -[HKOverlayRoomViewController chartController](self, "chartController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "heightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintGreaterThanOrEqualToConstant:", v5);
    v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    chartControllerViewHeightConstraint = self->_chartControllerViewHeightConstraint;
    self->_chartControllerViewHeightConstraint = v9;

    -[NSLayoutConstraint setActive:](self->_chartControllerViewHeightConstraint, "setActive:", 1);
  }

}

- (void)_configureMainAreaVertically
{
  void *v3;
  NSLayoutConstraint *topLevelChartViewTrailingConstraint;
  void *v5;
  NSLayoutConstraint *topLevelChartViewBottomConstraint;
  NSLayoutConstraint *topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  NSLayoutConstraint *topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *topLevelChartViewLeadingConstraint;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *v21;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
  void *v38;
  void *v39;
  NSLayoutConstraint *v40;
  NSLayoutConstraint *v41;
  void *v42;
  NSLayoutConstraint *v43;
  NSLayoutConstraint *v44;
  NSLayoutConstraint *v45;
  NSLayoutConstraint *v46;
  NSLayoutConstraint *v47;
  void *v48;
  void *v49;
  _QWORD v50[6];
  _QWORD v51[9];

  v51[7] = *MEMORY[0x1E0C80C00];
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  topLevelChartViewTrailingConstraint = self->_topLevelChartViewTrailingConstraint;
  v5 = (void *)MEMORY[0x1E0CB3718];
  topLevelChartViewBottomConstraint = self->_topLevelChartViewBottomConstraint;
  v51[0] = self->_topLevelChartViewLeadingConstraint;
  v51[1] = topLevelChartViewTrailingConstraint;
  topLevelOverlaysWithOptionalSegmentViewLeadingConstraint = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  v51[2] = topLevelChartViewBottomConstraint;
  v51[3] = topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  topLevelOverlaysWithOptionalSegmentViewTopConstraint = self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  v51[4] = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
  v51[5] = topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  v51[6] = self->_topLevelOverlaysWithOptionalSegmentViewWidthConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateConstraints:", v9);

  -[UIView leadingAnchor](self->_topLevelChartView, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeAreaLayoutGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v13);
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topLevelChartViewLeadingConstraint = self->_topLevelChartViewLeadingConstraint;
  self->_topLevelChartViewLeadingConstraint = v14;

  -[UIView trailingAnchor](self->_topLevelChartView, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "safeAreaLayoutGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v19);
  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  v21 = self->_topLevelChartViewTrailingConstraint;
  self->_topLevelChartViewTrailingConstraint = v20;

  -[UIView bottomAnchor](self->_topLevelChartView, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  v25 = self->_topLevelChartViewBottomConstraint;
  self->_topLevelChartViewBottomConstraint = v24;

  -[UIView leadingAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "safeAreaLayoutGuide");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v29);
  v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  v31 = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint = v30;

  -[UIView trailingAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "safeAreaLayoutGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v35);
  v36 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topLevelOverlaysWithOptionalSegmentViewTrailingConstraint = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
  self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint = v36;

  -[UIView topAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_topLevelChartView, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v39);
  v40 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  v41 = self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint = v40;

  v42 = (void *)MEMORY[0x1E0CB3718];
  v43 = self->_topLevelChartViewTrailingConstraint;
  v44 = self->_topLevelChartViewBottomConstraint;
  v50[0] = self->_topLevelChartViewLeadingConstraint;
  v50[1] = v43;
  v45 = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  v46 = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
  v50[2] = v44;
  v50[3] = v45;
  v47 = self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  v50[4] = v46;
  v50[5] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 6);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "activateConstraints:", v48);

  -[HKOverlayRoomViewController setTopLevelAxis:](self, "setTopLevelAxis:", 1);
}

- (void)_configureMainAreaHorizontally
{
  void *v3;
  NSLayoutConstraint *topLevelChartViewTrailingConstraint;
  NSLayoutConstraint *topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  NSLayoutConstraint *topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *topLevelChartViewLeadingConstraint;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSLayoutConstraint *v42;
  NSLayoutConstraint *v43;
  NSLayoutConstraint *v44;
  void *v45;
  void *v46;
  void *v47;
  NSLayoutConstraint *v48;
  NSLayoutConstraint *topLevelChartViewBottomConstraint;
  void *v50;
  void *v51;
  void *v52;
  NSLayoutConstraint *v53;
  NSLayoutConstraint *v54;
  void *v55;
  NSLayoutConstraint *v56;
  NSLayoutConstraint *v57;
  NSLayoutConstraint *v58;
  void *v59;
  _QWORD v60[7];
  _QWORD v61[7];

  v61[6] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3718];
  topLevelChartViewTrailingConstraint = self->_topLevelChartViewTrailingConstraint;
  v61[0] = self->_topLevelChartViewLeadingConstraint;
  v61[1] = topLevelChartViewTrailingConstraint;
  topLevelOverlaysWithOptionalSegmentViewLeadingConstraint = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  v61[2] = self->_topLevelChartViewBottomConstraint;
  v61[3] = topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  topLevelOverlaysWithOptionalSegmentViewTopConstraint = self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  v61[4] = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
  v61[5] = topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v7);

  -[HKOverlayRoomViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "hk_isLeftToRight");

  -[UIView leadingAnchor](self->_topLevelChartView, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v7)
  {
    -[HKOverlayRoomViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeAreaLayoutGuide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v12);
    v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    topLevelChartViewLeadingConstraint = self->_topLevelChartViewLeadingConstraint;
    self->_topLevelChartViewLeadingConstraint = v13;

    -[UIView trailingAnchor](self->_topLevelChartView, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v18 = self->_topLevelChartViewTrailingConstraint;
    self->_topLevelChartViewTrailingConstraint = v17;

    -[UIView leadingAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_topLevelChartView, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v22 = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
    self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint = v21;

    -[UIView trailingAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "safeAreaLayoutGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v26);
    v27 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    topLevelOverlaysWithOptionalSegmentViewTrailingConstraint = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
    self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint = v27;

  }
  else
  {
    -[UIView trailingAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v29);
    v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v31 = self->_topLevelChartViewLeadingConstraint;
    self->_topLevelChartViewLeadingConstraint = v30;

    -[UIView trailingAnchor](self->_topLevelChartView, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "safeAreaLayoutGuide");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v35);
    v36 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v37 = self->_topLevelChartViewTrailingConstraint;
    self->_topLevelChartViewTrailingConstraint = v36;

    -[UIView leadingAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController view](self, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "safeAreaLayoutGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v41);
    v42 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v43 = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
    self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint = v42;

    -[UIView trailingAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_topLevelChartView, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v44 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v25 = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
    self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint = v44;
  }

  -[UIView bottomAnchor](self->_topLevelChartView, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v47);
  v48 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topLevelChartViewBottomConstraint = self->_topLevelChartViewBottomConstraint;
  self->_topLevelChartViewBottomConstraint = v48;

  -[UIView topAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v52);
  v53 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  v54 = self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint = v53;

  v55 = (void *)MEMORY[0x1E0CB3718];
  v56 = self->_topLevelChartViewTrailingConstraint;
  v60[0] = self->_topLevelChartViewLeadingConstraint;
  v60[1] = v56;
  v57 = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  v60[2] = self->_topLevelChartViewBottomConstraint;
  v60[3] = v57;
  v58 = self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  v60[4] = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
  v60[5] = v58;
  v60[6] = self->_topLevelOverlaysWithOptionalSegmentViewWidthConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 7);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "activateConstraints:", v59);

  -[HKOverlayRoomViewController setTopLevelAxis:](self, "setTopLevelAxis:", 0);
}

- (void)_configureOverlayAreaVertically
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v3 = -[HKOverlayRoomViewController supportsShowAllFilters](self, "supportsShowAllFilters");
  -[HKOverlayRoomViewController chartOverlayStackView](self, "chartOverlayStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAxis:", 1);

  -[HKOverlayRoomViewController chartOverlayStackView](self, "chartOverlayStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDistribution:", 0);

  -[HKOverlayRoomViewController chartOverlayStackView](self, "chartOverlayStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlignment:", 0);

  -[HKOverlayRoomViewController sectionedContextView](self, "sectionedContextView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseBottomInsets:", !v3);

  -[HKOverlayRoomViewController singleContextMaximumSizeView](self, "singleContextMaximumSizeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *MEMORY[0x1E0DC55F0];
    -[HKOverlayRoomViewController singleContextMaximumSizeView](self, "singleContextMaximumSizeView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMaximumSize:", v9, v9);

  }
}

- (void)_configureOverlayAreaHorizontally
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  -[HKOverlayRoomViewController chartOverlayStackView](self, "chartOverlayStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAxis:", 0);

  -[HKOverlayRoomViewController chartOverlayStackView](self, "chartOverlayStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDistribution:", 1);

  -[HKOverlayRoomViewController chartOverlayStackView](self, "chartOverlayStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlignment:", 3);

  -[HKOverlayRoomViewController sectionedContextView](self, "sectionedContextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUseBottomInsets:", 1);

  -[HKOverlayRoomViewController singleContextMaximumSizeView](self, "singleContextMaximumSizeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *MEMORY[0x1E0DC55F0];
    -[HKOverlayRoomViewController singleContextMaximumSizeView](self, "singleContextMaximumSizeView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMaximumSize:", 375.0, v8);

  }
}

- (NSDirectionalEdgeInsets)_edgeInsetsForWidthDesignation
{
  void *v3;
  int64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSDirectionalEdgeInsets result;

  -[HKOverlayRoomViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKOverlayRoomViewController _widthDesignationFromTraitCollection:](self, "_widthDesignationFromTraitCollection:", v3);

  +[HKCollectionViewLayoutEngineDefaults edgeInsetsForWidthDesignation:](HKCollectionViewLayoutEngineDefaults, "edgeInsetsForWidthDesignation:", v4);
  result.trailing = v8;
  result.bottom = v7;
  result.leading = v6;
  result.top = v5;
  return result;
}

- (void)_configureChartAreaMargins
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *chartControllerViewToTopLevelChartViewBottomConstraint;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isiPad");

  if (v4)
  {
    -[HKOverlayRoomViewController chartController](self, "chartController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (self->_controllerMode == 3)
      v6 = -14.0;
    else
      v6 = 0.0;
    -[NSLayoutConstraint setActive:](self->_chartControllerViewToTopLevelChartViewBottomConstraint, "setActive:", 0);
    objc_msgSend(v11, "heightAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](self->_topLevelChartView, "heightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, v6);
    v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    chartControllerViewToTopLevelChartViewBottomConstraint = self->_chartControllerViewToTopLevelChartViewBottomConstraint;
    self->_chartControllerViewToTopLevelChartViewBottomConstraint = v9;

    -[NSLayoutConstraint setActive:](self->_chartControllerViewToTopLevelChartViewBottomConstraint, "setActive:", 1);
  }
}

- (void)_configureOverlayAreaMargins
{
  unint64_t controllerMode;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  controllerMode = self->_controllerMode;
  if (controllerMode >= 3)
  {
    if (controllerMode == 3)
    {
      -[HKOverlayRoomViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "safeAreaInsets");
      v14 = v13;

      -[HKOverlayRoomViewController chartOverlayStackView](self, "chartOverlayStackView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDirectionalLayoutMargins:", 0.0, 0.0, -v14, 0.0);

      -[HKOverlayRoomViewController _configureOverlaysWithOptionalSegmentHorizontalMarginsForModeFull](self, "_configureOverlaysWithOptionalSegmentHorizontalMarginsForModeFull");
      -[HKOverlayRoomViewController _configureOverlaysWithOptionalSegmentTopMarginForModeFull](self, "_configureOverlaysWithOptionalSegmentTopMarginForModeFull");
    }
  }
  else
  {
    -[HKOverlayRoomViewController _edgeInsetsForWidthDesignation](self, "_edgeInsetsForWidthDesignation");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[HKOverlayRoomViewController chartOverlayStackView](self, "chartOverlayStackView");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDirectionalLayoutMargins:", v5, v7, v9, v11);

  }
}

- (void)_configureOverlaysWithOptionalSegmentHorizontalMarginsForModeFull
{
  void *v3;
  int v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *overlaysWithOptionalSegmentLeadingConstraint;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *overlaysWithOptionalSegmentTrailingConstraint;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *v21;

  if (self->_controllerMode == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isiPad");

    if (v4)
    {
      -[NSLayoutConstraint setActive:](self->_overlaysWithOptionalSegmentLeadingConstraint, "setActive:", 0);
      -[NSLayoutConstraint setActive:](self->_overlaysWithOptionalSegmentTrailingConstraint, "setActive:", 0);
      v5 = -[HKOverlayRoomViewController topLevelAxis](self, "topLevelAxis");
      -[UIStackView leadingAnchor](self->_overlaysWithOptionalSegmentController, "leadingAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == 1)
      {
        -[HKOverlayRoomViewController view](self, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "readableContentGuide");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "leadingAnchor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "constraintEqualToAnchor:constant:", v9, -15.0);
        v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        overlaysWithOptionalSegmentLeadingConstraint = self->_overlaysWithOptionalSegmentLeadingConstraint;
        self->_overlaysWithOptionalSegmentLeadingConstraint = v10;

        -[UIStackView trailingAnchor](self->_overlaysWithOptionalSegmentController, "trailingAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOverlayRoomViewController view](self, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "readableContentGuide");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "trailingAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "constraintEqualToAnchor:constant:", v15, 15.0);
        v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        overlaysWithOptionalSegmentTrailingConstraint = self->_overlaysWithOptionalSegmentTrailingConstraint;
        self->_overlaysWithOptionalSegmentTrailingConstraint = v16;

      }
      else
      {
        -[UIView leadingAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "leadingAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "constraintEqualToAnchor:", v18);
        v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        v20 = self->_overlaysWithOptionalSegmentLeadingConstraint;
        self->_overlaysWithOptionalSegmentLeadingConstraint = v19;

        -[UIStackView trailingAnchor](self->_overlaysWithOptionalSegmentController, "trailingAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView trailingAnchor](self->_topLevelOverlaysWithOptionalSegmentView, "trailingAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "constraintEqualToAnchor:", v13);
        v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        v14 = self->_overlaysWithOptionalSegmentTrailingConstraint;
        self->_overlaysWithOptionalSegmentTrailingConstraint = v21;
      }

      -[NSLayoutConstraint setActive:](self->_overlaysWithOptionalSegmentLeadingConstraint, "setActive:", 1);
      -[NSLayoutConstraint setActive:](self->_overlaysWithOptionalSegmentTrailingConstraint, "setActive:", 1);
    }
  }
}

- (void)_configureOverlaysWithOptionalSegmentTopMarginForModeFull
{
  void *v3;
  int v4;
  double v5;
  double v6;
  int64_t v7;
  int64_t v8;
  double v9;
  double v10;

  if (self->_controllerMode == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isiPad");

    if (v4)
    {
      -[NSLayoutConstraint setActive:](self->_overlaysWithOptionalSegmentTopConstraint, "setActive:", 0);
      if (self->_segmentedControl)
      {
        -[HKDisplayTypeSectionedContextView contentViewTopInset](self->_sectionedContextView, "contentViewTopInset");
        v5 = 16.0;
        if (v6 != 16.0)
          -[HKDisplayTypeSectionedContextView setContentViewTopInset:](self->_sectionedContextView, "setContentViewTopInset:", 16.0);
        v7 = -[HKOverlayRoomViewController topLevelAxis](self, "topLevelAxis");
        if (v7 == 1)
          goto LABEL_16;
        if (!v7)
        {
          v5 = 10.5;
LABEL_16:
          -[NSLayoutConstraint setConstant:](self->_overlaysWithOptionalSegmentTopConstraint, "setConstant:", v5);
        }
      }
      else
      {
        v8 = -[HKOverlayRoomViewController topLevelAxis](self, "topLevelAxis");
        if (!v8)
        {
          -[HKDisplayTypeSectionedContextView contentViewTopInset](self->_sectionedContextView, "contentViewTopInset");
          v5 = 10.5;
          if (v10 != 0.0)
            -[HKDisplayTypeSectionedContextView setContentViewTopInset:](self->_sectionedContextView, "setContentViewTopInset:", 0.0);
          goto LABEL_16;
        }
        if (v8 == 1)
        {
          -[HKDisplayTypeSectionedContextView contentViewTopInset](self->_sectionedContextView, "contentViewTopInset");
          v5 = 0.0;
          if (v9 != 26.0)
          {
            -[HKDisplayTypeSectionedContextView setContentViewTopInset:](self->_sectionedContextView, "setContentViewTopInset:", 26.0);
            -[HKDisplayTypeSectionedContextView scrollToTop](self->_sectionedContextView, "scrollToTop");
          }
          goto LABEL_16;
        }
      }
      -[NSLayoutConstraint setActive:](self->_overlaysWithOptionalSegmentTopConstraint, "setActive:", 1);
    }
  }
}

- (void)_horizontalSizeClassChanged:(id)a3
{
  id v3;

  -[HKOverlayRoomViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKOverlayRoomViewController;
  -[HKOverlayRoomViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[HKOverlayRoomViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController _configureStackViewsUsingHorizontalSizeClass:](self, "_configureStackViewsUsingHorizontalSizeClass:", objc_msgSend(v3, "horizontalSizeClass"));

  -[HKOverlayRoomViewController _configureChartAreaMargins](self, "_configureChartAreaMargins");
  -[HKOverlayRoomViewController _configureOverlayAreaMargins](self, "_configureOverlayAreaMargins");
}

- (id)_contextViewBackgroundColor
{
  void *v2;

  v2 = -[HKOverlayRoomViewController controllerMode](self, "controllerMode");
  if ((unint64_t)v2 >= 3)
  {
    if (v2 == (void *)3)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartOverlayBackgroundColor");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_setupSegmentedControl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *segmentedControlContainer;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  UIView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIView *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[7];

  v41[5] = *MEMORY[0x1E0C80C00];
  -[HKOverlayRoomViewController _segmentedControlTitles](self, "_segmentedControlTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", v3);
    -[HKOverlayRoomViewController setSegmentedControl:](self, "setSegmentedControl:", v4);

    objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartOverlayAccessibilityIdentifier:", CFSTR("SegmentedControl"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
    v40 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityIdentifier:", v5);

    -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_segmentedControlValueChanged_, 4096);

    -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSelectedSegmentIndex:", 0);

    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    segmentedControlContainer = self->_segmentedControlContainer;
    self->_segmentedControlContainer = v9;

    -[HKOverlayRoomViewController _contextViewBackgroundColor](self, "_contextViewBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_segmentedControlContainer, "setBackgroundColor:", v11);

    -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 1148846080;
    objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 1, v13);

    -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v15 = self->_segmentedControlContainer;
    -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v15, "addSubview:", v16);

    v31 = (void *)MEMORY[0x1E0CB3718];
    -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_segmentedControlContainer, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 15.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v36;
    -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_segmentedControlContainer, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, -15.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v32;
    -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_segmentedControlContainer, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v27;
    -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintGreaterThanOrEqualToConstant:", 28.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = v19;
    -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_segmentedControlContainer, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -10.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v41[4] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v24);

    v3 = v40;
    v25 = self->_segmentedControlContainer;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)_layoutSegmentedControl
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t i;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[HKOverlayRoomViewController segmentedControlContainer](self, "segmentedControlContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HKOverlayRoomViewController segmentedControlContainer](self, "segmentedControlContainer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      v8 = v7;

      if (v8 > 0.0)
      {
        -[HKOverlayRoomViewController _segmentedControlTitles](self, "_segmentedControlTitles");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *MEMORY[0x1E0DC1138];
        v50 = *MEMORY[0x1E0DC1138];
        v11 = *MEMORY[0x1E0DC1420];
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 14.0, *MEMORY[0x1E0DC1420]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[HKOverlayRoomViewController segmentedControlContainer](self, "segmentedControlContainer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bounds");
        v16 = v15 + -30.0;

        v17 = objc_msgSend(v9, "count");
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v18 = v9;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v19)
        {
          v20 = v19;
          v21 = v16 / (double)v17 + -10.0;
          v22 = *(_QWORD *)v42;
          v23 = 0.0;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v42 != v22)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "sizeWithAttributes:", v13, (_QWORD)v41);
              v26 = v25;
              if (v25 >= v21)
              {
                -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setApportionsSegmentWidthsByContent:", 1);

              }
              v23 = v23 + v26;
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          }
          while (v20);
        }
        else
        {
          v23 = 0.0;
        }

        -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "layoutMargins");
        v30 = v29;
        -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "layoutMargins");
        v33 = v30 + v32 + (double)(unint64_t)(objc_msgSend(v18, "count") - 1) * 11.0;

        if (v23 < v16 - v33)
          v34 = 14.0;
        else
          v34 = 11.0;
        v47 = v10;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v34, *MEMORY[0x1E0DC1440], (_QWORD)v41);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = v10;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v34, v11);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setTitleTextAttributes:forState:", v36, 0);

        -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setTitleTextAttributes:forState:", v38, 4);

      }
    }
  }
}

- (void)_setupOverlayContainers
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[HKOverlayRoomViewController controllerMode](self, "controllerMode");
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController contextSectionContainersForMode:applicationItems:overlayChartController:](self, "contextSectionContainersForMode:applicationItems:overlayChartController:", v3, v4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomViewController _addHealthFactorsIfNecessary:](self, "_addHealthFactorsIfNecessary:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController setOverlayContextSectionContainers:](self, "setOverlayContextSectionContainers:", v6);

}

- (void)_setupOverlayContextItems
{
  void *v3;
  int64_t v4;
  void *v5;

  -[HKOverlayRoomViewController _callPrepareOnOverlayContexts](self, "_callPrepareOnOverlayContexts");
  if (self->_shouldSelectInitialOverlay)
  {
    -[HKOverlayRoomViewController initialSelectedContextForMode:containerIndex:](self, "initialSelectedContextForMode:containerIndex:", -[HKOverlayRoomViewController controllerMode](self, "controllerMode"), -[HKOverlayRoomViewController initialSelectedContainerIndexForMode:](self, "initialSelectedContainerIndexForMode:", -[HKOverlayRoomViewController controllerMode](self, "controllerMode")));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController setInitialSelectedContextLocation:](self, "setInitialSelectedContextLocation:", v3);

    v4 = -[HKOverlayRoomViewController controllerMode](self, "controllerMode");
    -[HKOverlayRoomViewController initialSelectedContextLocation](self, "initialSelectedContextLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = -[HKOverlayRoomViewController _shouldInstallDefaultOverlayDeselectionTimerForMode:initialSelectedLocation:](self, "_shouldInstallDefaultOverlayDeselectionTimerForMode:initialSelectedLocation:", v4, v5);

    if ((_DWORD)v4)
      -[HKOverlayRoomViewController _installDefaultOverlayDeselectionTimer](self, "_installDefaultOverlayDeselectionTimer");
  }
  -[HKOverlayRoomViewController _updateContextTiles](self, "_updateContextTiles");
  -[HKOverlayRoomViewController _refreshContextItemsAndUpdateChart:](self, "_refreshContextItemsAndUpdateChart:", 1);
}

- (void)_callPrepareOnOverlayContexts
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60__HKOverlayRoomViewController__callPrepareOnOverlayContexts__block_invoke;
  v2[3] = &unk_1E9C40018;
  v2[4] = self;
  -[HKOverlayRoomViewController _enumerateContextItemsWithBlock:](self, "_enumerateContextItemsWithBlock:", v2);
}

void __60__HKOverlayRoomViewController__callPrepareOnOverlayContexts__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_findOverlayResolution:", v6);
    objc_msgSend(*(id *)(a1 + 32), "currentChartDateInterval");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "chartController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prepareContextForDateInterval:overlayController:timeScope:resolution:", v4, v5, objc_msgSend(*(id *)(a1 + 32), "currentChartTimeScope"), v3);

  }
}

- (void)_subscribeToSampleTypeUpdates
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActivitySummary");

  if ((v4 & 1) == 0)
  {
    -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sampleType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0CB7148];

    if (v7 == v8)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(MEMORY[0x1E0CB6B00], "associatedBalanceMetricsTypes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v22;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16);
            -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "sampleTypeUpdateController");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObserver:forType:", self, v17);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v14);
      }

    }
    else
    {
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sampleTypeUpdateController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sampleType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:forType:", self, v11);

    }
  }
}

- (void)_layoutNoVerticalExpansion:(id)a3
{
  double v3;

  LODWORD(v3) = 1144750080;
  objc_msgSend(a3, "setContentHuggingPriority:forAxis:", 1, v3);
}

- (void)_showAllFilters:(id)a3
{
  -[HKOverlayRoomViewController showAllFiltersWithCompletion:](self, "showAllFiltersWithCompletion:", 0);
}

- (void)_showAllFilters
{
  -[HKOverlayRoomViewController showAllFiltersWithCompletion:](self, "showAllFiltersWithCompletion:", 0);
}

- (void)showAllFiltersWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  HKSelectedTimeScopeController *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HKModalNavigationController *v15;
  _QWORD v16[5];

  v4 = (void (**)(_QWORD))a3;
  -[HKOverlayRoomViewController _findNavigationController](self, "_findNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKOverlayRoomApplicationItems applicationItemsWithItems:](HKOverlayRoomApplicationItems, "applicationItemsWithItems:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(HKSelectedTimeScopeController);
    -[HKSelectedTimeScopeController setSelectedTimeScope:](v8, "setSelectedTimeScope:", -[HKOverlayRoomViewController currentChartTimeScope](self, "currentChartTimeScope"));
    objc_msgSend(v7, "setTimeScopeController:", v8);
    -[HKOverlayRoomViewController displayDate](self, "displayDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController createViewControllerForMode:displayDate:applicationItems:](self, "createViewControllerForMode:displayDate:applicationItems:", 3, v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HKOverlayRoomViewController showAllFiltersActivity](self, "showAllFiltersActivity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setRestorationUserActivity:", v11);

      v12 = objc_msgSend(v10, "currentChartTimeScope");
      if (v12 == -[HKOverlayRoomViewController currentChartTimeScope](self, "currentChartTimeScope"))
      {
        -[HKOverlayRoomViewController _currentChartEffectiveVisibleRange](self, "_currentChartEffectiveVisibleRange");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setInitialVisibleDateRange:", v13);

      }
      if (objc_msgSend(v10, "shouldSelectInitialOverlay"))
      {
        objc_msgSend(v10, "setShouldSelectInitialOverlay:", 1);
      }
      else
      {
        -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setShouldSelectInitialOverlay:", v14 != 0);

      }
      v15 = -[HKModalNavigationController initWithRootViewController:]([HKModalNavigationController alloc], "initWithRootViewController:", v10);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __60__HKOverlayRoomViewController_showAllFiltersWithCompletion___block_invoke;
      v16[3] = &unk_1E9C3F0D0;
      v16[4] = self;
      -[HKModalNavigationController setCompletion:](v15, "setCompletion:", v16);
      -[HKOverlayRoomViewController _willPresentShowAllFilters](self, "_willPresentShowAllFilters");
      objc_msgSend(v5, "hk_presentModalCardViewController:fullScreen:animated:completion:", v15, 1, 1, v4);

    }
    else if (v4)
    {
      v4[2](v4);
    }

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

uint64_t __60__HKOverlayRoomViewController_showAllFiltersWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didDismissShowAllFilters");
}

- (id)overlayButtonNamesForTesting
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t i;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v24)
  {
    v30 = 0;
    v23 = *(_QWORD *)v40;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v40 != v23)
          objc_enumerationMutation(obj);
        v25 = v4;
        v5 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v4);
        objc_msgSend(v5, "localizedContainerTitle");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(v5, "localizedContainerTitle");
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = CFSTR("default");
        }

        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v5, "overlayContextSections");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        if (v28)
        {
          v27 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v36 != v27)
                objc_enumerationMutation(v26);
              v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
              objc_msgSend(v9, "localizedSectionTitle");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (v10)
              {
                objc_msgSend(v9, "localizedSectionTitle");
                v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v11 = CFSTR("default");
              }

              v33 = 0u;
              v34 = 0u;
              v31 = 0u;
              v32 = 0u;
              objc_msgSend(v9, "overlayContextItems");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
              if (v13)
              {
                v14 = v13;
                v29 = i;
                v15 = *(_QWORD *)v32;
                do
                {
                  for (j = 0; j != v14; ++j)
                  {
                    if (*(_QWORD *)v32 != v15)
                      objc_enumerationMutation(v12);
                    objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "contextItemForLastUpdate");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "accessibilityIdentifier");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v18 || !objc_msgSend(v18, "length"))
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("button_%ld"), v30 + j);
                      v19 = objc_claimAutoreleasedReturnValue();

                      v18 = (void *)v19;
                    }
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@||%@||%@"), v7, v11, v18);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v3, "addObject:", v20);

                  }
                  v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
                  v30 += j;
                }
                while (v14);
                i = v29;
              }

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          }
          while (v28);
        }

        v4 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v24);
  }

  return v3;
}

- (BOOL)selectOverlayButtonForTestingNamed:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t j;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HKOverlayContextLocation *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HKOverlayRoomViewController *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  HKOverlayContextLocation *v47;
  uint64_t v48;
  __CFString *v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("||"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 3)
  {
    v33 = v5;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v36)
    {
      v45 = 0;
      v46 = 0;
      v6 = 0;
      v35 = *(_QWORD *)v61;
      v7 = 0x1E0CB3000uLL;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v61 != v35)
          {
            v9 = v8;
            objc_enumerationMutation(obj);
            v8 = v9;
          }
          v37 = v8;
          v10 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v8);
          objc_msgSend(v10, "localizedContainerTitle");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v10, "localizedContainerTitle");
            v42 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v42 = CFSTR("default");
          }

          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          objc_msgSend(v10, "overlayContextSections");
          v38 = (id)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
          if (v40)
          {
            v50 = 0;
            v39 = *(_QWORD *)v57;
            v12 = (__CFString *)v42;
            do
            {
              for (i = 0; i != v40; ++i)
              {
                if (*(_QWORD *)v57 != v39)
                  objc_enumerationMutation(v38);
                v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
                objc_msgSend(v14, "localizedSectionTitle");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (v15)
                {
                  objc_msgSend(v14, "localizedSectionTitle");
                  v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v49 = CFSTR("default");
                }

                v54 = 0u;
                v55 = 0u;
                v52 = 0u;
                v53 = 0u;
                objc_msgSend(v14, "overlayContextItems");
                v43 = (id)objc_claimAutoreleasedReturnValue();
                v51 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
                if (v51)
                {
                  v41 = i;
                  v44 = 0;
                  v48 = *(_QWORD *)v53;
                  do
                  {
                    for (j = 0; j != v51; ++j)
                    {
                      if (*(_QWORD *)v53 != v48)
                        objc_enumerationMutation(v43);
                      objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "contextItemForLastUpdate");
                      v17 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v17, "accessibilityIdentifier");
                      v18 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v18 || !objc_msgSend(v18, "length"))
                      {
                        objc_msgSend(*(id *)(v7 + 2368), "stringWithFormat:", CFSTR("button_%ld"), v45 + j);
                        v19 = objc_claimAutoreleasedReturnValue();

                        v18 = (void *)v19;
                      }
                      objc_msgSend(*(id *)(v7 + 2368), "stringWithFormat:", CFSTR("%@||%@||%@"), v12, v49, v18);
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v20, "isEqualToString:", v4))
                      {
                        v21 = -[HKOverlayContextLocation initWithContainerIndex:sectionIndex:itemIndex:]([HKOverlayContextLocation alloc], "initWithContainerIndex:sectionIndex:itemIndex:", v46, v50, v44 + j);
                        -[HKOverlayRoomViewController setUserHasOverriddenPreferredOverlay:](self, "setUserHasOverriddenPreferredOverlay:", 1);
                        -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
                        v22 = (void *)objc_claimAutoreleasedReturnValue();
                        v47 = v21;
                        -[HKOverlayRoomViewController _updateChartForOverlaySelection:previousSelection:](self, "_updateChartForOverlaySelection:previousSelection:", v21, v22);

                        if (v46 != -[HKOverlayRoomViewController segmentedControlSelectedIndex](self, "segmentedControlSelectedIndex"))
                        {
                          -[HKOverlayRoomViewController setSegmentedControlSelectedIndex:](self, "setSegmentedControlSelectedIndex:", v46);
                          -[HKOverlayRoomViewController sectionedContextView](self, "sectionedContextView");
                          v23 = (void *)objc_claimAutoreleasedReturnValue();
                          -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
                          v24 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v24, "objectAtIndexedSubscript:", v46);
                          v25 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v25, "overlayContextSections");
                          v26 = self;
                          v27 = v4;
                          v28 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v23, "setDisplayTypeContextSections:", v28);

                          v4 = v27;
                          self = v26;

                        }
                        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v44 + j, v50);
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        -[HKOverlayRoomViewController sectionedContextView](self, "sectionedContextView");
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v30, "selectItemAtIndexPath:animated:scrollPosition:", v29, 0, 0);

                        v6 = 1;
                        v7 = 0x1E0CB3000;
                        v12 = (__CFString *)v42;
                      }

                    }
                    v44 += j;
                    v45 += j;
                    v51 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
                  }
                  while (v51);
                  i = v41;
                }

                ++v50;
              }
              v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
            }
            while (v40);
          }
          else
          {
            v12 = (__CFString *)v42;
          }

          ++v46;
          v8 = v37 + 1;
        }
        while (v37 + 1 != v36);
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      }
      while (v36);
    }
    else
    {
      v6 = 0;
    }

    v31 = v6 & 1;
    v5 = v33;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)overlayButtonValueForTesting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController _selectedOverlayContextWithLocation:](self, "_selectedOverlayContextWithLocation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v4, "contextItemForLastUpdate"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    objc_msgSend(v5, "attributedLabelTextOverride");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "attributedLabelTextOverride");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "attributedLabelText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "string");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v6, "valueContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v6, "valueContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v12);

      }
      objc_msgSend(v6, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v6, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

      }
      objc_msgSend(v6, "unit");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v6, "unit");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

      }
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("::"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = CFSTR("NoOverlayButtonValue");
  }

  return v10;
}

- (void)_willPresentShowAllFilters
{
  _TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent *v3;
  void *v4;
  _TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent *v5;

  -[HKOverlayRoomViewController setShowAllFiltersVisible:](self, "setShowAllFiltersVisible:", 1);
  -[HKOverlayRoomViewController saveRestorationState](self, "saveRestorationState");
  v3 = [_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent alloc];
  -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HKInteractiveChartInteractionAnalyticsEvent initWithShowMoreDataForDisplayType:](v3, "initWithShowMoreDataForDisplayType:", v4);

  -[HKInteractiveChartInteractionAnalyticsManager submitWithEvent:](self->_analyticsManager, "submitWithEvent:", v5);
}

- (void)_didDismissShowAllFilters
{
  -[HKOverlayRoomViewController setShowAllFiltersActivity:](self, "setShowAllFiltersActivity:", 0);
  -[HKOverlayRoomViewController setShowAllFiltersVisible:](self, "setShowAllFiltersVisible:", 0);
  -[HKOverlayRoomViewController saveRestorationState](self, "saveRestorationState");
}

- (id)_currentChartEffectiveVisibleRange
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HKOverlayRoomViewController chartController](self, "chartController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryGraphViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "graphView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "effectiveVisibleRangeCadence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_findNavigationController
{
  void *v3;
  void *v4;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  -[HKOverlayRoomViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKOverlayRoomViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKOverlayRoomViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      do
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = v4;
          objc_msgSend(v7, "navigationController");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            objc_msgSend(v7, "navigationController");
            v4 = (void *)objc_claimAutoreleasedReturnValue();

            return v4;
          }

        }
        objc_msgSend(v4, "nextResponder");
        v9 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v9;
      }
      while (v9);
    }
  }
  return v4;
}

- (void)_selectContextItemAtLocation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = a4;
    -[HKOverlayRoomViewController setCurrentSelectedContextLocation:](self, "setCurrentSelectedContextLocation:");
    -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController setSegmentedControlSelectedIndex:](self, "setSegmentedControlSelectedIndex:", objc_msgSend(v6, "containerIndex"));

    -[HKOverlayRoomViewController sectionedContextView](self, "sectionedContextView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController _currentIndexPath](self, "_currentIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectItemAtIndexPath:animated:scrollPosition:", v7, v4, 0);

  }
}

- (id)_currentIndexPath
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB36B0];
  -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "itemIndex");
  -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForRow:inSection:", v5, objc_msgSend(v6, "sectionIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)fetchContextItemsIfNeededWithDateInterval:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  _QWORD v14[4];
  dispatch_group_t v15;
  HKOverlayRoomViewController *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[HKOverlayRoomViewController _contextItemCount](self, "_contextItemCount") >= 1)
  {
    v8 = dispatch_group_create();
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __84__HKOverlayRoomViewController_fetchContextItemsIfNeededWithDateInterval_completion___block_invoke;
    v14[3] = &unk_1E9C40040;
    v15 = v8;
    v16 = self;
    v17 = v6;
    v10 = v8;
    -[HKOverlayRoomViewController _enumerateContextItemsWithBlock:](self, "_enumerateContextItemsWithBlock:", v14);
    -[HKOverlayRoomViewController contextUpdateQueue](self, "contextUpdateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __84__HKOverlayRoomViewController_fetchContextItemsIfNeededWithDateInterval_completion___block_invoke_3;
    block[3] = &unk_1E9C40068;
    block[4] = self;
    v13 = v7;
    dispatch_group_notify(v10, v11, block);

  }
}

void __84__HKOverlayRoomViewController_fetchContextItemsIfNeededWithDateInterval_completion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v5 = objc_msgSend(*(id *)(a1 + 40), "_findOverlayResolution:", v4);
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "chartController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 40), "currentChartTimeScope");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__HKOverlayRoomViewController_fetchContextItemsIfNeededWithDateInterval_completion___block_invoke_2;
  v9[3] = &unk_1E9C3FB40;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v4, "updateContextItemForDateInterval:overlayController:timeScope:resolution:completion:", v6, v7, v8, v5, v9);

}

void __84__HKOverlayRoomViewController_fetchContextItemsIfNeededWithDateInterval_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__HKOverlayRoomViewController_fetchContextItemsIfNeededWithDateInterval_completion___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __84__HKOverlayRoomViewController_fetchContextItemsIfNeededWithDateInterval_completion___block_invoke_4;
  v2[3] = &unk_1E9C40068;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __84__HKOverlayRoomViewController_fetchContextItemsIfNeededWithDateInterval_completion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateContextTiles");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (int64_t)_contextItemCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v8, "overlayContextSections", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v17;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v17 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "overlayContextItems");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v5 += objc_msgSend(v14, "count");

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v11);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)_findOverlayResolution:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  v4 = a3;
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryGraphViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "graphView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "resolutionFromTraitCollectionAttributes");
  else
    v8 = 0;
  v9 = objc_msgSend(v4, "resolutionForTimeScope:traitResolution:", -[HKOverlayRoomViewController currentChartTimeScope](self, "currentChartTimeScope"), v8);

  return v9;
}

- (BOOL)_canSelectOverlayLocation:(id)a3 previousSelection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
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
  int64_t v21;
  void *v22;
  char v23;
  void *v25;

  v6 = a3;
  v7 = a4;
  -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "containerIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "overlayContextSections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "sectionIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "containerIndex"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "overlayContextSections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v7, "sectionIndex"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v11, "overlayContextItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v6, "itemIndex"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "overlayContextItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v7, "itemIndex"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v17, "contextItemForLastUpdate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HKOverlayRoomViewController currentChartTimeScope](self, "currentChartTimeScope");
    -[HKOverlayRoomViewController chartController](self, "chartController");
    v25 = v11;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v17, "canSelectOverlayContextItem:isDeselecting:timeScope:chartController:", v20, v17 == v19, v21, v22);

    v11 = v25;
  }
  else
  {
    v23 = 1;
  }

  return v23;
}

- (void)_updateChartForOverlaySelection:(id)a3 previousSelection:(id)a4
{
  -[HKOverlayRoomViewController _updateChartForOverlaySelection:previousSelection:animated:](self, "_updateChartForOverlaySelection:previousSelection:animated:", a3, a4, 0);
}

- (void)_updateChartForOverlaySelection:(id)a3 previousSelection:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int64_t v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  NSObject *v46;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  char v66;
  int v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  char v72;
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
  void *v83;
  int v84;
  void *v85;
  void *v86;
  void *v87;
  _BOOL4 v88;
  void *v89;
  int v90;
  __int128 v91;
  void *v92;
  void *v93;
  uint8_t buf[4];
  void *v95;
  uint64_t v96;

  v88 = a5;
  v96 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "containerIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "overlayContextSections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v8, "sectionIndex"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "overlayContextItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v8, "itemIndex"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v84 = objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1F01B9AE8);
    if (v84)
      v15 = v14;
    else
      v15 = 0;

  }
  else
  {
    v84 = 0;
    v15 = 0;
    v14 = 0;
  }
  *((_QWORD *)&v91 + 1) = v7;
  v92 = v15;
  if (!v7)
  {
    v24 = -[HKOverlayRoomViewController segmentedControlSelectedIndex](self, "segmentedControlSelectedIndex");
    v87 = 0;
    v21 = 0;
    v25 = 0;
    v90 = 0;
LABEL_17:
    -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    if (v36 <= v24)
    {
      v93 = 0;
    }
    else
    {
      -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", v24);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "primaryDisplayType");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "presentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v40, "copyWithIsCriticalForAutoscale:", 1);
      v93 = (void *)objc_msgSend(v39, "copyWithPresentation:", v41);

    }
    v33 = (void *)*((_QWORD *)&v91 + 1);
    goto LABEL_21;
  }
  -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v7, "containerIndex"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "overlayContextSections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v7, "sectionIndex"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "overlayContextItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v7, "itemIndex"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v21, "baseDisplayTypeForOverlay:", self->_currentChartTimeScope);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
  }
  else
  {
    -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v7, "containerIndex"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "primaryDisplayType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v23;
  }
  objc_msgSend(v22, "presentation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "copyWithIsCriticalForAutoscale:", 1);
  v93 = (void *)objc_msgSend(v23, "copyWithPresentation:", v29);

  v90 = objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1F01B9AE8);
  if (v90)
  {
    v25 = v21;
    objc_msgSend(v25, "stackedBaseDisplayTypeForOverlay:", self->_currentChartTimeScope);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "presentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "copyWithIsCriticalForAutoscale:", 1);
    v87 = (void *)objc_msgSend(v30, "copyWithPresentation:", v32);

  }
  else
  {
    v25 = 0;
    v87 = 0;
  }
  v33 = (void *)*((_QWORD *)&v91 + 1);

  v34 = -[HKOverlayRoomViewController segmentedControlSelectedIndex](self, "segmentedControlSelectedIndex");
  if (!v93)
  {
    v24 = v34;
    goto LABEL_17;
  }
LABEL_21:
  *(_QWORD *)&v91 = v8;
  v42 = v92;
  if (!v14)
  {
    v43 = 0;
    if (v21)
      goto LABEL_23;
LABEL_25:
    v44 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v14, "contextItemForLastUpdate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
    goto LABEL_25;
LABEL_23:
  objc_msgSend(v21, "contextItemForLastUpdate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
  v45 = v88;
  if (v44 && v43 && v44 == v43 && v88)
  {
    _HKInitializeLogging();
    HKUILogCharting();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v43, "description");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v95 = v47;
      _os_log_impl(&dword_1D7813000, v46, OS_LOG_TYPE_DEFAULT, "HKOverlayRoomViewController skipping redundant update during animation for selected context item: %{private}@", buf, 0xCu);

    }
  }
  else
  {
    v89 = v25;
    if (v45)
    {
      -[HKOverlayRoomViewController chartController](self, "chartController");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "installGraphViewSnapshot");

      -[HKOverlayRoomViewController chartController](self, "chartController");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "removeGraphViewSnapshotAnimated:", 1);

    }
    if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HKOverlayRoomViewController chartController](self, "chartController");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "overlayStateWillChange:contextItem:chartController:", 0, v43, v50);

    }
    v86 = v14;
    if (v92 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HKOverlayRoomViewController chartController](self, "chartController");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "stackedOverlayStateWillChange:contextItem:chartController:", 0, v43, v51);

    }
    if (v21 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HKOverlayRoomViewController chartController](self, "chartController");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "overlayStateWillChange:contextItem:chartController:", 1, v44, v52);

    }
    if (v25 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HKOverlayRoomViewController chartController](self, "chartController");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stackedOverlayStateWillChange:contextItem:chartController:", 1, v44, v53);

    }
    -[HKOverlayRoomViewController didChangeFromContextItem:toContextItem:](self, "didChangeFromContextItem:toContextItem:", v43, v44);
    -[HKOverlayRoomViewController setCurrentSelectedContextLocation:](self, "setCurrentSelectedContextLocation:", v33);
    if (v90)
    {
      if (v84)
      {
        -[HKOverlayRoomViewController chartController](self, "chartController");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "clearDisplayTypeStack");

        -[HKOverlayRoomViewController _restoreStackingProportions](self, "_restoreStackingProportions");
      }
      -[HKOverlayRoomViewController _setupStackingProportionsForContext:](self, "_setupStackingProportionsForContext:", v25);
      -[HKOverlayRoomViewController chartController](self, "chartController");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "installStackedDisplayType:", v87);

      -[HKOverlayRoomViewController chartController](self, "chartController");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "updateCurrentValueViewWithVisibleRange");

    }
    else if (v84)
    {
      -[HKOverlayRoomViewController chartController](self, "chartController");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "clearDisplayTypeStack");

      -[HKOverlayRoomViewController _restoreStackingProportions](self, "_restoreStackingProportions");
    }
    -[HKOverlayRoomViewController chartController](self, "chartController");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController chartController](self, "chartController");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "currentDisplayTypesForStackOffset:", objc_msgSend(v59, "primaryDisplayTypeStackIndex"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = v60;
    objc_msgSend(v60, "firstObject");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61 == v62)
    {
      v64 = 1;
    }
    else
    {
      -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "isEqual:", v61);

    }
    -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "isActivitySummary");

    v67 = v90;
    if ((v66 & 1) == 0)
    {
      v67 = v90;
      if ((v64 & 1) == 0)
      {
        if (v21
          || (objc_opt_respondsToSelector() & 1) == 0
          || (v67 = v90, (objc_msgSend(v14, "unselectedContextShouldUseContextBaseType") & 1) == 0))
        {
          -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKOverlayRoomViewController _installBaseDisplayType:autoscale:](self, "_installBaseDisplayType:autoscale:", v68, v90 ^ 1u);

          v67 = 1;
        }
      }
    }
    if (v93)
    {
      -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
      v69 = objc_claimAutoreleasedReturnValue();
      if (v69)
      {
        v70 = (void *)v69;
        -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "isActivitySummary");

        if ((v72 & 1) == 0)
        {
          -[HKOverlayRoomViewController _installBaseDisplayType:autoscale:](self, "_installBaseDisplayType:autoscale:", v93, v90 ^ 1u);
          v67 = 1;
        }
      }
    }
    if (v93 != v61)
    {
      -[HKOverlayRoomViewController chartController](self, "chartController");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "updateCurrentValueViewWithVisibleRange");

    }
    if (v21)
    {
      objc_msgSend(v21, "overlayDisplayTypeForTimeScope:", self->_currentChartTimeScope);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v74 = 0;
    }
    -[HKOverlayRoomViewController chartController](self, "chartController");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "installOverlayDisplayType:", v74);

    if (v86 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HKOverlayRoomViewController chartController](self, "chartController");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "overlayStateDidChange:contextItem:chartController:", 0, v43, v76);

    }
    if (v92 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HKOverlayRoomViewController chartController](self, "chartController");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "stackedOverlayStateDidChange:contextItem:chartController:", 0, v43, v77);

    }
    v25 = v89;
    if (v21)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HKOverlayRoomViewController chartController](self, "chartController");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "overlayStateDidChange:contextItem:chartController:", 1, v44, v78);

        v25 = v89;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (!(_QWORD)v91 || (objc_msgSend((id)v91, "isEqual:", *((_QWORD *)&v91 + 1)) & 1) == 0))
      {
        -[HKOverlayRoomViewController chartController](self, "chartController");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "overlayWasExplicitlySelected:chartController:", v44, v79);

        v25 = v89;
      }
    }
    if (v25 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HKOverlayRoomViewController chartController](self, "chartController");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "stackedOverlayStateDidChange:contextItem:chartController:", 1, v44, v80);

      v25 = v89;
    }
    if (v67)
    {
      -[HKOverlayRoomViewController chartController](self, "chartController");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "primaryGraphViewController");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "graphView");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "resetAndRedraw");

      v25 = v89;
    }
    v33 = (void *)*((_QWORD *)&v91 + 1);
    if (v91 != 0)
    {
      -[HKOverlayRoomViewController setRestorationContextLocation:](self, "setRestorationContextLocation:", *((_QWORD *)&v91 + 1));
      -[HKOverlayRoomViewController saveRestorationState](self, "saveRestorationState");
    }

    v14 = v86;
    v42 = v92;
  }

}

- (id)_bottomMostDisplayType:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v4;
  v7 = v6;
  v8 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "baseDisplayType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v7, "baseDisplayType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomViewController _bottomMostDisplayType:](self, "_bottomMostDisplayType:", v10);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = v7;
    }

  }
  return v8;
}

- (void)_installBaseDisplayType:(id)a3 autoscale:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearOverlayDisplayTypeWithAutomaticAutoscale:", v4);

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "addObject:", v15);
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentDisplayTypesForStackOffset:", objc_msgSend(v9, "primaryDisplayTypeStackIndex"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    v11 = 1;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v12);

      ++v11;
    }
    while (v11 < objc_msgSend(v10, "count"));
  }
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "replaceCurrentDisplayTypesWithTypes:stackOffset:resetDateRange:automaticAutoScale:", v7, objc_msgSend(v14, "primaryDisplayTypeStackIndex"), 0, v4);

}

- (void)_setupStackingProportionsForContext:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = objc_opt_respondsToSelector();
  v5 = v16;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v16, "stackedHeight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "kind");
    if (v7 == 1)
    {
      -[HKOverlayRoomViewController chartController](self, "chartController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stackedDisplayTypeHeights");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[HKOverlayRoomViewController chartController](self, "chartController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stackedDisplayTypeHeights");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "arrayByAddingObject:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[HKOverlayRoomViewController _evenStackedProportions](self, "_evenStackedProportions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "arrayByAddingObject:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (!v8)
        goto LABEL_11;
    }
    else
    {
      if (v7)
        goto LABEL_11;
      objc_msgSend(v6, "heightValue");
      -[HKOverlayRoomViewController _computeRevisedRatiosGivenRatio:](self, "_computeRevisedRatiosGivenRatio:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_11;
    }
    -[HKOverlayRoomViewController chartController](self, "chartController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stackedDisplayTypeHeights");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController setPreviousStackHeights:](self, "setPreviousStackHeights:", v14);

    -[HKOverlayRoomViewController chartController](self, "chartController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setStackedDisplayTypeHeights:", v8);

LABEL_11:
    v5 = v16;
  }

}

- (id)_computeRevisedRatiosGivenRatio:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  unint64_t v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  HKInteractiveChartStackHeight *v15;
  double v16;
  HKInteractiveChartStackHeight *v17;

  -[HKOverlayRoomViewController chartController](self, "chartController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stackedDisplayTypeHeights");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[HKOverlayRoomViewController _evenStackedProportions](self, "_evenStackedProportions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HKOverlayRoomViewController _indexesOfLargestProportions:](self, "_indexesOfLargestProportions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = objc_msgSend(v7, "count");
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v6, "count"))
    {
      v10 = 0;
      v11 = a3 / (double)v8;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v7, "containsObject:", v13);

        if (v14)
        {
          v15 = [HKInteractiveChartStackHeight alloc];
          objc_msgSend(v12, "heightValue");
          v17 = -[HKInteractiveChartStackHeight initWithKind:heightValue:](v15, "initWithKind:heightValue:", 0, v16 - v11);
          objc_msgSend(v9, "addObject:", v17);

        }
        else
        {
          objc_msgSend(v9, "addObject:", v12);
        }

        ++v10;
      }
      while (v10 < objc_msgSend(v6, "count"));
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_restoreStackingProportions
{
  void *v3;
  void *v4;

  -[HKOverlayRoomViewController previousStackHeights](self, "previousStackHeights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController chartController](self, "chartController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStackedDisplayTypeHeights:", v3);

  -[HKOverlayRoomViewController setPreviousStackHeights:](self, "setPreviousStackHeights:", 0);
}

- (id)_evenStackedProportions
{
  void *v2;
  uint64_t v3;
  id v4;
  double v5;
  HKInteractiveChartStackHeight *v6;

  -[HKOverlayRoomViewController chartController](self, "chartController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "stackOffsetCount");

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v3 >= 1)
    {
      v5 = 1.0 / (double)v3;
      do
      {
        v6 = -[HKInteractiveChartStackHeight initWithKind:heightValue:]([HKInteractiveChartStackHeight alloc], "initWithKind:heightValue:", 0, v5);
        objc_msgSend(v4, "addObject:", v6);

        --v3;
      }
      while (v3);
    }
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C9AA60];
  }
  return v4;
}

- (id)_indexesOfLargestProportions:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    v6 = -1.0;
    while (1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "kind"))
      {
        objc_msgSend(v7, "heightValue");
        v9 = v8;
        if (vabdd_f64(v8, v6) < 0.01)
          goto LABEL_7;
        if (v8 - v6 > 0.0)
          break;
      }
LABEL_8:

      if (++v5 >= (unint64_t)objc_msgSend(v3, "count"))
        goto LABEL_9;
    }
    objc_msgSend(v4, "removeAllObjects", v8 - v6);
    v6 = v9;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

    goto LABEL_8;
  }
LABEL_9:

  return v4;
}

- (BOOL)contextView:(id)a3 canSelectItemAtIndexPath:(id)a4
{
  id v5;
  HKOverlayContextLocation *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  HKOverlayContextLocation *v10;
  void *v11;

  v5 = a4;
  v6 = [HKOverlayContextLocation alloc];
  v7 = -[HKOverlayRoomViewController segmentedControlSelectedIndex](self, "segmentedControlSelectedIndex");
  v8 = objc_msgSend(v5, "section");
  v9 = objc_msgSend(v5, "row");

  v10 = -[HKOverlayContextLocation initWithContainerIndex:sectionIndex:itemIndex:](v6, "initWithContainerIndex:sectionIndex:itemIndex:", v7, v8, v9);
  -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HKOverlayRoomViewController _canSelectOverlayLocation:previousSelection:](self, "_canSelectOverlayLocation:previousSelection:", v10, v11);

  return (char)self;
}

- (void)contextView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  HKOverlayContextLocation *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  HKOverlayContextLocation *v10;
  id v11;

  v5 = a4;
  -[HKOverlayRoomViewController setUserHasOverriddenPreferredOverlay:](self, "setUserHasOverriddenPreferredOverlay:", 1);
  -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [HKOverlayContextLocation alloc];
  v7 = -[HKOverlayRoomViewController segmentedControlSelectedIndex](self, "segmentedControlSelectedIndex");
  v8 = objc_msgSend(v5, "section");
  v9 = objc_msgSend(v5, "row");

  v10 = -[HKOverlayContextLocation initWithContainerIndex:sectionIndex:itemIndex:](v6, "initWithContainerIndex:sectionIndex:itemIndex:", v7, v8, v9);
  -[HKOverlayRoomViewController _updateChartForOverlaySelection:previousSelection:animated:](self, "_updateChartForOverlaySelection:previousSelection:animated:", v10, v11, 1);
  -[HKOverlayRoomViewController _disableDefaultOverlaySelectionIfNecessary](self, "_disableDefaultOverlaySelectionIfNecessary");

}

- (void)contextView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v5;

  -[HKOverlayRoomViewController setUserHasOverriddenPreferredOverlay:](self, "setUserHasOverriddenPreferredOverlay:", 1, a4);
  -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController _updateChartForOverlaySelection:previousSelection:animated:](self, "_updateChartForOverlaySelection:previousSelection:animated:", 0, v5, 1);
  -[HKOverlayRoomViewController _disableDefaultOverlaySelectionIfNecessary](self, "_disableDefaultOverlaySelectionIfNecessary");

}

- (void)contextView:(id)a3 didTapOnInfoButtonAtIndex:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v16 = (id)v6;
    -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10 <= a4)
        return;
      -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "healthStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKInteractiveChartInfographicFactory infographicViewControllerForDisplayType:factorDisplayType:healthStore:](HKInteractiveChartInfographicFactory, "infographicViewControllerForDisplayType:factorDisplayType:healthStore:", v12, v16, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        -[UIViewController hk_presentModalCardViewController:fullScreen:animated:completion:](self, "hk_presentModalCardViewController:fullScreen:animated:completion:", v15, 0, 1, 0);

    }
  }
}

- (void)segmentedControlValueChanged:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = -[HKOverlayRoomViewController controllerMode](self, "controllerMode");
  v6 = objc_msgSend(v4, "selectedSegmentIndex");

  -[HKOverlayRoomViewController initialSelectedContextForMode:containerIndex:](self, "initialSelectedContextForMode:containerIndex:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController setInitialSelectedContextLocation:](self, "setInitialSelectedContextLocation:", v7);

  -[HKOverlayRoomViewController initialSelectedContextLocation](self, "initialSelectedContextLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomViewController _unselectCurrentContext](self, "_unselectCurrentContext");
  -[HKOverlayRoomViewController _updateContextTiles](self, "_updateContextTiles");
  if (v8)
    -[HKOverlayRoomViewController _selectPreferredItem](self, "_selectPreferredItem");
  -[HKOverlayRoomViewController sectionedContextView](self, "sectionedContextView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scrollToTop");

  -[HKOverlayRoomViewController chartController](self, "chartController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateCurrentValueViewWithVisibleRange");

}

- (int64_t)segmentedControlSelectedIndex
{
  void *v3;
  void *v4;
  int64_t v5;

  -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedSegmentIndex");

  return v5;
}

- (void)setSegmentedControlSelectedIndex:(unint64_t)a3
{
  id v4;

  -[HKOverlayRoomViewController segmentedControl](self, "segmentedControl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedSegmentIndex:", a3);

}

- (void)didUpdateFromDateZoom:(int64_t)a3 toDateZoom:(int64_t)a4 newVisibleRange:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11[2];
  id location;

  v7 = a5;
  -[HKOverlayRoomViewController _invalidateDefaultOverlayDeselectionTimer](self, "_invalidateDefaultOverlayDeselectionTimer");
  -[HKOverlayRoomViewController setCurrentChartTimeScope:](self, "setCurrentChartTimeScope:", a4);
  objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithValueRange:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController setCurrentChartDateInterval:](self, "setCurrentChartDateInterval:", v8);

  objc_initWeak(&location, self);
  -[HKOverlayRoomViewController currentChartDateInterval](self, "currentChartDateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__HKOverlayRoomViewController_didUpdateFromDateZoom_toDateZoom_newVisibleRange___block_invoke;
  v10[3] = &unk_1E9C40090;
  objc_copyWeak(v11, &location);
  v10[4] = self;
  v11[1] = (id)a4;
  -[HKOverlayRoomViewController fetchContextItemsIfNeededWithDateInterval:completion:](self, "fetchContextItemsIfNeededWithDateInterval:completion:", v9, v10);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

}

void __80__HKOverlayRoomViewController_didUpdateFromDateZoom_toDateZoom_newVisibleRange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (objc_msgSend(*(id *)(a1 + 32), "_currentSelectedContextValidForTimeScope:", *(_QWORD *)(a1 + 48)))
    {
      objc_msgSend(v6, "currentSelectedContextLocation");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_selectContextItemAtLocation:animated:", v3, 0);

      objc_msgSend(v6, "currentSelectedContextLocation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentSelectedContextLocation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_updateChartForOverlaySelection:previousSelection:", v4, v5);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setUserHasOverriddenPreferredOverlay:", 1);
      objc_msgSend(*(id *)(a1 + 32), "_unselectCurrentContext");
    }
    WeakRetained = v6;
  }

}

- (BOOL)_currentSelectedContextValidForTimeScope:(int64_t)a3
{
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
  void *v15;
  char v16;

  -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 1;
  -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v7, "containerIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "overlayContextSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v10, "sectionIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "overlayContextItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v13, "itemIndex"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HKOverlayRoomViewController chartController](self, "chartController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "canSelectOverlayContextItem:isDeselecting:timeScope:chartController:", v14, 0, a3, v15);

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (void)didUpdateVisibleValueRange:(id)a3 changeContext:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v6 = a3;
  if (a4 == 2)
  {
    v10 = v6;
    objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithValueRange:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController currentChartDateInterval](self, "currentChartDateInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) == 0)
    {
      -[HKOverlayRoomViewController setCurrentChartDateInterval:](self, "setCurrentChartDateInterval:", v7);
      -[HKOverlayRoomViewController _refreshContextItemsAndUpdateChart:](self, "_refreshContextItemsAndUpdateChart:", 0);
    }

    goto LABEL_7;
  }
  if (a4 == 1)
  {
    v10 = v6;
    -[HKOverlayRoomViewController _disableDefaultOverlaySelectionIfNecessary](self, "_disableDefaultOverlaySelectionIfNecessary");
LABEL_7:
    v6 = v10;
  }

}

- (void)didUpdateSeriesWithNewValueRange:(id)a3
{
  if (a3)
    -[HKOverlayRoomViewController _refreshUpdatedItemsWithChartUpdate:invalidateChartItems:](self, "_refreshUpdatedItemsWithChartUpdate:invalidateChartItems:", 0, 0);
}

- (void)sampleTypeDateRangeController:(id)a3 didUpdateDateRanges:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__HKOverlayRoomViewController_sampleTypeDateRangeController_didUpdateDateRanges___block_invoke;
  v7[3] = &unk_1E9C3FC50;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __81__HKOverlayRoomViewController_sampleTypeDateRangeController_didUpdateDateRanges___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_shouldUpdateContextItemsForChanges:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateContextItems");
    return objc_msgSend(*(id *)(a1 + 32), "_refreshContextItemsAndUpdateChart:", 1);
  }
  return result;
}

- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7
{
  _BOOL4 v7;
  id v10;

  v7 = a7;
  v10 = a5;
  if (objc_msgSend(a6, "count") || objc_msgSend(v10, "count") || v7)
    -[HKOverlayRoomViewController _refreshUpdatedItemsWithChartUpdate:invalidateChartItems:](self, "_refreshUpdatedItemsWithChartUpdate:invalidateChartItems:", 1, 1);

}

- (void)updateController:(id)a3 didReceiveHighFrequencyUpdateForType:(id)a4
{
  -[HKOverlayRoomViewController _refreshUpdatedItemsWithChartUpdate:invalidateChartItems:](self, "_refreshUpdatedItemsWithChartUpdate:invalidateChartItems:", 1, 1);
}

- (void)_refreshUpdatedItemsWithChartUpdate:(BOOL)a3 invalidateChartItems:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;
  BOOL v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__HKOverlayRoomViewController__refreshUpdatedItemsWithChartUpdate_invalidateChartItems___block_invoke;
  v4[3] = &unk_1E9C400B8;
  v5 = a4;
  v4[4] = self;
  v6 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

uint64_t __88__HKOverlayRoomViewController__refreshUpdatedItemsWithChartUpdate_invalidateChartItems___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_invalidateContextItems");
  return objc_msgSend(*(id *)(a1 + 32), "_refreshContextItemsAndUpdateChart:", *(unsigned __int8 *)(a1 + 41));
}

- (void)setRestorationUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_restorationUserActivity, a3);
}

- (void)restoreUserActivityState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HKOverlayContextLocation *v13;
  void *v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController setShowAllFiltersActivity:](self, "setShowAllFiltersActivity:", v4);

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("HKOverlayRoomViewControllerRestorationShowAllFiltersKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HKOverlayRoomViewController supportsShowAllFilters](self, "supportsShowAllFilters")
    && objc_msgSend(v5, "BOOLValue"))
  {
    -[HKOverlayRoomViewController _showAllFilters](self, "_showAllFilters");
  }
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("HKOverlayRoomViewControllerRestorationModeKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "integerValue");
    if (v8 == -[HKOverlayRoomViewController controllerMode](self, "controllerMode"))
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("HKOverlayRoomViewControllerRestorationContextContainer"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("HKOverlayRoomViewControllerRestorationContextSection"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("HKOverlayRoomViewControllerRestorationContextItemIndex"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10 && v11)
      {
        v13 = -[HKOverlayContextLocation initWithContainerIndex:sectionIndex:itemIndex:]([HKOverlayContextLocation alloc], "initWithContainerIndex:sectionIndex:itemIndex:", objc_msgSend(v9, "integerValue"), objc_msgSend(v10, "integerValue"), objc_msgSend(v11, "integerValue"));
        -[HKOverlayRoomViewController _selectContextItemAtLocation:animated:](self, "_selectContextItemAtLocation:animated:", v13, 0);
        -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOverlayRoomViewController _updateChartForOverlaySelection:previousSelection:](self, "_updateChartForOverlaySelection:previousSelection:", v14, 0);

      }
    }
  }

}

- (id)restorationStateDictionary
{
  id v3;
  _BOOL8 v4;
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
  void *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = -[HKOverlayRoomViewController showAllFiltersVisible](self, "showAllFiltersVisible")
    || -[HKOverlayRoomViewController controllerMode](self, "controllerMode") == 3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("HKOverlayRoomViewControllerRestorationShowAllFiltersKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKOverlayRoomViewController controllerMode](self, "controllerMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("HKOverlayRoomViewControllerRestorationModeKey"));

  -[HKOverlayRoomViewController restorationContextLocation](self, "restorationContextLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[HKOverlayRoomViewController restorationContextLocation](self, "restorationContextLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "containerIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("HKOverlayRoomViewControllerRestorationContextContainer"));

    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[HKOverlayRoomViewController restorationContextLocation](self, "restorationContextLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "sectionIndex"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("HKOverlayRoomViewControllerRestorationContextSection"));

    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[HKOverlayRoomViewController restorationContextLocation](self, "restorationContextLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "itemIndex"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("HKOverlayRoomViewControllerRestorationContextItemIndex"));

  }
  return v3;
}

- (void)saveRestorationState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HKOverlayRoomViewController restorationStateDictionary](self, "restorationStateDictionary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKInteractiveChartViewController standardChartRestorationDictionary:healthStore:](HKInteractiveChartViewController, "standardChartRestorationDictionary:healthStore:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKInteractiveChartViewController mergeRestorationDictionary:otherDictionary:](HKInteractiveChartViewController, "mergeRestorationDictionary:otherDictionary:", v10, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKInteractiveChartViewController standardChartRestorationActivity:primaryDisplayType:](HKInteractiveChartViewController, "standardChartRestorationActivity:primaryDisplayType:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKInteractiveChartViewController saveRestorationUserActivity:viewController:](HKInteractiveChartViewController, "saveRestorationUserActivity:viewController:", v9, self);
}

- (BOOL)_shouldUpdateContextItemsForChanges:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__HKOverlayRoomViewController__shouldUpdateContextItemsForChanges___block_invoke;
  v7[3] = &unk_1E9C400E0;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  -[HKOverlayRoomViewController _enumerateContextItemsWithBlock:](self, "_enumerateContextItemsWithBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __67__HKOverlayRoomViewController__shouldUpdateContextItemsForChanges___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "sampleTypeForDateRangeUpdates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    *(_BYTE *)(v4 + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5 != 0;

  }
  if (objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1F01B9AE8))
  {
    objc_msgSend(v9, "stackedSampleTypeForDateRangeUpdates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_BYTE *)(v7 + 24))
    {
      *(_BYTE *)(v7 + 24) = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8 != 0;

    }
  }

}

- (void)_enumerateContextItemsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v30;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v5);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v6, "overlayContextSections");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v26;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v26 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
              v21 = 0u;
              v22 = 0u;
              v23 = 0u;
              v24 = 0u;
              objc_msgSend(v12, "overlayContextItems");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
              if (v14)
              {
                v15 = v14;
                v16 = *(_QWORD *)v22;
                do
                {
                  v17 = 0;
                  do
                  {
                    if (*(_QWORD *)v22 != v16)
                      objc_enumerationMutation(v13);
                    v4[2](v4, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17++));
                  }
                  while (v15 != v17);
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
                }
                while (v15);
              }

              ++v11;
            }
            while (v11 != v9);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v20);
  }

}

- (void)_invalidateContextItems
{
  -[HKOverlayRoomViewController _enumerateContextItemsWithBlock:](self, "_enumerateContextItemsWithBlock:", &__block_literal_global_8);
}

void __54__HKOverlayRoomViewController__invalidateContextItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "invalidateContextItem");

}

- (void)_refreshContextItemsAndUpdateChart:(BOOL)a3
{
  void *v5;
  _QWORD v6[4];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  -[HKOverlayRoomViewController currentChartDateInterval](self, "currentChartDateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__HKOverlayRoomViewController__refreshContextItemsAndUpdateChart___block_invoke;
  v6[3] = &unk_1E9C40148;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  -[HKOverlayRoomViewController fetchContextItemsIfNeededWithDateInterval:completion:](self, "fetchContextItemsIfNeededWithDateInterval:completion:", v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __66__HKOverlayRoomViewController__refreshContextItemsAndUpdateChart___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "currentSelectedContextLocation");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_selectContextItemAtLocation:animated:", v2, 0);

    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(WeakRetained, "currentSelectedContextLocation");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "currentSelectedContextLocation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_updateChartForOverlaySelection:previousSelection:", v3, v4);

    }
  }

}

- (void)_unselectCurrentContext
{
  void *v3;
  void *v4;
  id v5;

  -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKOverlayRoomViewController currentSelectedContextLocation](self, "currentSelectedContextLocation");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewController _updateChartForOverlaySelection:previousSelection:animated:](self, "_updateChartForOverlaySelection:previousSelection:animated:", 0, v5, 1);
    -[HKOverlayRoomViewController sectionedContextView](self, "sectionedContextView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deselectAllItemsAnimated:", 0);

  }
  else
  {
    -[HKOverlayRoomViewController _updateChartForOverlaySelection:previousSelection:](self, "_updateChartForOverlaySelection:previousSelection:", 0, 0);
  }
}

- (id)_selectedOverlayContextWithLocation:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = v4;
  if (v4
    && (v6 = objc_msgSend(v4, "containerIndex"),
        -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6 < v8))
  {
    -[HKOverlayRoomViewController overlayContextSectionContainers](self, "overlayContextSectionContainers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "containerIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v5, "sectionIndex");
    objc_msgSend(v10, "overlayContextSections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v11 >= v13)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(v10, "overlayContextSections");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v5, "sectionIndex"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "overlayContextItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v5, "itemIndex"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_shouldInstallDefaultOverlayDeselectionTimerForMode:(int64_t)a3 initialSelectedLocation:(id)a4
{
  uint64_t v5;
  void *v6;
  BOOL v7;

  -[HKOverlayRoomViewController _selectedOverlayContextWithLocation:](self, "_selectedOverlayContextWithLocation:", a4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (a3 != 3)
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        v7 = 1;
    }
  }

  return v7;
}

- (void)_installDefaultOverlayDeselectionTimer
{
  void *v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  -[HKOverlayRoomViewController _invalidateDefaultOverlayDeselectionTimer](self, "_invalidateDefaultOverlayDeselectionTimer");
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0C99E88];
  v4 = _DefaultOverlayDeselectDelay();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __69__HKOverlayRoomViewController__installDefaultOverlayDeselectionTimer__block_invoke;
  v9 = &unk_1E9C40170;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController setDefaultOverlayDeselectTimer:](self, "setDefaultOverlayDeselectTimer:", v5, v6, v7, v8, v9);

  -[HKOverlayRoomViewController _registerPresentationControllerTransitionNotificationsForOverlayDeselectionTimer](self, "_registerPresentationControllerTransitionNotificationsForOverlayDeselectionTimer");
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __69__HKOverlayRoomViewController__installDefaultOverlayDeselectionTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_disableDefaultOverlaySelection");

}

- (void)_invalidateDefaultOverlayDeselectionTimer
{
  NSTimer *defaultOverlayDeselectTimer;

  -[NSTimer invalidate](self->_defaultOverlayDeselectTimer, "invalidate");
  defaultOverlayDeselectTimer = self->_defaultOverlayDeselectTimer;
  self->_defaultOverlayDeselectTimer = 0;

}

- (void)_disableDefaultOverlaySelection
{
  -[HKOverlayRoomViewController setUserHasOverriddenPreferredOverlay:](self, "setUserHasOverriddenPreferredOverlay:", 1);
  -[HKOverlayRoomViewController _unselectCurrentContext](self, "_unselectCurrentContext");
  -[HKOverlayRoomViewController _invalidateDefaultOverlayDeselectionTimer](self, "_invalidateDefaultOverlayDeselectionTimer");
  -[HKOverlayRoomViewController _unregisterPresentationControllerTransitionNotificationsForOverlayDeselectionTimer](self, "_unregisterPresentationControllerTransitionNotificationsForOverlayDeselectionTimer");
}

- (void)_disableDefaultOverlaySelectionIfNecessary
{
  if (self->_defaultOverlayDeselectTimer)
    -[HKOverlayRoomViewController _disableDefaultOverlaySelection](self, "_disableDefaultOverlaySelection");
}

- (void)_registerPresentationControllerTransitionNotificationsForOverlayDeselectionTimer
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handlePresentationControllerPresentationTransitionDidEnd_, *MEMORY[0x1E0DC5228], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handlePresentationControllerDismissalDidEnd_, *MEMORY[0x1E0DC5218], 0);

}

- (void)_unregisterPresentationControllerTransitionNotificationsForOverlayDeselectionTimer
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5228], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5218], 0);

}

- (void)_handlePresentationControllerPresentationTransitionDidEnd:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    -[HKOverlayRoomViewController _pauseDefaultOverlayDeselectionTimerIfNecessary](self, "_pauseDefaultOverlayDeselectionTimerIfNecessary");
}

- (void)_handlePresentationControllerDismissalDidEnd:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    -[HKOverlayRoomViewController _restartDefaultOverlayDeselectionTimerIfNecessary](self, "_restartDefaultOverlayDeselectionTimerIfNecessary");
}

- (void)_pauseDefaultOverlayDeselectionTimerIfNecessary
{
  id v3;

  if (-[NSTimer isValid](self->_defaultOverlayDeselectTimer, "isValid"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[NSTimer setFireDate:](self->_defaultOverlayDeselectTimer, "setFireDate:", v3);

  }
}

- (void)_restartDefaultOverlayDeselectionTimerIfNecessary
{
  id v3;

  if (-[NSTimer isValid](self->_defaultOverlayDeselectTimer, "isValid"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", _DefaultOverlayDeselectDelay());
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[NSTimer setFireDate:](self->_defaultOverlayDeselectTimer, "setFireDate:", v3);

  }
}

- (NSString)chartOverlayVersion
{
  return (NSString *)CFSTR("overlays");
}

- (HKOverlayRoomApplicationItems)applicationItems
{
  return self->_applicationItems;
}

- (void)setApplicationItems:(id)a3
{
  objc_storeStrong((id *)&self->_applicationItems, a3);
}

- (HKDisplayType)primaryDisplayType
{
  return self->_primaryDisplayType;
}

- (void)setPrimaryDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_primaryDisplayType, a3);
}

- (NSDate)displayDate
{
  return self->_displayDate;
}

- (int64_t)controllerMode
{
  return self->_controllerMode;
}

- (void)setControllerMode:(int64_t)a3
{
  self->_controllerMode = a3;
}

- (HKInteractiveChartOverlayViewController)chartController
{
  return self->_chartController;
}

- (void)setChartController:(id)a3
{
  objc_storeStrong((id *)&self->_chartController, a3);
}

- (BOOL)shouldSelectInitialOverlay
{
  return self->_shouldSelectInitialOverlay;
}

- (void)setShouldSelectInitialOverlay:(BOOL)a3
{
  self->_shouldSelectInitialOverlay = a3;
}

- (unint64_t)additionalChartOptions
{
  return self->_additionalChartOptions;
}

- (void)setAdditionalChartOptions:(unint64_t)a3
{
  self->_additionalChartOptions = a3;
}

- (HKValueRange)initialVisibleDateRange
{
  return self->_initialVisibleDateRange;
}

- (void)setInitialVisibleDateRange:(id)a3
{
  objc_storeStrong((id *)&self->_initialVisibleDateRange, a3);
}

- (NSUserActivity)restorationUserActivity
{
  return self->_restorationUserActivity;
}

- (NSArray)factorDisplayTypes
{
  return self->_factorDisplayTypes;
}

- (int64_t)currentChartTimeScope
{
  return self->_currentChartTimeScope;
}

- (void)setCurrentChartTimeScope:(int64_t)a3
{
  self->_currentChartTimeScope = a3;
}

- (NSDateInterval)currentChartDateInterval
{
  return self->_currentChartDateInterval;
}

- (void)setCurrentChartDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (HKOverlayContextLocation)currentSelectedContextLocation
{
  return self->_currentSelectedContextLocation;
}

- (void)setCurrentSelectedContextLocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentSelectedContextLocation, a3);
}

- (HKDisplayTypeSectionedContextView)sectionedContextView
{
  return self->_sectionedContextView;
}

- (void)setSectionedContextView:(id)a3
{
  objc_storeStrong((id *)&self->_sectionedContextView, a3);
}

- (HKMaximumSizeView)singleContextMaximumSizeView
{
  return self->_singleContextMaximumSizeView;
}

- (void)setSingleContextMaximumSizeView:(id)a3
{
  objc_storeStrong((id *)&self->_singleContextMaximumSizeView, a3);
}

- (BOOL)userHasOverriddenPreferredOverlay
{
  return self->_userHasOverriddenPreferredOverlay;
}

- (void)setUserHasOverriddenPreferredOverlay:(BOOL)a3
{
  self->_userHasOverriddenPreferredOverlay = a3;
}

- (NSArray)overlayContextSectionContainers
{
  return self->_overlayContextSectionContainers;
}

- (void)setOverlayContextSectionContainers:(id)a3
{
  objc_storeStrong((id *)&self->_overlayContextSectionContainers, a3);
}

- (HKOverlayContextLocation)initialSelectedContextLocation
{
  return self->_initialSelectedContextLocation;
}

- (void)setInitialSelectedContextLocation:(id)a3
{
  objc_storeStrong((id *)&self->_initialSelectedContextLocation, a3);
}

- (OS_dispatch_queue)contextUpdateQueue
{
  return self->_contextUpdateQueue;
}

- (void)setContextUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_contextUpdateQueue, a3);
}

- (BOOL)showAllFiltersVisible
{
  return self->_showAllFiltersVisible;
}

- (void)setShowAllFiltersVisible:(BOOL)a3
{
  self->_showAllFiltersVisible = a3;
}

- (NSUserActivity)showAllFiltersActivity
{
  return self->_showAllFiltersActivity;
}

- (void)setShowAllFiltersActivity:(id)a3
{
  objc_storeStrong((id *)&self->_showAllFiltersActivity, a3);
}

- (HKOverlayContextLocation)restorationContextLocation
{
  return self->_restorationContextLocation;
}

- (void)setRestorationContextLocation:(id)a3
{
  objc_storeStrong((id *)&self->_restorationContextLocation, a3);
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (UIView)segmentedControlContainer
{
  return self->_segmentedControlContainer;
}

- (void)setSegmentedControlContainer:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControlContainer, a3);
}

- (int64_t)topLevelAxis
{
  return self->_topLevelAxis;
}

- (void)setTopLevelAxis:(int64_t)a3
{
  self->_topLevelAxis = a3;
}

- (UIView)topLevelChartView
{
  return self->_topLevelChartView;
}

- (NSLayoutConstraint)topLevelChartViewLeadingConstraint
{
  return self->_topLevelChartViewLeadingConstraint;
}

- (void)setTopLevelChartViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelChartViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)topLevelChartViewTrailingConstraint
{
  return self->_topLevelChartViewTrailingConstraint;
}

- (void)setTopLevelChartViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelChartViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)topLevelChartViewBottomConstraint
{
  return self->_topLevelChartViewBottomConstraint;
}

- (void)setTopLevelChartViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelChartViewBottomConstraint, a3);
}

- (UIView)topLevelOverlaysWithOptionalSegmentView
{
  return self->_topLevelOverlaysWithOptionalSegmentView;
}

- (NSLayoutConstraint)topLevelOverlaysWithOptionalSegmentViewLeadingConstraint
{
  return self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
}

- (void)setTopLevelOverlaysWithOptionalSegmentViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)topLevelOverlaysWithOptionalSegmentViewTrailingConstraint
{
  return self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
}

- (void)setTopLevelOverlaysWithOptionalSegmentViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)topLevelOverlaysWithOptionalSegmentViewTopConstraint
{
  return self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
}

- (void)setTopLevelOverlaysWithOptionalSegmentViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint, a3);
}

- (NSLayoutConstraint)topLevelOverlaysWithOptionalSegmentViewWidthConstraint
{
  return self->_topLevelOverlaysWithOptionalSegmentViewWidthConstraint;
}

- (void)setTopLevelOverlaysWithOptionalSegmentViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelOverlaysWithOptionalSegmentViewWidthConstraint, a3);
}

- (UIStackView)chartOverlayStackView
{
  return self->_chartOverlayStackView;
}

- (NSLayoutConstraint)chartControllerViewHeightConstraint
{
  return self->_chartControllerViewHeightConstraint;
}

- (void)setChartControllerViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_chartControllerViewHeightConstraint, a3);
}

- (NSLayoutConstraint)chartControllerViewToTopLevelChartViewBottomConstraint
{
  return self->_chartControllerViewToTopLevelChartViewBottomConstraint;
}

- (void)setChartControllerViewToTopLevelChartViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_chartControllerViewToTopLevelChartViewBottomConstraint, a3);
}

- (UIStackView)overlaysWithOptionalSegmentController
{
  return self->_overlaysWithOptionalSegmentController;
}

- (NSLayoutConstraint)overlaysWithOptionalSegmentLeadingConstraint
{
  return self->_overlaysWithOptionalSegmentLeadingConstraint;
}

- (void)setOverlaysWithOptionalSegmentLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_overlaysWithOptionalSegmentLeadingConstraint, a3);
}

- (NSLayoutConstraint)overlaysWithOptionalSegmentTrailingConstraint
{
  return self->_overlaysWithOptionalSegmentTrailingConstraint;
}

- (void)setOverlaysWithOptionalSegmentTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_overlaysWithOptionalSegmentTrailingConstraint, a3);
}

- (NSLayoutConstraint)overlaysWithOptionalSegmentTopConstraint
{
  return self->_overlaysWithOptionalSegmentTopConstraint;
}

- (void)setOverlaysWithOptionalSegmentTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_overlaysWithOptionalSegmentTopConstraint, a3);
}

- (NSTimer)defaultOverlayDeselectTimer
{
  return self->_defaultOverlayDeselectTimer;
}

- (void)setDefaultOverlayDeselectTimer:(id)a3
{
  objc_storeStrong((id *)&self->_defaultOverlayDeselectTimer, a3);
}

- (int64_t)previousHorizontalSizeClass
{
  return self->_previousHorizontalSizeClass;
}

- (void)setPreviousHorizontalSizeClass:(int64_t)a3
{
  self->_previousHorizontalSizeClass = a3;
}

- (int64_t)previousWidthDesignation
{
  return self->_previousWidthDesignation;
}

- (void)setPreviousWidthDesignation:(int64_t)a3
{
  self->_previousWidthDesignation = a3;
}

- (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, a3);
}

- (NSArray)previousStackHeights
{
  return self->_previousStackHeights;
}

- (void)setPreviousStackHeights:(id)a3
{
  objc_storeStrong((id *)&self->_previousStackHeights, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousStackHeights, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_defaultOverlayDeselectTimer, 0);
  objc_storeStrong((id *)&self->_overlaysWithOptionalSegmentTopConstraint, 0);
  objc_storeStrong((id *)&self->_overlaysWithOptionalSegmentTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_overlaysWithOptionalSegmentLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_overlaysWithOptionalSegmentController, 0);
  objc_storeStrong((id *)&self->_chartControllerViewToTopLevelChartViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_chartControllerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_chartOverlayStackView, 0);
  objc_storeStrong((id *)&self->_topLevelOverlaysWithOptionalSegmentViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_topLevelOverlaysWithOptionalSegmentView, 0);
  objc_storeStrong((id *)&self->_topLevelChartViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topLevelChartViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_topLevelChartViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_topLevelChartView, 0);
  objc_storeStrong((id *)&self->_segmentedControlContainer, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_restorationContextLocation, 0);
  objc_storeStrong((id *)&self->_showAllFiltersActivity, 0);
  objc_storeStrong((id *)&self->_contextUpdateQueue, 0);
  objc_storeStrong((id *)&self->_initialSelectedContextLocation, 0);
  objc_storeStrong((id *)&self->_overlayContextSectionContainers, 0);
  objc_storeStrong((id *)&self->_singleContextMaximumSizeView, 0);
  objc_storeStrong((id *)&self->_sectionedContextView, 0);
  objc_storeStrong((id *)&self->_currentSelectedContextLocation, 0);
  objc_storeStrong((id *)&self->_currentChartDateInterval, 0);
  objc_storeStrong((id *)&self->_factorDisplayTypes, 0);
  objc_storeStrong((id *)&self->_restorationUserActivity, 0);
  objc_storeStrong((id *)&self->_initialVisibleDateRange, 0);
  objc_storeStrong((id *)&self->_chartController, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_primaryDisplayType, 0);
  objc_storeStrong((id *)&self->_applicationItems, 0);
}

@end
