@implementation HKOverlayRoomCardioFitnessViewController

- (HKOverlayRoomCardioFitnessViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 preferredOverlay:(int64_t)a6 analyticsDelegate:(id)a7 interactiveChartOptions:(unint64_t)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  HKOverlayRoomCardioFitnessViewController *v24;
  NSMutableArray *v25;
  NSMutableArray *contextDelegates;
  HKOverlayContextLocation *preferredContextLocation;
  uint64_t v28;
  unsigned int v29;
  BOOL v30;
  void *v32;
  id v34;
  objc_super v35;

  v34 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a9;
  v19 = a10;
  if ((unint64_t)a6 > 0xB || ((1 << a6) & 0x9E1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomCardioFitnessViewController.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_isPreferredOverlaySupported(preferredOverlay)"));

  }
  +[HKOverlayRoomTrendContext findInitialDateFromTrendModel:](HKOverlayRoomTrendContext, "findInitialDateFromTrendModel:", v18);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  v22 = v34;
  if (v20)
    v22 = (void *)v20;
  v23 = v22;

  v35.receiver = self;
  v35.super_class = (Class)HKOverlayRoomCardioFitnessViewController;
  v24 = -[HKOverlayRoomViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:](&v35, sel_initWithDisplayDate_applicationItems_factorDisplayTypes_mode_, v23, v16, v19, a5);

  if (v24)
  {
    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    contextDelegates = v24->_contextDelegates;
    v24->_contextDelegates = v25;

    v24->_preferredOverlay = a6;
    preferredContextLocation = v24->_preferredContextLocation;
    v24->_preferredContextLocation = 0;

    objc_storeWeak((id *)&v24->_analyticsDelegate, v17);
    objc_storeStrong((id *)&v24->_trendModel, a9);
    if (a5 == 3)
    {
      v28 = 0;
    }
    else
    {
      v29 = objc_msgSend(v18, "selectTrendInitially");
      if (a5)
        v30 = a6 == 0;
      else
        v30 = 1;
      if (v30)
        v28 = v29;
      else
        v28 = 1;
    }
    -[HKOverlayRoomViewController setShouldSelectInitialOverlay:](v24, "setShouldSelectInitialOverlay:", v28);
    -[HKOverlayRoomViewController setAdditionalChartOptions:](v24, "setAdditionalChartOptions:", a8);
  }

  return v24;
}

- (id)createChartOverlayViewController
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HKInteractiveChartOverlayViewController *v22;
  void *v24;
  void *v25;
  HKInteractiveChartOverlayViewController *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  if (-[HKOverlayRoomViewController controllerMode](self, "controllerMode") != 3)
  {
    -[HKOverlayRoomCardioFitnessViewController trendModel](self, "trendModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[HKOverlayRoomTrendContext findStartingTimeScopeFromTrendModel:](HKOverlayRoomTrendContext, "findStartingTimeScopeFromTrendModel:", v3);

    if (v4 != 8)
    {
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeScopeController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSelectedTimeScope:", v4);

    }
  }
  -[HKOverlayRoomCardioFitnessViewController trendModel](self, "trendModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HKOverlayRoomCardioFitnessViewController trendModel](self, "trendModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "selectTrendInitially");

    if (v9)
      v10 = 73728;
    else
      v10 = 0x10000;
  }
  else
  {
    v10 = 0x10000;
  }

  -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hk_interactiveChartOptions");
  v27 = v10 | -[HKOverlayRoomViewController additionalChartOptions](self, "additionalChartOptions") | v12;

  v26 = [HKInteractiveChartOverlayViewController alloc];
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "healthStore");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "unitController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dateCache");
  v14 = objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "chartDataCacheController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeScopeController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sampleDateRangeController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController displayDate](self, "displayDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)v14;
  v22 = -[HKInteractiveChartOverlayViewController initWithHealthStore:primaryDisplayType:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:](v26, "initWithHealthStore:primaryDisplayType:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:", v31, v24, v13, v14, v15, v17, v19, v20, 0, v27);

  -[HKInteractiveChartViewController setCurrentValueViewDataSourceDelegate:](v22, "setCurrentValueViewDataSourceDelegate:", self);
  return v22;
}

- (BOOL)infographicSupportedForDisplayType:(id)a3 healthStore:(id)a4
{
  return 1;
}

- (id)infographicViewControllerForDisplayType:(id)a3 healthStore:(id)a4
{
  id v5;
  id v6;
  HKPopulationNormsChartViewController *v7;
  HKModalNavigationController *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[HKPopulationNormsChartViewController initWithDisplayType:healthStore:]([HKPopulationNormsChartViewController alloc], "initWithDisplayType:healthStore:", v6, v5);

  if (v7)
    v8 = -[HKModalNavigationController initWithRootViewController:]([HKModalNavigationController alloc], "initWithRootViewController:", v7);
  else
    v8 = 0;

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

- (id)controllerTitleWithApplicationItems:(id)a3
{
  void *v3;
  void *v4;

  HKHealthKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CARDIO_FITNESS"), &stru_1E9C4C428, CFSTR("Localizable-CardioFitness"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)showAllFiltersButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHOW_ALL_CARDIO_FITNESS_LEVELS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKChartCache *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HKCacheBackedChartSeriesDataSource *v20;
  HKInteractiveChartCardioFitnessFormatter *v21;
  HKInteractiveChartDisplayType *v22;
  void *v23;
  HKInteractiveChartDisplayType *v24;

  v4 = (void *)MEMORY[0x1E0CB6978];
  v5 = *MEMORY[0x1E0CB5DA0];
  v6 = a3;
  objc_msgSend(v4, "quantityTypeForIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayTypeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayTypeForObjectType:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomCardioFitnessViewController setRepresentativeDisplayType:](self, "setRepresentativeDisplayType:", v9);
  objc_msgSend(v9, "displayCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chartDataCacheController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_standardSeriesForTimeScope:displayCategory:unitController:dataCacheController:", 5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(HKChartCache);
  objc_msgSend(v6, "unitController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "healthStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cardioFitnessDataSourceWithUnitController:healthStore:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKChartCache setDataSource:](v14, "setDataSource:", v17);

  +[HKOutstandingFetchOperationManager sharedOperationManager](HKOutstandingFetchOperationManager, "sharedOperationManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKChartCache setOperationManager:](v14, "setOperationManager:", v18);

  objc_msgSend(v6, "chartDataCacheController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "addCustomChartCache:forDisplayType:", v14, v9);
  v20 = objc_alloc_init(HKCacheBackedChartSeriesDataSource);
  -[HKCacheBackedChartSeriesDataSource setChartCache:](v20, "setChartCache:", v14);
  objc_msgSend(v13, "setDataSource:", v20);
  v21 = objc_alloc_init(HKInteractiveChartCardioFitnessFormatter);
  v22 = [HKInteractiveChartDisplayType alloc];
  objc_msgSend(v9, "objectType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:](v22, "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v13, v9, v21, objc_msgSend(v23, "code"));

  return v24;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKOverlayContextSectionContainer *v11;
  void *v12;
  void *v13;
  HKOverlayContextSectionContainer *v14;
  HKOverlayContextSectionContainer **v15;
  HKOverlayContextSectionContainer *v16;
  void *v17;
  HKOverlayContextSectionContainer *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[HKOverlayRoomCardioFitnessViewController contextDelegates](self, "contextDelegates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3 != 3)
    {
      v17 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_7;
    }
    v16 = [HKOverlayContextSectionContainer alloc];
    -[HKOverlayRoomCardioFitnessViewController trendModel](self, "trendModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomCardioFitnessViewController _configureContextSectionsForFullMode:applicationItems:overlayChartController:trendModel:](self, "_configureContextSectionsForFullMode:applicationItems:overlayChartController:trendModel:", 3, v8, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v16, "initWithContainerTitle:overlayContextSections:", 0, v13);
    v19 = v14;
    v15 = &v19;
  }
  else
  {
    v11 = [HKOverlayContextSectionContainer alloc];
    -[HKOverlayRoomCardioFitnessViewController trendModel](self, "trendModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomCardioFitnessViewController _configureContextSectionsForSingleOverlayMode:applicationItems:overlayChartController:trendModel:](self, "_configureContextSectionsForSingleOverlayMode:applicationItems:overlayChartController:trendModel:", a3, v8, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v11, "initWithContainerTitle:overlayContextSections:", 0, v13);
    v20[0] = v14;
    v15 = (HKOverlayContextSectionContainer **)v20;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v17;
}

- (id)initialSelectedContextForMode:(int64_t)a3 containerIndex:(int64_t)a4
{
  void *v5;

  if (-[HKOverlayRoomViewController containerIndexForHealthFactors](self, "containerIndexForHealthFactors", a3) == a4)
  {
    v5 = 0;
  }
  else
  {
    -[HKOverlayRoomCardioFitnessViewController preferredContextLocation](self, "preferredContextLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8;
  id v9;
  int64_t preferredOverlay;
  unint64_t v12;
  HKOverlayRoomCardioFitnessViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  HKOverlayRoomCardioFitnessViewController *v17;

  v8 = a4;
  v9 = a5;
  preferredOverlay = self->_preferredOverlay;
  if (preferredOverlay == 11 || preferredOverlay == 0)
    preferredOverlay = -[HKOverlayRoomCardioFitnessViewController _preferredOverlayForCardioFitnessLevel:](self, "_preferredOverlayForCardioFitnessLevel:", -[HKCardioFitnessLevelData cardioFitnessLevel](self->_initialCardioFitnessLevelData, "cardioFitnessLevel"));
  v12 = -[HKOverlayRoomViewController filteredInteractiveChartOptionsForMode:](self, "filteredInteractiveChartOptionsForMode:", a3);
  v13 = [HKOverlayRoomCardioFitnessViewController alloc];
  -[HKOverlayRoomCardioFitnessViewController analyticsDelegate](self, "analyticsDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomCardioFitnessViewController trendModel](self, "trendModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HKOverlayRoomCardioFitnessViewController initWithDisplayDate:applicationItems:mode:preferredOverlay:analyticsDelegate:interactiveChartOptions:trendModel:factorDisplayTypes:](v13, "initWithDisplayDate:applicationItems:mode:preferredOverlay:analyticsDelegate:interactiveChartOptions:trendModel:factorDisplayTypes:", v8, v9, a3, preferredOverlay, v14, v12, v15, v16);

  return v17;
}

- (void)didChangeFromContextItem:(id)a3 toContextItem:(id)a4
{
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v13 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  if (v13 | v6)
  {
    objc_msgSend((id)v13, "analyticsIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "analyticsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      -[HKOverlayRoomCardioFitnessViewController analyticsDelegate](self, "analyticsDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v13, "analyticsIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v6, "analyticsIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "didChangeFromOverlayWithIdentifier:toOverlayWithIdentifier:", v11, v12);

    }
  }

}

- (void)contextDidUpdate:(id)a3 withCardioFitnessLevelData:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[HKOverlayRoomCardioFitnessViewController initialCardioFitnessLevelData](self, "initialCardioFitnessLevelData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[HKOverlayRoomCardioFitnessViewController setInitialCardioFitnessLevelData:](self, "setInitialCardioFitnessLevelData:", v6);
    -[HKOverlayRoomViewController setShouldSelectInitialOverlay:](self, "setShouldSelectInitialOverlay:", 1);
    -[HKOverlayRoomViewController reloadOverlayContextItems](self, "reloadOverlayContextItems");
  }

}

- (id)_configureContextSectionsForSingleOverlayMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 trendModel:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  _HKCardioFitnessClassificationContext *v15;
  int64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _HKCardioFitnessLevelContext *v20;
  void *v21;
  _HKCardioFitnessLevelContext *v22;
  HKOverlayContextLocation *v23;
  HKOverlayContextSection *v24;
  void *v25;
  HKOverlayContextSection *v26;
  void *v27;
  HKOverlayContextSection *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  -[HKOverlayRoomCardioFitnessViewController trendModel](self, "trendModel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[HKOverlayRoomCardioFitnessViewController trendModel](self, "trendModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "selectTrendInitially");

    if (v14)
    {
      -[HKOverlayRoomCardioFitnessViewController _buildTrendContextFromApplicationItems:overlayChartController:overlayMode:](self, "_buildTrendContextFromApplicationItems:overlayChartController:overlayMode:", v9, v10, a3);
      v15 = (_HKCardioFitnessClassificationContext *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      v22 = (_HKCardioFitnessLevelContext *)v15;
      goto LABEL_12;
    }
  }
  v16 = -[HKOverlayRoomCardioFitnessViewController preferredOverlay](self, "preferredOverlay");
  if (v16 == 11 || !v16)
  {
    -[HKOverlayRoomCardioFitnessViewController initialCardioFitnessLevelData](self, "initialCardioFitnessLevelData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v15 = -[_HKCardioFitnessClassificationContext initWithMode:applicationItems:overlayChartController:delegate:]([_HKCardioFitnessClassificationContext alloc], "initWithMode:applicationItems:overlayChartController:delegate:", a3, v9, v10, self);
      goto LABEL_11;
    }
  }
  v18 = -[HKOverlayRoomCardioFitnessViewController _cardioFitnessLevelForPreferredOverlay:](self, "_cardioFitnessLevelForPreferredOverlay:", -[HKOverlayRoomCardioFitnessViewController preferredOverlay](self, "preferredOverlay"));
  if (v18 == -1)
  {
    -[HKOverlayRoomCardioFitnessViewController initialCardioFitnessLevelData](self, "initialCardioFitnessLevelData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "cardioFitnessLevel");

  }
  v20 = [_HKCardioFitnessLevelContext alloc];
  -[HKOverlayRoomCardioFitnessViewController representativeDisplayType](self, "representativeDisplayType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[_HKCardioFitnessLevelContext initWithMode:applicationItems:overlayChartController:baseDisplayType:cardioFitnessLevel:](v20, "initWithMode:applicationItems:overlayChartController:baseDisplayType:cardioFitnessLevel:", a3, v9, v10, v21, v18);

LABEL_12:
  v23 = -[HKOverlayContextLocation initWithContainerIndex:sectionIndex:itemIndex:]([HKOverlayContextLocation alloc], "initWithContainerIndex:sectionIndex:itemIndex:", 0, 0, 0);
  -[HKOverlayRoomCardioFitnessViewController setPreferredContextLocation:](self, "setPreferredContextLocation:", v23);

  v24 = [HKOverlayContextSection alloc];
  v30[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[HKOverlayContextSection initWithSectionTitle:overlayContextItems:](v24, "initWithSectionTitle:overlayContextItems:", 0, v25);

  v29 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)_configureContextSectionsForFullMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 trendModel:(id)a6
{
  id v10;
  id v11;
  int64_t v12;
  _HKCardioFitnessLevelContext *v13;
  uint64_t i;
  _HKCardioFitnessLevelContext *v15;
  void *v16;
  _HKCardioFitnessLevelContext *v17;
  _HKCardioFitnessLevelContext *v18;
  void *v19;
  HKOverlayContextSection *v20;
  void *v21;
  HKOverlayContextSection *v22;
  void *v23;
  void *v24;
  HKOverlayContextSection *v25;
  HKOverlayContextLocation *v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  HKOverlayContextLocation *v30;
  void *v31;
  HKOverlayContextSection **v32;
  uint64_t v33;
  void *v34;
  id v36;
  id v37;
  HKOverlayContextSection *v38;
  _QWORD v39[2];
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v37 = a4;
  v10 = a5;
  v36 = a6;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = -[HKOverlayRoomCardioFitnessViewController _cardioFitnessLevelForPreferredOverlay:](self, "_cardioFitnessLevelForPreferredOverlay:", -[HKOverlayRoomCardioFitnessViewController preferredOverlay](self, "preferredOverlay"));
  v13 = 0;
  for (i = 3; i != -1; --i)
  {
    v15 = [_HKCardioFitnessLevelContext alloc];
    -[HKOverlayRoomCardioFitnessViewController representativeDisplayType](self, "representativeDisplayType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[_HKCardioFitnessLevelContext initWithMode:applicationItems:overlayChartController:baseDisplayType:cardioFitnessLevel:](v15, "initWithMode:applicationItems:overlayChartController:baseDisplayType:cardioFitnessLevel:", a3, v37, v10, v16, i);

    objc_msgSend(v11, "addObject:", v17);
    if (v12 == i)
    {
      v18 = v17;

      v13 = v18;
    }

  }
  if (v36)
  {
    -[HKOverlayRoomCardioFitnessViewController _buildTrendContextFromApplicationItems:overlayChartController:overlayMode:](self, "_buildTrendContextFromApplicationItems:overlayChartController:overlayMode:", v37, v10, a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = [HKOverlayContextSection alloc];
    v40[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HKOverlayContextSection initWithSectionTitle:overlayContextItems:](v20, "initWithSectionTitle:overlayContextItems:", 0, v21);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CARDIO_FITNESS_LEVELS_VIEW_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-CardioFitness"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
    v24 = 0;
  }
  v25 = -[HKOverlayContextSection initWithSectionTitle:overlayContextItems:]([HKOverlayContextSection alloc], "initWithSectionTitle:overlayContextItems:", v24, v11);
  if (v13)
  {
    if (v36 && objc_msgSend(v36, "selectTrendInitially"))
    {
      v26 = [HKOverlayContextLocation alloc];
      v27 = 0;
      v28 = 0;
    }
    else
    {
      v29 = objc_msgSend(v11, "indexOfObject:", v13);
      v26 = [HKOverlayContextLocation alloc];
      v27 = v22 != 0;
      v28 = v29;
    }
    v30 = -[HKOverlayContextLocation initWithContainerIndex:sectionIndex:itemIndex:](v26, "initWithContainerIndex:sectionIndex:itemIndex:", 0, v27, v28);
    -[HKOverlayRoomCardioFitnessViewController setPreferredContextLocation:](self, "setPreferredContextLocation:", v30);

  }
  if (v22)
  {
    v39[0] = v22;
    v39[1] = v25;
    v31 = (void *)MEMORY[0x1E0C99D20];
    v32 = (HKOverlayContextSection **)v39;
    v33 = 2;
  }
  else
  {
    v38 = v25;
    v31 = (void *)MEMORY[0x1E0C99D20];
    v32 = &v38;
    v33 = 1;
  }
  objc_msgSend(v31, "arrayWithObjects:count:", v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (id)_buildTrendContextFromApplicationItems:(id)a3 overlayChartController:(id)a4 overlayMode:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  HKOverlayRoomTrendContext *v11;
  void *v12;
  HKOverlayRoomTrendContext *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  -[HKOverlayRoomCardioFitnessViewController primaryDisplayTypeWithApplicationItems:](self, "primaryDisplayTypeWithApplicationItems:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [HKOverlayRoomTrendContext alloc];
  -[HKOverlayRoomCardioFitnessViewController trendModel](self, "trendModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKOverlayRoomTrendContext initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:](v11, "initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:", v10, v12, v8, v9, a5);

  -[HKOverlayRoomViewController chartController](self, "chartController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTrendAccessibilityDelegate:", v13);

  return v13;
}

- (id)_buildCardioFitnessLevelDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5 cardioFitnessLevel:(int64_t)a6
{
  void *v7;
  HKInteractiveChartOverlayNamedDataSource *v8;
  void *v9;
  HKInteractiveChartOverlayNamedDataSource *v10;
  _QWORD v12[5];

  objc_msgSend(a4, "cardioFitnessDataSourceWithUnitController:healthStore:", a3, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [HKInteractiveChartOverlayNamedDataSource alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HKCardioFitnessLevel_%ld"), a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __140__HKOverlayRoomCardioFitnessViewController__buildCardioFitnessLevelDataSourceWithUnitController_displayType_healthStore_cardioFitnessLevel___block_invoke;
  v12[3] = &__block_descriptor_40_e18___NSString_16__0q8l;
  v12[4] = a6;
  v10 = -[HKInteractiveChartOverlayNamedDataSource initWithDataSource:named:withContextTitleForTimeScope:](v8, "initWithDataSource:named:withContextTitleForTimeScope:", v7, v9, v12);

  return v10;
}

id __140__HKOverlayRoomCardioFitnessViewController__buildCardioFitnessLevelDataSourceWithUnitController_displayType_healthStore_cardioFitnessLevel___block_invoke(uint64_t a1)
{
  return +[HKCardioFitnessUtilities localizedStringForCardioFitnessTitle:](HKCardioFitnessUtilities, "localizedStringForCardioFitnessTitle:", *(_QWORD *)(a1 + 32));
}

- (int64_t)_cardioFitnessLevelForPreferredOverlay:(int64_t)a3
{
  if ((unint64_t)(a3 - 5) >= 4)
    return -1;
  else
    return 8 - a3;
}

- (int64_t)_preferredOverlayForCardioFitnessLevel:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
    return 0;
  else
    return 8 - a3;
}

- (NSMutableArray)contextDelegates
{
  return self->_contextDelegates;
}

- (void)setContextDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_contextDelegates, a3);
}

- (int64_t)preferredOverlay
{
  return self->_preferredOverlay;
}

- (HKCardioFitnessLevelData)initialCardioFitnessLevelData
{
  return self->_initialCardioFitnessLevelData;
}

- (void)setInitialCardioFitnessLevelData:(id)a3
{
  objc_storeStrong((id *)&self->_initialCardioFitnessLevelData, a3);
}

- (HKDisplayType)representativeDisplayType
{
  return self->_representativeDisplayType;
}

- (void)setRepresentativeDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_representativeDisplayType, a3);
}

- (HKOverlayRoomCardioFitnessViewControllerAnalyticsDelegate)analyticsDelegate
{
  return (HKOverlayRoomCardioFitnessViewControllerAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (HKOverlayContextLocation)preferredContextLocation
{
  return self->_preferredContextLocation;
}

- (void)setPreferredContextLocation:(id)a3
{
  objc_storeStrong((id *)&self->_preferredContextLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContextLocation, 0);
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_representativeDisplayType, 0);
  objc_storeStrong((id *)&self->_initialCardioFitnessLevelData, 0);
  objc_storeStrong((id *)&self->_contextDelegates, 0);
}

@end
