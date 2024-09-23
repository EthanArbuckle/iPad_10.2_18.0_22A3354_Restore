@implementation HKHealthChartFactory

- (void)encodeActivityChartDataForActivityMoveMode:(int64_t)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  HKRemoteDateIntervals *v7;
  void *v8;
  HKRemoteDateIntervals *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *context;
  id v19;

  v19 = a4;
  context = (void *)MEMORY[0x1D829F904]();
  -[HKHealthChartFactory displayTypeController](self, "displayTypeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayTypeWithIdentifier:", &unk_1E9CEABB0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [HKRemoteDateIntervals alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKRemoteDateIntervals initWithDisplayType:fromEndDate:](v7, "initWithDisplayType:fromEndDate:", v6, v8);

  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRemoteDateIntervals dateIntervalForTimeScope:withGregorianCalendar:error:](v9, "dateIntervalForTimeScope:withGregorianCalendar:error:", 4, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRemoteDateIntervals dateIntervalForTimeScope:withGregorianCalendar:error:](v9, "dateIntervalForTimeScope:withGregorianCalendar:error:", 3, v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory healthStore](self, "healthStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory dateCache](self, "dateCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory displayTypeController](self, "displayTypeController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory unitPreferenceController](self, "unitPreferenceController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKInteractiveChartActivityController encodeChartDataWithHealthStore:dateCache:displayTypeController:unitController:activityMoveMode:monthDateInterval:sixMonthDateInterval:completion:](HKInteractiveChartActivityController, "encodeChartDataWithHealthStore:dateCache:displayTypeController:unitController:activityMoveMode:monthDateInterval:sixMonthDateInterval:completion:", v13, v14, v15, v16, a3, v11, v12, v19);

  objc_autoreleasePoolPop(context);
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
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

- (HKHealthChartFactory)initWithHealthStore:(id)a3
{
  id v5;
  HKHealthChartFactory *v6;
  HKHealthChartFactory *v7;
  uint64_t v8;
  HKDisplayTypeController *displayTypeController;
  void *v10;
  void *v11;
  uint64_t v12;
  HKUnitPreferenceController *v13;
  HKUnitPreferenceController *unitPreferenceController;
  uint64_t v15;
  HKUnitPreferenceController *v16;
  HKUnitPreferenceController *v17;
  HKSampleTypeUpdateController *v18;
  HKSampleTypeUpdateController *sampleTypeUpdateController;
  HKChartDataCacheController *v20;
  HKChartDataCacheController *chartDataCacheController;
  HKDateCache *v22;
  void *v23;
  uint64_t v24;
  HKDateCache *dateCache;
  HKSelectedTimeScopeController *v26;
  HKSelectedTimeScopeController *selectedTimeScopeController;
  uint64_t v28;
  _HKWheelchairUseCharacteristicCache *wheelchairUseCharacteristicCache;
  HKSampleTypeDateRangeController *v30;
  HKSampleTypeDateRangeController *sampleTypeDateRangeController;
  HKSleepDataSourceProvider *sleepDataSourceProvider;
  HKInteractiveChartDataFormatter *sleepChartFormatter;
  NSMutableDictionary *v34;
  NSMutableDictionary *customViewControllerProvidersByTypeIdentifier;
  objc_super v37;

  v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)HKHealthChartFactory;
  v6 = -[HKHealthChartFactory init](&v37, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    displayTypeController = v7->_displayTypeController;
    v7->_displayTypeController = (HKDisplayTypeController *)v8;

    objc_msgSend(v5, "profileIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "type") == 2)
    {

    }
    else
    {
      objc_msgSend(v5, "profileIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "type");

      if (v12 != 3)
      {
        v17 = -[HKUnitPreferenceController initWithHealthStore:]([HKUnitPreferenceController alloc], "initWithHealthStore:", v5);
        unitPreferenceController = v7->_unitPreferenceController;
        v7->_unitPreferenceController = v17;
        goto LABEL_7;
      }
    }
    v13 = [HKUnitPreferenceController alloc];
    unitPreferenceController = (HKUnitPreferenceController *)objc_alloc_init(MEMORY[0x1E0CB6780]);
    v15 = -[HKUnitPreferenceController initWithHealthStore:](v13, "initWithHealthStore:", unitPreferenceController);
    v16 = v7->_unitPreferenceController;
    v7->_unitPreferenceController = (HKUnitPreferenceController *)v15;

LABEL_7:
    v18 = -[HKSampleTypeUpdateController initWithHealthStore:]([HKSampleTypeUpdateController alloc], "initWithHealthStore:", v5);
    sampleTypeUpdateController = v7->_sampleTypeUpdateController;
    v7->_sampleTypeUpdateController = v18;

    v20 = -[HKChartDataCacheController initWithHealthStore:unitController:updateController:]([HKChartDataCacheController alloc], "initWithHealthStore:unitController:updateController:", v5, v7->_unitPreferenceController, v7->_sampleTypeUpdateController);
    chartDataCacheController = v7->_chartDataCacheController;
    v7->_chartDataCacheController = v20;

    v22 = [HKDateCache alloc];
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HKDateCache initWithCalendar:](v22, "initWithCalendar:", v23);
    dateCache = v7->_dateCache;
    v7->_dateCache = (HKDateCache *)v24;

    v26 = objc_alloc_init(HKSelectedTimeScopeController);
    selectedTimeScopeController = v7->_selectedTimeScopeController;
    v7->_selectedTimeScopeController = v26;

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB7038]), "initWithHealthStore:", v5);
    wheelchairUseCharacteristicCache = v7->_wheelchairUseCharacteristicCache;
    v7->_wheelchairUseCharacteristicCache = (_HKWheelchairUseCharacteristicCache *)v28;

    v30 = -[HKSampleTypeDateRangeController initWithHealthStore:]([HKSampleTypeDateRangeController alloc], "initWithHealthStore:", v5);
    sampleTypeDateRangeController = v7->_sampleTypeDateRangeController;
    v7->_sampleTypeDateRangeController = v30;

    sleepDataSourceProvider = v7->_sleepDataSourceProvider;
    v7->_sleepDataSourceProvider = 0;

    sleepChartFormatter = v7->_sleepChartFormatter;
    v7->_sleepChartFormatter = 0;

    v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    customViewControllerProvidersByTypeIdentifier = v7->_customViewControllerProvidersByTypeIdentifier;
    v7->_customViewControllerProvidersByTypeIdentifier = v34;

    v7->_turnOffInitialSelectionForTesting = 0;
  }

  return v7;
}

- (void)setSleepDataSourceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sleepDataSourceProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wheelchairUseCharacteristicCache, 0);
  objc_storeStrong((id *)&self->_addDataViewControllerProvider, 0);
  objc_storeStrong((id *)&self->_sleepChartFormatter, 0);
  objc_storeStrong((id *)&self->_sleepDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_selectedTimeScopeController, 0);
  objc_storeStrong((id *)&self->_sampleTypeDateRangeController, 0);
  objc_storeStrong((id *)&self->_sampleTypeUpdateController, 0);
  objc_storeStrong((id *)&self->_chartDataCacheController, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_customViewControllerProvidersByTypeIdentifier, 0);
}

- (HKHealthChartFactory)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (id)chartForTypeIdentifier:(id)a3 dateRange:(id)a4 minimumSize:(CGSize)a5
{
  double height;
  double width;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  height = a5.height;
  width = a5.width;
  v9 = (void *)MEMORY[0x1E0C99D48];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory chartForTypeIdentifier:dateRange:minimumSize:disableXAxis:currentCalendar:](self, "chartForTypeIdentifier:dateRange:minimumSize:disableXAxis:currentCalendar:", v11, v10, 0, v12, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)chartForTypeIdentifier:(id)a3 dateRange:(id)a4 minimumSize:(CGSize)a5 disableXAxis:(BOOL)a6 currentCalendar:(id)a7
{
  _BOOL4 v8;
  double height;
  double width;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  uint64_t v23;
  _HKStaticDateGraphViewController *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v32;
  id v33;
  _QWORD v34[2];

  v8 = a6;
  height = a5.height;
  width = a5.width;
  v34[1] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a7;
  -[HKHealthChartFactory standardChartDisplayTypeIdentifierForTypeIdentifier:](self, "standardChartDisplayTypeIdentifierForTypeIdentifier:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[HKHealthChartFactory displayTypeController](self, "displayTypeController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "displayTypeWithIdentifier:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v32 = v8;
      v18 = objc_msgSend(v14, "firstWeekday");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v13, "startDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "endDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        HKUIMidDate(v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = +[HKGraphZoomLevelConfiguration timeScopeForDateRange:](HKGraphZoomLevelConfiguration, "timeScopeForDateRange:", v13);
        v23 = 1;
      }
      else
      {
        v22 = 6;
        v23 = 3;
        v21 = v33;
      }
      +[HKGraphZoomLevelConfiguration chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:](HKGraphZoomLevelConfiguration, "chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:", v22, v21, v23, 0, v14, v18, 0, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", objc_msgSend(v17, "categoryIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthChartFactory unitPreferenceController](self, "unitPreferenceController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthChartFactory chartDataCacheController](self, "chartDataCacheController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hk_standardSeriesForTimeScope:displayCategory:unitController:dataCacheController:", v22, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = -[_HKStaticDateGraphViewController initWithFixedRange:currentCalendar:]([_HKStaticDateGraphViewController alloc], "initWithFixedRange:currentCalendar:", v25, v14);
      -[HKDateGraphViewController setMinimumSize:](v24, "setMinimumSize:", width, height);
      v34[0] = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKStaticDateGraphViewController addStackedSeries:](v24, "addStackedSeries:", v30);

      -[HKDateGraphViewController setDisableXAxis:](v24, "setDisableXAxis:", v32);
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)interactiveChartForTypeIdentifier:(id)a3 preferredOverlay:(int64_t)a4 displayDateInterval:(id)a5 restorationUserActivity:(id)a6 chartSummaryTrendModel:(id)a7
{
  return -[HKHealthChartFactory interactiveChartForTypeIdentifier:preferredOverlay:chartOptions:displayDateInterval:restorationUserActivity:chartSummaryTrendModel:](self, "interactiveChartForTypeIdentifier:preferredOverlay:chartOptions:displayDateInterval:restorationUserActivity:chartSummaryTrendModel:", a3, a4, 0, a5, a6, a7);
}

- (id)interactiveChartForTypeIdentifier:(id)a3 preferredOverlay:(int64_t)a4 chartOptions:(unint64_t)a5 displayDateInterval:(id)a6 restorationUserActivity:(id)a7 chartSummaryTrendModel:(id)a8
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _BOOL4 v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  id v33;
  void *v34;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v33 = a8;
  objc_msgSend(v13, "endDate");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = -[HKHealthChartFactory _resolvedTimeScopeForTypeIdentifier:displayDateInterval:](self, "_resolvedTimeScopeForTypeIdentifier:displayDateInterval:", v12, v13);
  -[HKHealthChartFactory selectedTimeScopeController](self, "selectedTimeScopeController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSelectedTimeScope:", v16);

  -[HKHealthChartFactory _buildApplicationItems](self, "_buildApplicationItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("HKOverlayRoomViewControllerRestorationModeKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v15;
  if (v20)
    v21 = 0;
  else
    v21 = (void *)v15;
  v22 = v21;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_customViewControllerProvidersByTypeIdentifier, "objectForKeyedSubscript:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    -[HKHealthChartFactory chartFactoryViewControllerProviderForType:standardProvider:](self, "chartFactoryViewControllerProviderForType:standardProvider:", v12, self);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = -[HKHealthChartFactory turnOffInitialSelectionForTesting](self, "turnOffInitialSelectionForTesting");
  if (v24)
    v25 = a5 | 0x2000;
  else
    v25 = a5;
  if (v24 && a4 == 11)
    v26 = 0;
  else
    v26 = a4;
  v27 = v25 | -[HKHealthChartFactory _additionalChartOptionsForDisplayDate:displayDateInterval:timeScope:](self, "_additionalChartOptionsForDisplayDate:displayDateInterval:timeScope:", v22, v13, v16);
  -[HKHealthChartFactory _factorDisplayTypesForPrimaryTypeIdentifier:](self, "_factorDisplayTypesForPrimaryTypeIdentifier:", v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory _logFactorsForTypeIdentifier:factorDisplayTypes:](self, "_logFactorsForTypeIdentifier:factorDisplayTypes:", v12, v28);
  objc_msgSend(v23, "createInteractiveChartViewControllerForTypeIdentifier:chartFactory:applicationItems:displayDate:preferredOverlay:restorationUserActivity:trendModel:factorDisplayTypes:additionalChartOptions:", v12, self, v18, v22, v26, v14, v33, v28, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (void)_logFactorsForTypeIdentifier:(id)a3 factorDisplayTypes:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "hk_map:", &__block_literal_global_2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB5378];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1D7813000, v8, OS_LOG_TYPE_INFO, "Factors for %@: [%@]", (uint8_t *)&v9, 0x16u);
  }

}

uint64_t __72__HKHealthChartFactory__logFactorsForTypeIdentifier_factorDisplayTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "displayTypeIdentifierString");
}

- (unint64_t)_additionalChartOptionsForDisplayDate:(id)a3 displayDateInterval:(id)a4 timeScope:(int64_t)a5
{
  unint64_t v5;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = 0;
  if (a3 && a5 == 4)
  {
    v7 = (void *)MEMORY[0x1E0C99D48];
    v8 = a4;
    v9 = a3;
    objc_msgSend(v7, "hk_gregorianCalendarWithLocalTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rangeOfUnit:inUnit:forDate:", 16, 8, v9);
    v12 = v11;
    objc_msgSend(v10, "hk_startOfMonthForDate:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "components:fromDate:", 30, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "components:fromDate:", 30, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "components:fromDate:", 30, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v19, "setDay:", v12);
    if (objc_msgSend(v15, "isEqual:", v18))
    {
      if (objc_msgSend(v17, "isEqual:", v19))
        v5 = 0x100000;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)_remoteChartDisplayTypeForTypeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  HKDisplayTypeController *displayTypeController;
  void *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKHealthChartFactory standardChartDisplayTypeIdentifierForTypeIdentifier:](self, "standardChartDisplayTypeIdentifierForTypeIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HKHealthChartFactory displayTypeController](self, "displayTypeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayTypeWithIdentifier:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1D7813000, v8, OS_LOG_TYPE_INFO, "Falling back to default chart for %@", (uint8_t *)&v12, 0xCu);
    }
    displayTypeController = self->_displayTypeController;
    objc_msgSend(MEMORY[0x1E0CB6978], "_typeWithIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeController displayTypeForObjectType:](displayTypeController, "displayTypeForObjectType:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;

  return v10;
}

- (id)_remoteDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4
{
  return -[HKHealthChartFactory _remoteDataSourcesForDisplayType:forTimeScopes:audience:](self, "_remoteDataSourcesForDisplayType:forTimeScopes:audience:", a3, a4, 0);
}

- (id)_remoteDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4 audience:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "displayTypeIdentifier");
  if (v11 == 276)
  {
    -[HKHealthChartFactory _sleepApneaRemoteDataSourcesForDisplayType:forTimeScopes:](self, "_sleepApneaRemoteDataSourcesForDisplayType:forTimeScopes:", v8, v9);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else if (v11 == 124)
  {
    -[HKHealthChartFactory _cardioFitnessDataSourcesForDisplayType:forTimeScopes:](self, "_cardioFitnessDataSourcesForDisplayType:forTimeScopes:", v8, v9);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v11 == 63)
      -[HKHealthChartFactory _sleepRemoteDataSourcesForDisplayType:forTimeScopes:audience:](self, "_sleepRemoteDataSourcesForDisplayType:forTimeScopes:audience:", v8, v9, v10);
    else
      -[HKHealthChartFactory _defaultRemoteDataSourcesForDisplayType:forTimeScopes:](self, "_defaultRemoteDataSourcesForDisplayType:forTimeScopes:", v8, v9);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
}

- (id)_sleepRemoteDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4 audience:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  os_log_t *v22;
  uint64_t i;
  void *v24;
  id v26;
  id v27;
  char v28;
  _BYTE v29[15];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HKHealthChartFactory sleepDataSourceProvider](self, "sleepDataSourceProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v16 = -[_HKRemoteDataSources initSupportsChartQueryDataGeneration:]([_HKRemoteDataSources alloc], "initSupportsChartQueryDataGeneration:", 0);
    goto LABEL_22;
  }
  v27 = v8;
  if (!v10 || (v12 = objc_msgSend(v10, "integerValue"), v12 == 1))
  {
    -[HKHealthChartFactory sleepDataSourceProvider](self, "sleepDataSourceProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthChartFactory healthStore](self, "healthStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "makeSleepDataSourceFromHealthStore:representativeDisplayType:", v14, v8);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v12)
    {
      v17 = 0;
      goto LABEL_10;
    }
    -[HKHealthChartFactory sleepDataSourceProvider](self, "sleepDataSourceProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthChartFactory healthStore](self, "healthStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "makeSleepStagesDataSourceFromHealthStore:representativeDisplayType:", v14, v8);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v15;

LABEL_10:
  v16 = -[_HKRemoteDataSources initSupportsChartQueryDataGeneration:]([_HKRemoteDataSources alloc], "initSupportsChartQueryDataGeneration:", 1);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v26 = v9;
  v18 = v9;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v31;
    v22 = (os_log_t *)MEMORY[0x1E0CB5378];
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v24, "integerValue", v26) > 7)
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
            -[HKHealthChartFactory _sleepRemoteDataSourcesForDisplayType:forTimeScopes:audience:].cold.1(&v28, v29);
        }
        else
        {
          objc_msgSend(v16, "setDataSource:forTimeScope:", v17, objc_msgSend(v24, "integerValue"));
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v20);
  }

  v9 = v26;
  v8 = v27;
LABEL_22:

  return v16;
}

- (id)_cardioFitnessDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4
{
  id v6;
  id v7;
  HKRemoteCardioFitnessDataSource *v8;
  void *v9;
  void *v10;
  HKRemoteCardioFitnessDataSource *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_log_t *v17;
  uint64_t i;
  void *v19;
  char v21;
  _BYTE v22[15];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = [HKRemoteCardioFitnessDataSource alloc];
  -[HKHealthChartFactory unitPreferenceController](self, "unitPreferenceController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory healthStore](self, "healthStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKRemoteCardioFitnessDataSource initWithUnitController:displayType:healthStore:](v8, "initWithUnitController:displayType:healthStore:", v9, v6, v10);

  v12 = -[_HKRemoteDataSources initSupportsChartQueryDataGeneration:]([_HKRemoteDataSources alloc], "initSupportsChartQueryDataGeneration:", 1);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    v17 = (os_log_t *)MEMORY[0x1E0CB5378];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v19, "integerValue") > 7)
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
            -[HKHealthChartFactory _cardioFitnessDataSourcesForDisplayType:forTimeScopes:].cold.1(&v21, v22);
        }
        else
        {
          objc_msgSend(v12, "setDataSource:forTimeScope:", v11, objc_msgSend(v19, "integerValue"));
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  return v12;
}

- (id)_sleepApneaRemoteDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4
{
  id v6;
  id v7;
  HKRemoteNotificationLevelCategoryDataSource *v8;
  void *v9;
  HKRemoteNotificationLevelCategoryDataSource *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  os_log_t *v16;
  uint64_t i;
  void *v18;
  char v20;
  _BYTE v21[15];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = [HKRemoteNotificationLevelCategoryDataSource alloc];
  -[HKHealthChartFactory healthStore](self, "healthStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKRemoteNotificationLevelCategoryDataSource initWithDisplayType:healthStore:](v8, "initWithDisplayType:healthStore:", v6, v9);

  v11 = -[_HKRemoteDataSources initSupportsChartQueryDataGeneration:]([_HKRemoteDataSources alloc], "initSupportsChartQueryDataGeneration:", 1);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    v16 = (os_log_t *)MEMORY[0x1E0CB5378];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v18, "integerValue") > 7)
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
            -[HKHealthChartFactory _sleepApneaRemoteDataSourcesForDisplayType:forTimeScopes:].cold.1(&v20, v21);
        }
        else
        {
          objc_msgSend(v11, "setDataSource:forTimeScope:", v10, objc_msgSend(v18, "integerValue"));
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  return v11;
}

- (id)_defaultRemoteDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4
{
  id v6;
  _HKRemoteDataSources *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[4];
  int v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v6 = a4;
  v7 = objc_alloc_init(_HKRemoteDataSources);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    v21 = &v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v13, "integerValue", v21) > 7)
        {
          _HKInitializeLogging();
          v18 = (void *)*MEMORY[0x1E0CB5378];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
            -[HKHealthChartFactory _defaultRemoteDataSourcesForDisplayType:forTimeScopes:].cold.1(v27, v18, v22, v21);
        }
        else
        {
          v14 = objc_msgSend(v13, "integerValue");
          -[HKHealthChartFactory healthStore](self, "healthStore");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKHealthChartFactory unitPreferenceController](self, "unitPreferenceController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "hk_healthQueryChartCacheDataSourceForTimeScope:healthStore:unitController:", v14, v15, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          -[_HKRemoteDataSources setDataSource:forTimeScope:](v7, "setDataSource:forTimeScope:", v17, objc_msgSend(v13, "integerValue"));
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v10);
  }

  -[_HKRemoteDataSources allDataSources](v7, "allDataSources");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
    -[_HKRemoteDataSources setSupportsChartQueryDataGeneration:](v7, "setSupportsChartQueryDataGeneration:", objc_msgSend(v19, "hk_allObjectsPassTest:", &__block_literal_global_209));

  return v7;
}

uint64_t __78__HKHealthChartFactory__defaultRemoteDataSourcesForDisplayType_forTimeScopes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsChartQueryDataGeneration");
}

- (id)_remoteStatisticsIntervalForDisplayType:(id)a3 timeScope:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "chartingRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteChartConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_3;
  objc_msgSend(v5, "chartingRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteChartConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "statisticIntervalComponentsForTimeScope:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_3:
    objc_msgSend(v5, "hk_customSeriesPointIntervalComponentsForTimeScope:resolution:", a4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "seriesPointIntervalComponentsAtResolution:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

- (void)encodeChartQueryDataForTypeIdentifier:(id)a3 forTimeScopes:(id)a4 timeScopeReferenceDate:(id)a5 audience:(unint64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HKHealthChartFactory *v23;
  void *v24;
  void *v25;
  HKRemoteDateIntervals *v26;
  id v27;
  unint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  unint64_t v39;
  HKRemoteDateIntervals *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  HKHealthChartFactory *v45;
  id v46;
  id v47;
  HKRemoteDateIntervals *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  unint64_t v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_msgSend(v13, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hk_map:", &__block_literal_global_211);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", "));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v18 = (void *)*MEMORY[0x1E0CB5378];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_INFO))
  {
    v19 = v18;
    HKStringForChartDataSourceQueryRequestAudience(a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v55 = v20;
    v56 = 2112;
    v57 = v12;
    v58 = 2112;
    v59 = v42;
    _os_log_impl(&dword_1D7813000, v19, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: Starting query for timeScopes: %@", buf, 0x20u);

  }
  -[HKHealthChartFactory _remoteChartDisplayTypeForTypeIdentifier:](self, "_remoteChartDisplayTypeForTypeIdentifier:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthChartFactory _remoteDataSourcesForDisplayType:forTimeScopes:audience:](self, "_remoteDataSourcesForDisplayType:forTimeScopes:audience:", v21, v13, v22);
    v23 = self;
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[HKRemoteDateIntervals initWithDisplayType:fromEndDate:]([HKRemoteDateIntervals alloc], "initWithDisplayType:fromEndDate:", v21, v14);
    v40 = v26;
    v41 = v25;
    if (objc_msgSend(v24, "supportsChartQueryDataGeneration"))
    {
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_218;
      v43[3] = &unk_1E9C3F950;
      v53 = a6;
      v44 = v12;
      v45 = v23;
      v46 = v13;
      v47 = v21;
      v48 = v26;
      v49 = v24;
      v27 = v25;
      v28 = a6;
      v29 = v12;
      v30 = v15;
      v31 = v27;
      v50 = v27;
      v51 = v42;
      v52 = v30;
      v38 = v31;
      v15 = v30;
      v12 = v29;
      -[HKHealthChartFactory _executeFetchOrSkipForTimeScopes:timeScope:audience:displayType:remoteDateIntervals:dataSources:gregorianCalendar:completion:](v23, "_executeFetchOrSkipForTimeScopes:timeScope:audience:displayType:remoteDateIntervals:dataSources:gregorianCalendar:completion:", v46, 6, v28, v47, v48, v49, v38, v43);

      v32 = v44;
    }
    else
    {
      v39 = a6;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Type %@ does not support chart query data generation"), v12);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      v34 = (void *)*MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      {
        v36 = v34;
        HKStringForChartDataSourceQueryRequestAudience(v39);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v55 = v37;
        v56 = 2112;
        v57 = v12;
        v58 = 2112;
        v59 = v32;
        _os_log_error_impl(&dword_1D7813000, v36, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: %@", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 11, v32);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v35);

    }
    v33 = v41;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Type %@ does not have a valid display type."), v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 11, v24);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v33);
  }

}

id __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return HKStringForHKTimeScope((int)objc_msgSend(a2, "intValue"), 0);
}

void __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_218(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  HKCodableChartSharableModel *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  HKCodableChartSharableModel *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  HKCodableChartSharableModel *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(HKCodableChartSharableModel);
  if (v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_218_cold_1();
  }
  v22 = v9;
  if (v7 && v8)
  {
    objc_msgSend(v7, "hk_codableDateInterval");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCodableChartSharableModel setDayDateInterval:](v10, "setDayDateInterval:", v11);

    -[HKCodableChartSharableModel setDayData:](v10, "setDayData:", v8);
  }
  v12 = *(_QWORD *)(a1 + 104);
  v14 = *(_QWORD *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 72);
  v21 = v8;
  v17 = *(_QWORD *)(a1 + 80);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_220;
  v23[3] = &unk_1E9C3F928;
  v34 = v12;
  v18 = *(void **)(a1 + 40);
  v24 = *(id *)(a1 + 32);
  v25 = v10;
  v19 = *(void **)(a1 + 48);
  v26 = *(_QWORD *)(a1 + 40);
  v27 = v19;
  v28 = *(id *)(a1 + 56);
  v29 = *(id *)(a1 + 64);
  v30 = *(id *)(a1 + 72);
  v31 = *(id *)(a1 + 80);
  v32 = *(id *)(a1 + 88);
  v33 = *(id *)(a1 + 96);
  v20 = v10;
  objc_msgSend(v18, "_executeFetchOrSkipForTimeScopes:timeScope:audience:displayType:remoteDateIntervals:dataSources:gregorianCalendar:completion:", v14, 5, v12, v13, v15, v16, v17, v23);

}

void __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_220(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_220_cold_1();
  }
  v21 = v9;
  if (v7 && v8)
  {
    objc_msgSend(v7, "hk_codableDateInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setWeekDateInterval:", v10);

    objc_msgSend(*(id *)(a1 + 40), "setWeekData:", v8);
  }
  v11 = *(void **)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 112);
  v14 = *(_QWORD *)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 72);
  v17 = *(_QWORD *)(a1 + 80);
  v16 = *(_QWORD *)(a1 + 88);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_221;
  v22[3] = &unk_1E9C3F928;
  v33 = v13;
  v23 = *(id *)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  v19 = *(_QWORD *)(a1 + 48);
  v20 = *(void **)(a1 + 56);
  v24 = v18;
  v25 = v19;
  v26 = v20;
  v27 = *(id *)(a1 + 64);
  v28 = *(id *)(a1 + 72);
  v29 = *(id *)(a1 + 80);
  v30 = *(id *)(a1 + 88);
  v31 = *(id *)(a1 + 96);
  v32 = *(id *)(a1 + 104);
  objc_msgSend(v11, "_executeFetchOrSkipForTimeScopes:timeScope:audience:displayType:remoteDateIntervals:dataSources:gregorianCalendar:completion:", v12, 4, v13, v14, v15, v17, v16, v22);

}

void __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_221(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_221_cold_1();
  }
  v18 = v9;
  if (v7 && v8)
  {
    objc_msgSend(v7, "hk_codableDateInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setMonthDateInterval:", v10);

    objc_msgSend(*(id *)(a1 + 40), "setMonthData:", v8);
  }
  v11 = *(void **)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 112);
  v14 = *(_QWORD *)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 72);
  v17 = *(_QWORD *)(a1 + 80);
  v16 = *(_QWORD *)(a1 + 88);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_222;
  v19[3] = &unk_1E9C3F900;
  v24 = v13;
  v20 = *(id *)(a1 + 32);
  v21 = *(id *)(a1 + 40);
  v22 = *(id *)(a1 + 96);
  v23 = *(id *)(a1 + 104);
  objc_msgSend(v11, "_executeFetchOrSkipForTimeScopes:timeScope:audience:displayType:remoteDateIntervals:dataSources:gregorianCalendar:completion:", v12, 3, v13, v14, v15, v17, v16, v19);

}

void __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_222(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  os_log_t *v10;
  void *v11;
  os_log_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (os_log_t *)MEMORY[0x1E0CB5378];
  if (v9 && (_HKInitializeLogging(), os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR)))
  {
    __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_222_cold_1();
    if (!v7)
      goto LABEL_6;
  }
  else if (!v7)
  {
    goto LABEL_6;
  }
  if (v8)
  {
    objc_msgSend(v7, "hk_codableDateInterval");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setSixMonthDateInterval:", v11);

    objc_msgSend(*(id *)(a1 + 40), "setSixMonthData:", v8);
  }
LABEL_6:
  _HKInitializeLogging();
  v12 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
  {
    v13 = *(_QWORD *)(a1 + 64);
    v14 = v12;
    HKStringForChartDataSourceQueryRequestAudience(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 48);
    v18 = 138412802;
    v19 = v15;
    v20 = 2112;
    v21 = v16;
    v22 = 2112;
    v23 = v17;
    _os_log_impl(&dword_1D7813000, v14, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: Returning chart model for timeScopes: %@", (uint8_t *)&v18, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)_executeFetchOrSkipForTimeScopes:(id)a3 timeScope:(int64_t)a4 audience:(unint64_t)a5 displayType:(id)a6 remoteDateIntervals:(id)a7 dataSources:(id)a8 gregorianCalendar:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  HKHealthQueryChartCacheQueryRequest *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  unint64_t v43;
  HKHealthQueryChartCacheQueryRequest *v44;
  void *v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v47 = a6;
  v16 = a7;
  v17 = a8;
  v46 = a9;
  v18 = a10;
  v19 = (void *)MEMORY[0x1E0CB37E8];
  v20 = a3;
  objc_msgSend(v19, "numberWithInteger:", a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "member:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v17;
  if (v22)
  {
    v43 = a5;
    -[HKHealthChartFactory _remoteStatisticsIntervalForDisplayType:timeScope:](self, "_remoteStatisticsIntervalForDisplayType:timeScope:", v47, a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataSourceForTimeScope:", a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0;
    objc_msgSend(v16, "dateIntervalForTimeScope:withGregorianCalendar:error:", a4, v46, &v53);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v53;
    v27 = v16;
    if (!v26 || v25)
    {
      v41 = v26;
      v29 = [HKHealthQueryChartCacheQueryRequest alloc];
      objc_msgSend(v25, "startDate");
      v30 = v24;
      v31 = v23;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "endDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[HKHealthQueryChartCacheQueryRequest initWithStartDate:endDate:statisticsInterval:audience:](v29, "initWithStartDate:endDate:statisticsInterval:audience:", v32, v33, v31, v43);

      v27 = v16;
      v23 = v31;
      v24 = v30;
      -[HKHealthChartFactory healthStore](self, "healthStore");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __149__HKHealthChartFactory__executeFetchOrSkipForTimeScopes_timeScope_audience_displayType_remoteDateIntervals_dataSources_gregorianCalendar_completion___block_invoke;
      v48[3] = &unk_1E9C3F978;
      v49 = v25;
      v50 = v47;
      v51 = v46;
      v52 = v18;
      v35 = (id)objc_msgSend(v30, "generateSharableQueryDataForRequest:healthStore:completionHandler:", v44, v34, v48);

      v26 = v41;
    }
    else
    {
      _HKInitializeLogging();
      v28 = (void *)*MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      {
        v36 = v28;
        HKStringForChartDataSourceQueryRequestAudience(v43);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectType");
        v42 = v26;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "identifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "description");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v55 = v37;
        v56 = 2112;
        v57 = v39;
        v58 = 2112;
        v59 = v40;
        _os_log_error_impl(&dword_1D7813000, v36, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@ Error: %@", buf, 0x20u);

        v26 = v42;
      }
      (*((void (**)(id, _QWORD, _QWORD, id))v18 + 2))(v18, 0, 0, v26);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v18 + 2))(v18, 0, 0, 0);
    v27 = v16;
  }

}

void __149__HKHealthChartFactory__executeFetchOrSkipForTimeScopes_timeScope_audience_displayType_remoteDateIntervals_dataSources_gregorianCalendar_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = (void *)a1[4];
  v6 = (void *)a1[5];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "behavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_dateIntervalUnshiftedFromQueryAlignment:calendar:", objc_msgSend(v9, "preferredCalendarDayAlignment"), a1[6]);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(a1[7] + 16))();
}

- (void)encodeChartQueryDataForTypeIdentifier:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "setWithObjects:", &unk_1E9CEAB50, &unk_1E9CEAB68, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory encodeChartQueryDataForTypeIdentifier:forTimeScopes:timeScopeReferenceDate:audience:completionHandler:](self, "encodeChartQueryDataForTypeIdentifier:forTimeScopes:timeScopeReferenceDate:audience:completionHandler:", v8, v10, v9, 0, v7);

}

- (id)remoteInteractiveChartForTypeIdentifier:(id)a3 model:(id)a4 chartSummaryTrendModel:(id)a5 displayDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
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
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v44;
  int64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[3];

  v52[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[HKHealthChartFactory _remoteChartDisplayTypeForTypeIdentifier:](self, "_remoteChartDisplayTypeForTypeIdentifier:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E9CEAB50, &unk_1E9CEAB68, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthChartFactory _remoteDataSourcesForDisplayType:forTimeScopes:](self, "_remoteDataSourcesForDisplayType:forTimeScopes:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "supportsChartQueryDataGeneration"))
    {
      v44 = v11;
      v48 = v17;
      v49 = v14;
      -[HKHealthChartFactory _remoteDisplayTypeConfigurationFromDataSources:model:originalDisplayType:](self, "_remoteDisplayTypeConfigurationFromDataSources:model:originalDisplayType:", v17, v12, v15);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthChartFactory _sourceTimeZoneFromModel:](self, "_sourceTimeZoneFromModel:", v12);
      v18 = objc_claimAutoreleasedReturnValue();
      v45 = -[HKHealthChartFactory _sourceFirstWeekdayFromModel:](self, "_sourceFirstWeekdayFromModel:", v12);
      v19 = (void *)MEMORY[0x1E0CB3588];
      objc_msgSend(v12, "monthDateInterval");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v20, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0CB3588];
      objc_msgSend(v12, "sixMonthDateInterval");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)v18;
      objc_msgSend(v22, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v23, v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "startDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v21;
      objc_msgSend(v21, "endDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "startDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "endDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v51[0] = &unk_1E9CEAB50;
      v51[1] = &unk_1E9CEAB68;
      v52[0] = v27;
      v52[1] = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "remoteDisplayType");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v50, "initialTimeScope");
      v14 = v49;
      if (v13)
        -[HKHealthChartFactory _buildTrendRemoteOverlayChartViewControllerWithDisplayType:timeScopeRanges:initialTimeScope:chartSummaryTrendModel:firstWeekday:displayDate:](self, "_buildTrendRemoteOverlayChartViewControllerWithDisplayType:timeScopeRanges:initialTimeScope:chartSummaryTrendModel:firstWeekday:displayDate:", v32, v31, v33, v13, v45, v49);
      else
        -[HKHealthChartFactory _buildStandardRemoteChartViewControllerWithDisplayType:timeScopeRanges:initialTimeScope:firstWeekday:displayDate:](self, "_buildStandardRemoteChartViewControllerWithDisplayType:timeScopeRanges:initialTimeScope:firstWeekday:displayDate:", v32, v31, v33, v45, v49);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v48;
      v11 = v44;
    }
    else
    {
      _HKInitializeLogging();
      v36 = *MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
        -[HKHealthChartFactory remoteInteractiveChartForTypeIdentifier:model:chartSummaryTrendModel:displayDate:].cold.1((uint64_t)v11, v36, v37, v38, v39, v40, v41, v42);
      v35 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthChartFactory.m"), 626, CFSTR("Type %@ does not have a valid display type."), v11);

    v35 = 0;
  }

  return v35;
}

- (id)breathingDisturbancesRemoteInteractiveChartWithBreathingDisturbancesModel:(id)a3 sleepApneaEventModel:(id)a4 sleepApneaEventChartData:(id)a5 displayDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int64_t v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  _QWORD v54[2];
  _QWORD v55[4];

  v55[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (id)*MEMORY[0x1E0CB5A60];
  -[HKHealthChartFactory _remoteChartDisplayTypeForTypeIdentifier:](self, "_remoteChartDisplayTypeForTypeIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (id)*MEMORY[0x1E0CB4988];
    -[HKHealthChartFactory _remoteChartDisplayTypeForTypeIdentifier:](self, "_remoteChartDisplayTypeForTypeIdentifier:", v17);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      v50 = v14;
      v47 = v15;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E9CEAB50, &unk_1E9CEAB68, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthChartFactory _remoteDataSourcesForDisplayType:forTimeScopes:](self, "_remoteDataSourcesForDisplayType:forTimeScopes:", v16, v18);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      -[HKHealthChartFactory _remoteDisplayTypeConfigurationFromDataSources:model:originalDisplayType:](self, "_remoteDisplayTypeConfigurationFromDataSources:model:originalDisplayType:", v48, v11, v16);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthChartFactory _sourceTimeZoneFromModel:](self, "_sourceTimeZoneFromModel:", v11);
      v19 = objc_claimAutoreleasedReturnValue();
      v45 = -[HKHealthChartFactory _sourceFirstWeekdayFromModel:](self, "_sourceFirstWeekdayFromModel:", v11);
      v20 = (void *)MEMORY[0x1E0CB3588];
      objc_msgSend(v11, "monthDateInterval");
      v51 = v13;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)v19;
      objc_msgSend(v20, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v21, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0CB3588];
      objc_msgSend(v11, "sixMonthDateInterval");
      v52 = v12;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v24, v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = v22;
      objc_msgSend(v22, "startDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "endDate");
      v49 = v17;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v26, v27);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = v25;
      objc_msgSend(v25, "startDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "endDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v54[0] = &unk_1E9CEAB50;
      v54[1] = &unk_1E9CEAB68;
      v55[0] = v41;
      v55[1] = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E9CEAB50, &unk_1E9CEAB68, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthChartFactory _remoteDataSourcesForDisplayType:forTimeScopes:](self, "_remoteDataSourcesForDisplayType:forTimeScopes:", v53, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      -[HKHealthChartFactory _remoteDisplayTypeConfigurationFromDataSources:model:queryData:originalDisplayType:](self, "_remoteDisplayTypeConfigurationFromDataSources:model:queryData:originalDisplayType:", v33, v52, v51, v53);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "remoteDisplayType");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "remoteDisplayType");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthChartFactory _buildBreathingDisturbancesRemoteChartViewControllerWithDisplayType:apneaDisplayType:timeScopeRanges:initialTimeScope:firstWeekday:displayDate:](self, "_buildBreathingDisturbancesRemoteChartViewControllerWithDisplayType:apneaDisplayType:timeScopeRanges:initialTimeScope:firstWeekday:displayDate:", v35, v36, v31, objc_msgSend(v43, "initialTimeScope"), v45, v50);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v51;
      v15 = v47;
      v14 = v50;

      v12 = v52;
      v17 = v49;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthChartFactory.m"), 689, CFSTR("Type %@ does not have a valid display type."), v17);

      v37 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthChartFactory.m"), 681, CFSTR("Type %@ does not have a valid display type."), v15);

    v37 = 0;
  }

  return v37;
}

- (id)_buildBreathingDisturbancesRemoteChartViewControllerWithDisplayType:(id)a3 apneaDisplayType:(id)a4 timeScopeRanges:(id)a5 initialTimeScope:(int64_t)a6 firstWeekday:(int64_t)a7 displayDate:(id)a8
{
  id v13;
  id v14;
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
  HKInteractiveChartOverlayViewController *v25;
  void *v26;
  HKInteractiveChartOverlayViewController *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];

  v40[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v32 = a5;
  v37 = a8;
  -[HKHealthChartFactory selectedTimeScopeController](self, "selectedTimeScopeController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSelectedTimeScope:", a6);

  v30 = objc_msgSend(v13, "hk_interactiveChartOptions") | 0xA0000;
  -[HKHealthChartFactory _remoteCalendarOverrideForDisplayType:](self, "_remoteCalendarOverrideForDisplayType:", v13);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = [HKInteractiveChartOverlayViewController alloc];
  v34 = v14;
  v39 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v16;
  v35 = v13;
  v38 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKInteractiveChartStackHeight percentStackHeights:](HKInteractiveChartStackHeight, "percentStackHeights:", &unk_1E9CE9BC0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory healthStore](self, "healthStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory unitPreferenceController](self, "unitPreferenceController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory dateCache](self, "dateCache");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory chartDataCacheController](self, "chartDataCacheController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory selectedTimeScopeController](self, "selectedTimeScopeController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory sampleTypeDateRangeController](self, "sampleTypeDateRangeController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v24 = v32;
    v25 = -[HKInteractiveChartOverlayViewController initWithStackedDisplayTypes:primaryDisplayTypeStackIndex:stackedDisplayTypeHeights:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:timeScopeRanges:](v29, "initWithStackedDisplayTypes:primaryDisplayTypeStackIndex:stackedDisplayTypeHeights:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:timeScopeRanges:", v36, &unk_1E9CEAB80, v17, v18, v19, v20, v21, v22, v23, v37, 0, v30, v32);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[HKInteractiveChartOverlayViewController initWithStackedDisplayTypes:primaryDisplayTypeStackIndex:stackedDisplayTypeHeights:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:timeScopeRanges:](v29, "initWithStackedDisplayTypes:primaryDisplayTypeStackIndex:stackedDisplayTypeHeights:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:timeScopeRanges:", v36, &unk_1E9CEAB80, v17, v18, v19, v20, v21, v22, v23, v26, 0, v30, v32);

    v24 = v32;
  }

  if (!v33)
    -[HKInteractiveChartViewController setAnnotationDataSourceFirstWeekday:](v25, "setAnnotationDataSourceFirstWeekday:", a7);

  return v25;
}

- (id)_sourceTimeZoneFromModel:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  if (objc_msgSend(v3, "hasMonthData")
    && (objc_msgSend(v3, "monthData"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "hasTimeZoneName"),
        v4,
        v5))
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E80]);
    objc_msgSend(v3, "monthData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "hasSixMonthData")
      || (objc_msgSend(v3, "sixMonthData"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "hasTimeZoneName"),
          v8,
          !v9))
    {
      v12 = 0;
      goto LABEL_9;
    }
    v6 = objc_alloc(MEMORY[0x1E0C99E80]);
    objc_msgSend(v3, "sixMonthData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v7;
  objc_msgSend(v7, "timeZoneName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v6, "initWithName:", v11);

LABEL_9:
  return v12;
}

- (int64_t)_sourceFirstWeekdayFromModel:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int64_t v10;

  v3 = a3;
  if (objc_msgSend(v3, "hasMonthData")
    && (objc_msgSend(v3, "monthData"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "hasFirstWeekday"),
        v4,
        v5))
  {
    objc_msgSend(v3, "monthData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "hasSixMonthData")
      || (objc_msgSend(v3, "sixMonthData"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "hasFirstWeekday"),
          v7,
          !v8))
    {
      v10 = -1;
      goto LABEL_9;
    }
    objc_msgSend(v3, "sixMonthData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  v10 = objc_msgSend(v6, "firstWeekday");

LABEL_9:
  return v10;
}

- (id)_remoteDisplayTypeConfigurationFromDataSources:(id)a3 model:(id)a4 originalDisplayType:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  HKRemoteChartDataSource *v24;
  HKRemoteChartDataSource *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HKInteractiveChartDisplayType *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  HKInteractiveChartDisplayType *v36;
  _HKRemoteDisplayTypeConfiguration *v37;
  void *v39;
  void *v40;
  HKRemoteChartDataSource *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "monthData");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sixMonthData");
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "dataSourceForTimeScope:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSourceForTimeScope:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = (void *)v11;
  objc_msgSend(v13, "chartPointsFromQueryData:dataIsFromRemoteSource:", v11, 1);
  v15 = objc_claimAutoreleasedReturnValue();
  v45 = v14;
  v43 = (void *)v12;
  v16 = v12;
  v17 = (void *)v15;
  objc_msgSend(v14, "chartPointsFromQueryData:dataIsFromRemoteSource:", v16, 1);
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "chartPoints");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19
    && (v20 = (void *)v19,
        objc_msgSend(v17, "chartPoints"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "count"),
        v21,
        v20,
        v22))
  {
    v23 = 4;
  }
  else
  {
    v23 = 3;
  }
  v42 = v23;
  v24 = objc_alloc_init(HKRemoteChartDataSource);
  v25 = objc_alloc_init(HKRemoteChartDataSource);
  v41 = v24;
  -[HKHealthChartFactory _remoteGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:](self, "_remoteGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:", v8, v24, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory _remoteGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:](self, "_remoteGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:", v8, v25, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "seriesDataSourceContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRemoteChartDataSource setDataForTimeScope:seriesData:dataSourceForMapping:seriesDataSourceContext:](v24, "setDataForTimeScope:seriesData:dataSourceForMapping:seriesDataSourceContext:", 4, v17, v13, v28);

  objc_msgSend(v27, "seriesDataSourceContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v18;
  -[HKRemoteChartDataSource setDataForTimeScope:seriesData:dataSourceForMapping:seriesDataSourceContext:](v25, "setDataForTimeScope:seriesData:dataSourceForMapping:seriesDataSourceContext:", 3, v18, v45, v29);

  -[HKHealthChartFactory _remoteCustomFormatterForDisplayType:](self, "_remoteCustomFormatterForDisplayType:", v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = [HKInteractiveChartDisplayType alloc];
  objc_msgSend(v8, "objectType");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v17;
  v34 = objc_msgSend(v33, "code");
  v46[0] = &unk_1E9CEAB50;
  v46[1] = &unk_1E9CEAB68;
  v47[0] = v26;
  v47[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v39 = v13;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[HKInteractiveChartDisplayType initWithBaseDisplayType:valueFormatter:dataTypeCode:seriesForTimeScopeMapping:](v32, "initWithBaseDisplayType:valueFormatter:dataTypeCode:seriesForTimeScopeMapping:", v8, v31, v34, v35);

  v37 = -[_HKRemoteDisplayTypeConfiguration initWithInitialTimeScope:remoteDisplayType:]([_HKRemoteDisplayTypeConfiguration alloc], "initWithInitialTimeScope:remoteDisplayType:", v42, v36);
  return v37;
}

- (id)_remoteDisplayTypeConfigurationFromDataSources:(id)a3 model:(id)a4 queryData:(id)a5 originalDisplayType:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  HKRemoteChartDataSource *v25;
  HKRemoteChartDataSource *v26;
  HKRemoteChartDataSource *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HKInteractiveChartDisplayType *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  HKInteractiveChartDisplayType *v38;
  _HKRemoteDisplayTypeConfiguration *v39;
  void *v41;
  HKRemoteChartDataSource *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "dataSourceForTimeScope:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dataSourceForTimeScope:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHealthChartFactory _sourceTimeZoneFromModel:](self, "_sourceTimeZoneFromModel:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "chartPointsFromNotificationQueryData:sourceTimeZoneFromModel:", v11, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHealthChartFactory _sourceTimeZoneFromModel:](self, "_sourceTimeZoneFromModel:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v15;
  objc_msgSend(v15, "chartPointsFromNotificationQueryData:sourceTimeZoneFromModel:", v11, v18);
  v19 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "chartPoints");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20
    && (v21 = (void *)v20,
        objc_msgSend(v17, "chartPoints"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend(v22, "count"),
        v22,
        v21,
        v23))
  {
    v24 = 4;
  }
  else
  {
    v24 = 3;
  }
  v44 = v24;
  v25 = objc_alloc_init(HKRemoteChartDataSource);
  v26 = objc_alloc_init(HKRemoteChartDataSource);
  v27 = v25;
  v42 = v25;
  -[HKHealthChartFactory _remoteGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:](self, "_remoteGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:", v10, v25, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory _remoteGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:](self, "_remoteGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:", v10, v26, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "seriesDataSourceContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v17;
  -[HKRemoteChartDataSource setDataForTimeScope:seriesData:dataSourceForMapping:seriesDataSourceContext:](v27, "setDataForTimeScope:seriesData:dataSourceForMapping:seriesDataSourceContext:", 4, v17, v14, v30);

  objc_msgSend(v29, "seriesDataSourceContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v19;
  -[HKRemoteChartDataSource setDataForTimeScope:seriesData:dataSourceForMapping:seriesDataSourceContext:](v26, "setDataForTimeScope:seriesData:dataSourceForMapping:seriesDataSourceContext:", 3, v19, v45, v31);

  v33 = [HKInteractiveChartDisplayType alloc];
  -[HKHealthChartFactory _remoteCustomFormatterForDisplayType:](self, "_remoteCustomFormatterForDisplayType:", v10);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectType");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v14;
  v36 = objc_msgSend(v35, "code");
  v46[0] = &unk_1E9CEAB50;
  v46[1] = &unk_1E9CEAB68;
  v47[0] = v28;
  v47[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[HKInteractiveChartDisplayType initWithBaseDisplayType:valueFormatter:dataTypeCode:seriesForTimeScopeMapping:](v33, "initWithBaseDisplayType:valueFormatter:dataTypeCode:seriesForTimeScopeMapping:", v10, v34, v36, v37);

  v39 = -[_HKRemoteDisplayTypeConfiguration initWithInitialTimeScope:remoteDisplayType:]([_HKRemoteDisplayTypeConfiguration alloc], "initWithInitialTimeScope:remoteDisplayType:", v44, v38);
  return v39;
}

- (id)_remoteGraphSeriesForDisplayType:(id)a3 graphSeriesDataSource:(id)a4 timeScope:(int64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "displayTypeIdentifier");
  if (v10 == 276)
  {
    -[HKHealthChartFactory _sleepApneaGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:](self, "_sleepApneaGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:", v8, v9, a5);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else if (v10 == 275)
  {
    -[HKHealthChartFactory _sleepingBreathingDisturbancesGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:](self, "_sleepingBreathingDisturbancesGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:", v8, v9, a5);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v10 == 63)
      -[HKHealthChartFactory _sleepRemoteGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:](self, "_sleepRemoteGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:", v8, v9, a5);
    else
      -[HKHealthChartFactory _standardRemoteGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:](self, "_standardRemoteGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:", v8, v9, a5);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  return v12;
}

- (id)_standardRemoteGraphSeriesForDisplayType:(id)a3 graphSeriesDataSource:(id)a4 timeScope:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "displayCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory unitPreferenceController](self, "unitPreferenceController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory chartDataCacheController](self, "chartDataCacheController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_standardSeriesForTimeScope:graphSeriesDataSource:displayCategory:unitController:dataCacheController:", a5, v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_sleepRemoteGraphSeriesForDisplayType:(id)a3 graphSeriesDataSource:(id)a4 timeScope:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[HKHealthChartFactory unitPreferenceController](self, "unitPreferenceController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSleepUtilities buildSleepGraphSeriesForSleepSeriesType:sleepDisplayType:unitController:numericAxisConfigurationOverrides:timeScope:](HKSleepUtilities, "buildSleepGraphSeriesForSleepSeriesType:sleepDisplayType:unitController:numericAxisConfigurationOverrides:timeScope:", 0, v9, v10, 0, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setDataSource:", v8);
  return v11;
}

- (id)_sleepingBreathingDisturbancesGraphSeriesForDisplayType:(id)a3 graphSeriesDataSource:(id)a4 timeScope:(int64_t)a5
{
  id v8;
  void *v9;
  HKBreathingDisturbancesAxis *v10;

  v8 = a3;
  -[HKHealthChartFactory _standardRemoteGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:](self, "_standardRemoteGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKBreathingDisturbancesAxis initWithDisplayType:]([HKBreathingDisturbancesAxis alloc], "initWithDisplayType:", v8);

  objc_msgSend(v9, "setYAxis:", v10);
  return v9;
}

- (id)_sleepApneaGraphSeriesForDisplayType:(id)a3 graphSeriesDataSource:(id)a4 timeScope:(int64_t)a5
{
  id v8;
  void *v9;
  HKSleepApneaEventAxis *v10;

  v8 = a3;
  -[HKHealthChartFactory _standardRemoteGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:](self, "_standardRemoteGraphSeriesForDisplayType:graphSeriesDataSource:timeScope:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKSleepApneaEventAxis initWithDisplayType:]([HKSleepApneaEventAxis alloc], "initWithDisplayType:", v8);

  objc_msgSend(v9, "setYAxis:", v10);
  return v9;
}

- (id)_remoteCustomFormatterForDisplayType:(id)a3
{
  uint64_t v4;
  HKSleepApneaEventInteractiveChartFormatter *v5;
  __objc2_class *v6;
  HKSleepApneaEventInteractiveChartFormatter *v7;
  void *v8;
  void *v9;
  HKSleepApneaEventInteractiveChartFormatter *v10;

  v4 = objc_msgSend(a3, "displayTypeIdentifier");
  v5 = 0;
  if (v4 > 274)
  {
    if (v4 == 275)
    {
      v6 = HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter;
      goto LABEL_10;
    }
    if (v4 == 276)
    {
      v7 = [HKSleepApneaEventInteractiveChartFormatter alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_ALERTS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Nebula"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[HKSleepApneaEventInteractiveChartFormatter initWithLocalizedCategoryName:](v7, "initWithLocalizedCategoryName:", v9);

    }
  }
  else
  {
    if (v4 == 63)
    {
      -[HKHealthChartFactory sleepChartFormatter](self, "sleepChartFormatter");
      v10 = (HKSleepApneaEventInteractiveChartFormatter *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      v5 = v10;
      return v5;
    }
    if (v4 == 124)
    {
      v6 = HKInteractiveChartCardioFitnessFormatter;
LABEL_10:
      v10 = (HKSleepApneaEventInteractiveChartFormatter *)objc_alloc_init(v6);
      goto LABEL_11;
    }
  }
  return v5;
}

- (id)_buildStandardRemoteChartViewControllerWithDisplayType:(id)a3 timeScopeRanges:(id)a4 initialTimeScope:(int64_t)a5 firstWeekday:(int64_t)a6 displayDate:(id)a7
{
  id v11;
  void *v12;
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
  uint64_t v26;
  HKInteractiveChartViewController *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v28 = a4;
  v31 = a7;
  -[HKHealthChartFactory selectedTimeScopeController](self, "selectedTimeScopeController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSelectedTimeScope:", a5);

  v26 = objc_msgSend(v11, "hk_interactiveChartOptions") | 0xA0000;
  -[HKHealthChartFactory _remoteCalendarOverrideForDisplayType:](self, "_remoteCalendarOverrideForDisplayType:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = [HKInteractiveChartViewController alloc];
  v29 = v11;
  v32 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory healthStore](self, "healthStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory unitPreferenceController](self, "unitPreferenceController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory dateCache](self, "dateCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory chartDataCacheController](self, "chartDataCacheController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory selectedTimeScopeController](self, "selectedTimeScopeController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory sampleTypeDateRangeController](self, "sampleTypeDateRangeController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v21 = v28;
    v22 = -[HKInteractiveChartViewController initWithStackedDisplayTypes:primaryDisplayTypeStackIndex:stackedDisplayTypeHeights:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:timeScopeRanges:](v27, "initWithStackedDisplayTypes:primaryDisplayTypeStackIndex:stackedDisplayTypeHeights:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:timeScopeRanges:", v30, 0, 0, v15, v16, v17, v18, v19, v20, v31, v13, v26, v28);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HKInteractiveChartViewController initWithStackedDisplayTypes:primaryDisplayTypeStackIndex:stackedDisplayTypeHeights:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:timeScopeRanges:](v27, "initWithStackedDisplayTypes:primaryDisplayTypeStackIndex:stackedDisplayTypeHeights:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:timeScopeRanges:", v30, 0, 0, v15, v16, v17, v18, v19, v20, v23, v13, v26, v28);

    v21 = v28;
  }

  if (!v13)
    -[HKInteractiveChartViewController setAnnotationDataSourceFirstWeekday:](v22, "setAnnotationDataSourceFirstWeekday:", a6);

  return v22;
}

- (id)_buildTrendRemoteOverlayChartViewControllerWithDisplayType:(id)a3 timeScopeRanges:(id)a4 initialTimeScope:(int64_t)a5 chartSummaryTrendModel:(id)a6 firstWeekday:(int64_t)a7 displayDate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  HKOverlayRoomFactorAndTrendViewController *v20;

  v14 = a8;
  v15 = a6;
  v16 = a4;
  v17 = a3;
  -[HKHealthChartFactory _buildApplicationItems](self, "_buildApplicationItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory _remoteCalendarOverrideForDisplayType:](self, "_remoteCalendarOverrideForDisplayType:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HKOverlayRoomFactorAndTrendViewController initWithBaseChartDisplayType:trendModel:factorDisplayTypes:displayDate:applicationItems:mode:timeScopeRanges:initialTimeScope:wrappedOverlay:overrideFirstWeekday:overrideCalendar:additionalChartOptions:]([HKOverlayRoomFactorAndTrendViewController alloc], "initWithBaseChartDisplayType:trendModel:factorDisplayTypes:displayDate:applicationItems:mode:timeScopeRanges:initialTimeScope:wrappedOverlay:overrideFirstWeekday:overrideCalendar:additionalChartOptions:", v17, v15, 0, v14, v18, 1, v16, a5, 0, a7, v19, 0);

  return v20;
}

- (id)_remoteCalendarOverrideForDisplayType:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "displayTypeIdentifier");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "baseDisplayType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "displayTypeIdentifier");

  }
  if (v4 == 248)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFirstWeekday:", 2);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)createDisplayTypeForSleepDuration
{
  return -[HKHealthChartFactory _createSleepDisplayTypeForSeriesType:](self, "_createSleepDisplayTypeForSeriesType:", 0);
}

- (id)createDisplayTypeForSleepStages
{
  return -[HKHealthChartFactory _createSleepDisplayTypeForSeriesType:](self, "_createSleepDisplayTypeForSeriesType:", 4);
}

- (id)_createSleepDisplayTypeForSeriesType:(int64_t)a3
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
  void *v16;
  void *v17;
  uint64_t v19;

  -[HKHealthChartFactory displayTypeController](self, "displayTypeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayTypeWithIdentifier:", &unk_1E9CEAB98);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHealthChartFactory sleepDataSourceProvider](self, "sleepDataSourceProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory chartDataCacheController](self, "chartDataCacheController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory healthStore](self, "healthStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSleepUtilities buildSleepChartCachesWithDisplayType:dataSourceProvider:cacheController:healthStore:](HKSleepUtilities, "buildSleepChartCachesWithDisplayType:dataSourceProvider:cacheController:healthStore:", v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHealthChartFactory healthStore](self, "healthStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory unitPreferenceController](self, "unitPreferenceController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory displayTypeController](self, "displayTypeController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory chartDataCacheController](self, "chartDataCacheController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory sleepChartFormatter](self, "sleepChartFormatter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = 0;
  +[HKSleepUtilities sleepDisplayTypesWithHealthStore:sleepDisplayType:unitController:displayTypeController:chartCacheController:sleepChartFormatter:sleepSeriesType:sleepChartCaches:customSleepSeries:isStackedChart:](HKSleepUtilities, "sleepDisplayTypesWithHealthStore:sleepDisplayType:unitController:displayTypeController:chartCacheController:sleepChartFormatter:sleepSeriesType:sleepChartCaches:customSleepSeries:isStackedChart:", v11, v6, v12, v13, v14, v15, a3, v10, 0, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)createInteractiveChartForSimpleDisplayType:(id)a3 chartOptions:(unint64_t)a4
{
  id v6;
  HKInteractiveChartViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HKInteractiveChartViewController *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = [HKInteractiveChartViewController alloc];
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHealthChartFactory healthStore](self, "healthStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory unitPreferenceController](self, "unitPreferenceController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory dateCache](self, "dateCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory chartDataCacheController](self, "chartDataCacheController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory selectedTimeScopeController](self, "selectedTimeScopeController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory sampleTypeDateRangeController](self, "sampleTypeDateRangeController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKInteractiveChartViewController initWithDisplayTypes:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:](v7, "initWithDisplayTypes:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:", v8, v9, v10, v11, v12, v13, v14, 0, 0, a4);

  return v15;
}

- (id)activityChartForActivityMoveMode:(int64_t)a3 displayDate:(id)a4 activityOptions:(unint64_t)a5 chartSharableModel:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  HKOverlayRoomFactorAndTrendViewController *v19;
  void *v20;
  void *v21;
  HKInteractiveChartActivityController *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  HKInteractiveChartActivityController *v33;

  v10 = a6;
  v11 = a4;
  -[HKHealthChartFactory selectedTimeScopeController](self, "selectedTimeScopeController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSelectedTimeScope:", 6);

  v13 = *MEMORY[0x1E0CB4670];
  -[HKHealthChartFactory _factorDisplayTypesForPrimaryTypeIdentifier:](self, "_factorDisplayTypesForPrimaryTypeIdentifier:", *MEMORY[0x1E0CB4670]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory _logFactorsForTypeIdentifier:factorDisplayTypes:](self, "_logFactorsForTypeIdentifier:factorDisplayTypes:", v13, v14);
  v15 = objc_msgSend(v14, "count");
  if (v10 || !v15)
  {
    v33 = [HKInteractiveChartActivityController alloc];
    -[HKHealthChartFactory healthStore](self, "healthStore");
    v32 = objc_claimAutoreleasedReturnValue();
    -[HKHealthChartFactory unitPreferenceController](self, "unitPreferenceController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthChartFactory dateCache](self, "dateCache");
    v31 = objc_claimAutoreleasedReturnValue();
    -[HKHealthChartFactory chartDataCacheController](self, "chartDataCacheController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthChartFactory selectedTimeScopeController](self, "selectedTimeScopeController");
    v24 = v10;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthChartFactory sampleTypeDateRangeController](self, "sampleTypeDateRangeController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthChartFactory wheelchairUseCharacteristicCache](self, "wheelchairUseCharacteristicCache");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = a5;
    v21 = (void *)v32;
    v22 = -[HKInteractiveChartActivityController initWithHealthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:wheelchairUseCharacteristicCache:initialXValue:activityMoveMode:activityOptions:chartSharableModel:](v33, "initWithHealthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:wheelchairUseCharacteristicCache:initialXValue:activityMoveMode:activityOptions:chartSharableModel:", v32, v20, v31, v23, v25, v26, v27, v11, a3, v29, v24);

    v10 = v24;
    v11 = (id)v31;
  }
  else
  {
    -[HKHealthChartFactory displayTypeController](self, "displayTypeController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6978], "_typeWithIdentifier:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "displayTypeForObjectType:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = [HKOverlayRoomFactorAndTrendViewController alloc];
    -[HKHealthChartFactory _buildApplicationItems](self, "_buildApplicationItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = a5;
    v21 = (void *)v18;
    v22 = -[HKOverlayRoomFactorAndTrendViewController initWithBaseChartDisplayType:trendModel:factorDisplayTypes:displayDate:applicationItems:mode:timeScopeRanges:initialTimeScope:wrappedOverlay:overrideFirstWeekday:overrideCalendar:additionalChartOptions:activityMoveMode:activityOptions:](v19, "initWithBaseChartDisplayType:trendModel:factorDisplayTypes:displayDate:applicationItems:mode:timeScopeRanges:initialTimeScope:wrappedOverlay:overrideFirstWeekday:overrideCalendar:additionalChartOptions:activityMoveMode:activityOptions:", v18, 0, v14, v11, v20, 1, 0, 8, 0, -1, 0, 0, a3, v30);
  }

  return v22;
}

- (void)updateChartSummaryTrendModel:(id)a3 viewController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1F01833E8))
  {
    objc_msgSend(v6, "getChartSummaryTrendModelToModify");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "updateChartSummaryTrendModel:", v5);

  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      -[HKHealthChartFactory updateChartSummaryTrendModel:viewController:].cold.1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }

}

- (int64_t)_resolvedTimeScopeForTypeIdentifier:(id)a3 displayDateInterval:(id)a4
{
  id v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  -[HKHealthChartFactory _displayTypeForTypeIdentifier:](self, "_displayTypeForTypeIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "duration");
    if (v10 >= 2.22507386e-308)
    {
      objc_msgSend(v8, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v13, v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = +[HKGraphZoomLevelConfiguration timeScopeForDateRange:](HKGraphZoomLevelConfiguration, "timeScopeForDateRange:", v11);
      if ((objc_msgSend(v9, "hk_isSupportedTimeScope:", v12) & 1) == 0)
      {
        objc_msgSend(v9, "chartingRules");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v15, "preferredTimeScope");

      }
    }
    else
    {
      objc_msgSend(v9, "chartingRules");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "preferredTimeScope");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthChartFactory.m"), 1197, CFSTR("Type %@ does not have a valid display type."), v7);
    v12 = 8;
  }

  return v12;
}

- (id)_resolvedDisplayDateForDisplayType:(id)a3 displayDate:(id)a4 timeScope:(int64_t)a5 gregorianCalendar:(id)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;

  v9 = a4;
  v10 = a6;
  objc_msgSend(a3, "behavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "preferredCalendarDayAlignment");

  if (v12 != 1
    || (a5 & 0xFFFFFFFFFFFFFFFELL) == 6
    || (v13 = objc_msgSend(v9, "hk_dayIndexWithCalendar:", v10),
        v14 = objc_msgSend(v9, "hk_morningIndexWithCalendar:", v10),
        v13 == v14))
  {
    v15 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "hk_dateOnDayIndex:atHour:calendar:", v14, 6, v10);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  return v16;
}

- (id)_displayTypeForTypeIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB6978], "_typeWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HKHealthChartFactory displayTypeController](self, "displayTypeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayTypeForObjectType:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)CHRRoomApplicationItems
{
  HKSelectedTimeScopeController *v3;
  HKOverlayRoomApplicationItems *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(HKSelectedTimeScopeController);
  -[HKSelectedTimeScopeController setSelectedTimeScope:](v3, "setSelectedTimeScope:", 1);
  v4 = objc_alloc_init(HKOverlayRoomApplicationItems);
  -[HKHealthChartFactory healthStore](self, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setHealthStore:](v4, "setHealthStore:", v5);

  -[HKOverlayRoomApplicationItems setTimeScopeController:](v4, "setTimeScopeController:", v3);
  -[HKHealthChartFactory dateCache](self, "dateCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setDateCache:](v4, "setDateCache:", v6);

  -[HKHealthChartFactory unitPreferenceController](self, "unitPreferenceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setUnitController:](v4, "setUnitController:", v7);

  -[HKHealthChartFactory chartDataCacheController](self, "chartDataCacheController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setChartDataCacheController:](v4, "setChartDataCacheController:", v8);

  -[HKHealthChartFactory sampleTypeUpdateController](self, "sampleTypeUpdateController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setSampleTypeUpdateController:](v4, "setSampleTypeUpdateController:", v9);

  -[HKHealthChartFactory sampleTypeDateRangeController](self, "sampleTypeDateRangeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setSampleDateRangeController:](v4, "setSampleDateRangeController:", v10);

  -[HKHealthChartFactory displayTypeController](self, "displayTypeController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setDisplayTypeController:](v4, "setDisplayTypeController:", v11);

  return v4;
}

- (void)registerInteractiveChartViewControllerProvider:(id)a3 typeIdentifier:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_customViewControllerProvidersByTypeIdentifier, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)_buildApplicationItems
{
  HKOverlayRoomApplicationItems *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(HKOverlayRoomApplicationItems);
  -[HKHealthChartFactory healthStore](self, "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setHealthStore:](v3, "setHealthStore:", v4);

  -[HKHealthChartFactory selectedTimeScopeController](self, "selectedTimeScopeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setTimeScopeController:](v3, "setTimeScopeController:", v5);

  -[HKHealthChartFactory dateCache](self, "dateCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setDateCache:](v3, "setDateCache:", v6);

  -[HKHealthChartFactory unitPreferenceController](self, "unitPreferenceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setUnitController:](v3, "setUnitController:", v7);

  -[HKHealthChartFactory chartDataCacheController](self, "chartDataCacheController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setChartDataCacheController:](v3, "setChartDataCacheController:", v8);

  -[HKHealthChartFactory sampleTypeUpdateController](self, "sampleTypeUpdateController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setSampleTypeUpdateController:](v3, "setSampleTypeUpdateController:", v9);

  -[HKHealthChartFactory sampleTypeDateRangeController](self, "sampleTypeDateRangeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setSampleDateRangeController:](v3, "setSampleDateRangeController:", v10);

  -[HKHealthChartFactory displayTypeController](self, "displayTypeController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setDisplayTypeController:](v3, "setDisplayTypeController:", v11);

  return v3;
}

- (id)_factorDisplayTypesForPrimaryTypeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HKHealthChartFactory displayTypeController](self, "displayTypeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "_typeWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "displayTypeForObjectType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHealthChartFactory _factorDisplayTypesForPrimaryDisplayType:](self, "_factorDisplayTypesForPrimaryDisplayType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_factorDisplayTypesForPrimaryDisplayType:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  +[HKDisplayType hk_chartFactorDisplayTypes](HKDisplayType, "hk_chartFactorDisplayTypes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[HKHealthChartFactory _factorDisplayType:availableForPrimaryDisplayType:](self, "_factorDisplayType:availableForPrimaryDisplayType:", v11, v4)&& -[HKHealthChartFactory _factorDisplayTypeHasData:](self, "_factorDisplayTypeHasData:", v11))
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_factorDisplayType:(id)a3 availableForPrimaryDisplayType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  char v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "hk_chartExcludedFactorDisplayTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);
  v9 = objc_msgSend(v6, "isEqual:", v5);

  return (v8 | v9) ^ 1;
}

- (BOOL)_factorDisplayTypeHasData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;

  objc_msgSend(a3, "sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory sampleTypeDateRangeController](self, "sampleTypeDateRangeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateRangeForSampleType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "minValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v6, "maxValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9 != 0;

  }
  return v8;
}

- (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  HKOverlayRoomFactorAndTrendViewController *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HKInteractiveChartViewController *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a3;
  -[HKHealthChartFactory displayTypeController](self, "displayTypeController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "_typeWithIdentifier:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "displayTypeForObjectType:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v42 = v15;
    v24 = v19;
    v25 = objc_msgSend(v23, "hk_interactiveChartOptions");
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthChartFactory selectedTimeScopeController](self, "selectedTimeScopeController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthChartFactory _resolvedDisplayDateForDisplayType:displayDate:timeScope:gregorianCalendar:](self, "_resolvedDisplayDateForDisplayType:displayDate:timeScope:gregorianCalendar:", v23, v16, objc_msgSend(v27, "selectedTimeScope"), v26);
      v28 = v17;
      v29 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v29;
      v17 = v28;
    }
    if (v17)
    {

      v16 = 0;
    }
    v19 = v24;
    v30 = v25 | a11;
    v15 = v42;
    if (v18 || objc_msgSend(v19, "count"))
    {
      v31 = -[HKOverlayRoomFactorAndTrendViewController initWithBaseChartDisplayType:trendModel:factorDisplayTypes:displayDate:applicationItems:mode:timeScopeRanges:initialTimeScope:wrappedOverlay:overrideFirstWeekday:overrideCalendar:additionalChartOptions:]([HKOverlayRoomFactorAndTrendViewController alloc], "initWithBaseChartDisplayType:trendModel:factorDisplayTypes:displayDate:applicationItems:mode:timeScopeRanges:initialTimeScope:wrappedOverlay:overrideFirstWeekday:overrideCalendar:additionalChartOptions:", v23, v18, v19, v16, v42, 1, 0, 8, 0, -1, 0, v30);
    }
    else
    {
      v38 = [HKInteractiveChartViewController alloc];
      v43[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthChartFactory healthStore](self, "healthStore");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthChartFactory unitPreferenceController](self, "unitPreferenceController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthChartFactory dateCache](self, "dateCache");
      v39 = v17;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthChartFactory chartDataCacheController](self, "chartDataCacheController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthChartFactory selectedTimeScopeController](self, "selectedTimeScopeController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthChartFactory sampleTypeDateRangeController](self, "sampleTypeDateRangeController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[HKInteractiveChartViewController initWithDisplayTypes:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:](v38, "initWithDisplayTypes:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:", v41, v40, v37, v33, v34, v35, v36, v16, 0, v30);

      v15 = v42;
      v17 = v39;

      -[HKOverlayRoomViewController setRestorationUserActivity:](v31, "setRestorationUserActivity:", v39);
    }
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (HKChartDataCacheController)chartDataCacheController
{
  return self->_chartDataCacheController;
}

- (HKSampleTypeUpdateController)sampleTypeUpdateController
{
  return self->_sampleTypeUpdateController;
}

- (HKSampleTypeDateRangeController)sampleTypeDateRangeController
{
  return self->_sampleTypeDateRangeController;
}

- (HKSelectedTimeScopeController)selectedTimeScopeController
{
  return self->_selectedTimeScopeController;
}

- (HKSleepDataSourceProvider)sleepDataSourceProvider
{
  return self->_sleepDataSourceProvider;
}

- (HKInteractiveChartDataFormatter)sleepChartFormatter
{
  return self->_sleepChartFormatter;
}

- (void)setSleepChartFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_sleepChartFormatter, a3);
}

- (HKAddDataViewControllerProvider)addDataViewControllerProvider
{
  return self->_addDataViewControllerProvider;
}

- (void)setAddDataViewControllerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_addDataViewControllerProvider, a3);
}

- (_HKWheelchairUseCharacteristicCache)wheelchairUseCharacteristicCache
{
  return self->_wheelchairUseCharacteristicCache;
}

- (BOOL)turnOffInitialSelectionForTesting
{
  return self->_turnOffInitialSelectionForTesting;
}

- (void)setTurnOffInitialSelectionForTesting:(BOOL)a3
{
  self->_turnOffInitialSelectionForTesting = a3;
}

- (id)supportedTypeIdentifiers
{
  return &unk_1E9CE9EA8;
}

- (id)standardChartDisplayTypeIdentifierForTypeIdentifier:(id)a3
{
  return (id)objc_msgSend(&unk_1E9CED718, "objectForKeyedSubscript:", a3);
}

- (id)chartFactoryViewControllerProviderForType:(id)a3 standardProvider:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  HKHealthChartFactoryViewControllerProviderClassAdaptor *v8;
  HKHealthChartFactoryViewControllerProviderClassAdaptor *v9;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB6978], "_typeWithIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = 0;
    switch(objc_msgSend(v6, "code"))
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 7:
      case 8:
      case 9:
      case 10:
      case 12:
      case 13:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 60:
      case 62:
      case 70:
      case 71:
      case 72:
      case 73:
      case 75:
      case 78:
      case 79:
      case 83:
      case 87:
      case 89:
      case 90:
      case 91:
      case 92:
      case 95:
      case 96:
      case 97:
      case 99:
      case 101:
      case 110:
      case 111:
      case 113:
      case 114:
      case 118:
      case 125:
      case 137:
      case 138:
      case 139:
      case 140:
      case 147:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 178:
      case 179:
      case 183:
      case 186:
      case 189:
      case 191:
      case 192:
      case 193:
      case 194:
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 249:
      case 250:
      case 251:
      case 256:
      case 258:
      case 259:
      case 260:
      case 262:
      case 263:
      case 264:
      case 265:
      case 266:
      case 269:
      case 270:
      case 274:
      case 276:
      case 277:
      case 279:
      case 280:
      case 281:
      case 282:
      case 283:
      case 284:
      case 287:
      case 288:
      case 294:
      case 295:
      case 296:
      case 297:
      case 298:
      case 301:
      case 302:
      case 303:
      case 304:
      case 313:
      case 314:
        v9 = (HKHealthChartFactoryViewControllerProviderClassAdaptor *)v5;
        goto LABEL_4;
      case 5:
      case 14:
      case 15:
      case 61:
      case 63:
      case 80:
      case 124:
      case 145:
      case 172:
      case 173:
      case 182:
      case 187:
      case 188:
      case 195:
      case 196:
      case 237:
      case 248:
      case 272:
      case 275:
      case 286:
      case 305:
        v9 = -[HKHealthChartFactoryViewControllerProviderClassAdaptor initWithProviderClass:]([HKHealthChartFactoryViewControllerProviderClassAdaptor alloc], "initWithProviderClass:", objc_opt_class());
LABEL_4:
        v8 = v9;
        break;
      default:
        break;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_sleepRemoteDataSourcesForDisplayType:(_BYTE *)a1 forTimeScopes:(_BYTE *)a2 audience:.cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_3_0(&dword_1D7813000, v2, v3, "Unsupported time scope requested for Sleep", v4);
}

- (void)_cardioFitnessDataSourcesForDisplayType:(_BYTE *)a1 forTimeScopes:(_BYTE *)a2 .cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_3_0(&dword_1D7813000, v2, v3, "Unsupported time scope requested for Cardio Fitness", v4);
}

- (void)_sleepApneaRemoteDataSourcesForDisplayType:(_BYTE *)a1 forTimeScopes:(_BYTE *)a2 .cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_3_0(&dword_1D7813000, v2, v3, "Unsupported time scope requested for Sleep Apnea", v4);
}

- (void)_defaultRemoteDataSourcesForDisplayType:(void *)a3 forTimeScopes:(_QWORD *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;
  void *v9;

  v7 = a2;
  objc_msgSend(a3, "localization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a4 = v9;
  _os_log_error_impl(&dword_1D7813000, v7, OS_LOG_TYPE_ERROR, "Unsupported time scope requested for %@", a1, 0xCu);

}

void __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_218_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  OUTLINED_FUNCTION_9();
  v2 = *(void **)(v1 + 104);
  v4 = v3;
  v5 = OUTLINED_FUNCTION_7();
  HKStringForChartDataSourceQueryRequestAudience(v5);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D7813000, v7, v8, "[RemoteCharting]_%@_%@: Error encoding day time scope chart. %@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_2_0();
}

void __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_220_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(v2, v3);
  v4 = OUTLINED_FUNCTION_7();
  HKStringForChartDataSourceQueryRequestAudience(v4);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D7813000, v6, v7, "[RemoteCharting]_%@_%@: Error encoding week time scope chart. %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_0();
}

void __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_221_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(v2, v3);
  v4 = OUTLINED_FUNCTION_7();
  HKStringForChartDataSourceQueryRequestAudience(v4);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D7813000, v6, v7, "[RemoteCharting]_%@_%@: Error encoding month time scope chart. %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_0();
}

void __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_222_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  OUTLINED_FUNCTION_9();
  v2 = *(void **)(v1 + 64);
  v4 = v3;
  v5 = OUTLINED_FUNCTION_7();
  HKStringForChartDataSourceQueryRequestAudience(v5);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D7813000, v7, v8, "[RemoteCharting]_%@_%@: Error encoding six months time scope chart. %@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_2_0();
}

- (void)remoteInteractiveChartForTypeIdentifier:(uint64_t)a3 model:(uint64_t)a4 chartSummaryTrendModel:(uint64_t)a5 displayDate:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Type %@ does not support chart query data generation", a5, a6, a7, a8, 2u);
}

- (void)updateChartSummaryTrendModel:(uint64_t)a3 viewController:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "HKHealthChartFactory: called updateChartSummaryTrendModel on object that does not conform to HKOverlayRoomTrendModelProviding.  ViewController %@", a5, a6, a7, a8, 2u);
}

@end
