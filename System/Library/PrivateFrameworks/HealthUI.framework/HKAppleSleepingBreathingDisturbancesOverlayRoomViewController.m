@implementation HKAppleSleepingBreathingDisturbancesOverlayRoomViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  HKAppleSleepingBreathingDisturbancesOverlayRoomViewController *v19;

  v15 = a10;
  v16 = a8;
  v17 = a6;
  v18 = a5;
  v19 = -[HKAppleSleepingBreathingDisturbancesOverlayRoomViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:preferredOverlay:]([HKAppleSleepingBreathingDisturbancesOverlayRoomViewController alloc], "initWithDisplayDate:applicationItems:factorDisplayTypes:mode:preferredOverlay:", v17, v18, v15, 0, a7);

  -[HKOverlayRoomViewController setRestorationUserActivity:](v19, "setRestorationUserActivity:", v16);
  -[HKOverlayRoomViewController setAdditionalChartOptions:](v19, "setAdditionalChartOptions:", a11);
  return v19;
}

- (HKAppleSleepingBreathingDisturbancesOverlayRoomViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6 preferredOverlay:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  HKAppleSleepingBreathingDisturbancesOverlayRoomViewController *v17;
  HKAppleSleepingBreathingDisturbancesOverlayRoomViewController *v18;
  HKOverlayContextLocation *preferredContextLocation;
  void *v20;
  uint64_t v21;
  HKDisplayType *representativeDisplayType;
  _BOOL4 v23;
  _BOOL8 v24;
  objc_super v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (a7 && a7 != 11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAppleSleepingBreathingDisturbancesOverlayRoomViewController.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_HKAppleSleepingBreathingDisturbancesIsPreferredOverlaySupported(preferredOverlay)"));

  }
  v26.receiver = self;
  v26.super_class = (Class)HKAppleSleepingBreathingDisturbancesOverlayRoomViewController;
  v17 = -[HKOverlayRoomViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:](&v26, sel_initWithDisplayDate_applicationItems_factorDisplayTypes_mode_, v13, v14, v15, a6);
  v18 = v17;
  if (v17)
  {
    v17->_preferredOverlay = a7;
    preferredContextLocation = v17->_preferredContextLocation;
    v17->_preferredContextLocation = 0;

    objc_msgSend(v14, "displayTypeController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "displayTypeWithIdentifier:", &unk_1E9CED070);
    v21 = objc_claimAutoreleasedReturnValue();
    representativeDisplayType = v18->_representativeDisplayType;
    v18->_representativeDisplayType = (HKDisplayType *)v21;

    v23 = a6 != 3 && a7 != 0;
    if (a6)
      v24 = v23;
    else
      v24 = 0;
    -[HKOverlayRoomViewController setShouldSelectInitialOverlay:](v18, "setShouldSelectInitialOverlay:", v24);
  }

  return v18;
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

- (BOOL)supportsHealthFactors
{
  return 1;
}

- (BOOL)supportsShowAllFilters
{
  _BOOL4 v3;

  v3 = -[HKOverlayRoomViewController healthFactorsEnabled](self, "healthFactorsEnabled");
  if (v3)
    LOBYTE(v3) = -[HKOverlayRoomViewController controllerMode](self, "controllerMode") != 3;
  return v3;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  void *v3;
  void *v4;

  HKHealthKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SLEEP_BREATHING_DISTURBANCES"), &stru_1E9C4C428, CFSTR("Localizable-Nebula"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)createChartOverlayViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  HKInteractiveChartOverlayViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HKInteractiveChartOverlayViewController *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAppleSleepingBreathingDisturbancesOverlayRoomViewController _sleepApneaEventDisplayTypeWithApplicationItems:](self, "_sleepApneaEventDisplayTypeWithApplicationItems:", v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v4;
  -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hk_interactiveChartOptions");
  v9 = -[HKOverlayRoomViewController additionalChartOptions](self, "additionalChartOptions") | v8;

  if (-[HKOverlayRoomViewController controllerMode](self, "controllerMode") == 3)
    v10 = v9 | 0x12000;
  else
    v10 = v9;
  v11 = [HKInteractiveChartOverlayViewController alloc];
  +[HKInteractiveChartStackHeight percentStackHeights:](HKInteractiveChartStackHeight, "percentStackHeights:", &unk_1E9CEA6A0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "healthStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unitController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chartDataCacheController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeScopeController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sampleDateRangeController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HKInteractiveChartOverlayViewController initWithStackedDisplayTypes:primaryDisplayTypeStackIndex:stackedDisplayTypeHeights:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:timeScopeRanges:](v11, "initWithStackedDisplayTypes:primaryDisplayTypeStackIndex:stackedDisplayTypeHeights:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:timeScopeRanges:", v21, &unk_1E9CED088, v12, v13, v14, v15, v16, v17, v18, 0, 0, v10, 0);

  return v19;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8;
  id v9;
  HKAppleSleepingBreathingDisturbancesOverlayRoomViewController *v10;
  void *v11;
  HKAppleSleepingBreathingDisturbancesOverlayRoomViewController *v12;

  v8 = a5;
  v9 = a4;
  v10 = [HKAppleSleepingBreathingDisturbancesOverlayRoomViewController alloc];
  -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKAppleSleepingBreathingDisturbancesOverlayRoomViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:preferredOverlay:](v10, "initWithDisplayDate:applicationItems:factorDisplayTypes:mode:preferredOverlay:", v9, v8, v11, a3, -[HKAppleSleepingBreathingDisturbancesOverlayRoomViewController preferredOverlay](self, "preferredOverlay"));

  -[HKOverlayRoomViewController setAdditionalChartOptions:](v12, "setAdditionalChartOptions:", -[HKOverlayRoomViewController filteredInteractiveChartOptionsForMode:](self, "filteredInteractiveChartOptionsForMode:", a3));
  return v12;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  uint64_t v5;
  uint64_t v6;

  if (a3 != 3)
    return MEMORY[0x1E0C9AA60];
  -[HKAppleSleepingBreathingDisturbancesOverlayRoomViewController _overlayContextContainerWithApplicationItems:overlayChartController:mode:](self, "_overlayContextContainerWithApplicationItems:overlayChartController:mode:", a4, a5, 3, v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_overlayContextContainerWithApplicationItems:(id)a3 overlayChartController:(id)a4 mode:(int64_t)a5
{
  id v6;
  void *v7;
  HKOverlayContextSectionContainer *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKOverlayRoomViewController buildFactorContextSectionForChartController](self, "buildFactorContextSectionForChartController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "addObject:", v7);
  v8 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:]([HKOverlayContextSectionContainer alloc], "initWithContainerTitle:overlayContextSections:", 0, v6);
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKAppleSleepingBreathingDisturbancesOverlayRoomViewController setPreferredContextLocation:](self, "setPreferredContextLocation:", 0);
  return v9;
}

- (id)_chartDataSourceWithApplicationItems:(id)a3 displayType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HKQuantityTypeDataSource *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "unitController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "healthStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKQuantityTypeDataSource initWithUnitController:options:displayType:healthStore:]([HKQuantityTypeDataSource alloc], "initWithUnitController:options:displayType:healthStore:", v7, 2, v5, v8);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __114__HKAppleSleepingBreathingDisturbancesOverlayRoomViewController__chartDataSourceWithApplicationItems_displayType___block_invoke;
  v13[3] = &unk_1E9C43820;
  v14 = v9;
  v11 = v9;
  -[HKQuantityTypeDataSource setUserInfoCreationBlock:](v10, "setUserInfoCreationBlock:", v13);

  return v10;
}

HKInteractiveChartSinglePointData *__114__HKAppleSleepingBreathingDisturbancesOverlayRoomViewController__chartDataSourceWithApplicationItems_displayType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HKInteractiveChartSinglePointData *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = objc_alloc_init(HKInteractiveChartSinglePointData);
  objc_msgSend(v3, "averageQuantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
  -[HKInteractiveChartSinglePointData setValue:](v4, "setValue:");

  -[HKInteractiveChartSinglePointData setUnit:](v4, "setUnit:", *(_QWORD *)(a1 + 32));
  -[HKInteractiveChartSinglePointData setRecordCount:](v4, "setRecordCount:", objc_msgSend(v3, "recordCount"));
  objc_msgSend(v3, "statisticsInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartSinglePointData setStatisticsInterval:](v4, "setStatisticsInterval:", v6);
  return v4;
}

- (id)_sleepApneaEventDisplayTypeWithApplicationItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  HKSleepApneaEventInteractiveChartFormatter *v6;
  void *v7;
  void *v8;
  HKSleepApneaEventInteractiveChartFormatter *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKSleepApneaEventAxis *v14;
  HKInteractiveChartDisplayType *v15;
  void *v16;
  HKInteractiveChartDisplayType *v17;

  v3 = a3;
  objc_msgSend(v3, "displayTypeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayTypeWithIdentifier:", &unk_1E9CED0A0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [HKSleepApneaEventInteractiveChartFormatter alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_ALERTS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Nebula"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKSleepApneaEventInteractiveChartFormatter initWithLocalizedCategoryName:](v6, "initWithLocalizedCategoryName:", v8);

  objc_msgSend(v5, "displayCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unitController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chartDataCacheController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "hk_standardSeriesForTimeScope:displayCategory:unitController:dataCacheController:", 5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HKSleepApneaEventAxis initWithDisplayType:]([HKSleepApneaEventAxis alloc], "initWithDisplayType:", v5);
  objc_msgSend(v13, "setYAxis:", v14);

  v15 = [HKInteractiveChartDisplayType alloc];
  objc_msgSend(v5, "objectType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:](v15, "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v13, v5, v9, objc_msgSend(v16, "code"));

  return v17;
}

- (int64_t)preferredOverlay
{
  return self->_preferredOverlay;
}

- (HKOverlayContextLocation)preferredContextLocation
{
  return self->_preferredContextLocation;
}

- (void)setPreferredContextLocation:(id)a3
{
  objc_storeStrong((id *)&self->_preferredContextLocation, a3);
}

- (HKDisplayType)representativeDisplayType
{
  return self->_representativeDisplayType;
}

- (void)setRepresentativeDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_representativeDisplayType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representativeDisplayType, 0);
  objc_storeStrong((id *)&self->_preferredContextLocation, 0);
}

@end
