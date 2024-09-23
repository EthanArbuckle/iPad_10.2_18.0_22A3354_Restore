@implementation HKOverlayRoomViewControllerLastQuantityContext

- (HKOverlayRoomViewControllerLastQuantityContext)initWithOverlayChartController:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5
{
  return -[HKOverlayRoomViewControllerLastQuantityContext initWithOverlayChartController:applicationItems:mode:attenuated:](self, "initWithOverlayChartController:applicationItems:mode:attenuated:", a3, a4, a5, 0);
}

- (HKOverlayRoomViewControllerLastQuantityContext)initWithOverlayChartController:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 attenuated:(BOOL)a6
{
  id v11;
  id v12;
  HKOverlayRoomViewControllerLastQuantityContext *v13;
  HKOverlayRoomViewControllerLastQuantityContext *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  HKInteractiveChartOverlayNamedDataSource *cacheDataSource;
  uint64_t v20;
  HKDisplayType *overlayDisplayType;
  void *v22;
  void *v23;
  uint64_t v24;
  HKDisplayTypeContextItem *lastUpdatedContextItem;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HKOverlayRoomViewControllerLastQuantityContext;
  v13 = -[HKOverlayRoomViewControllerLastQuantityContext init](&v27, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_attenuated = a6;
    objc_storeStrong((id *)&v13->_overlayChartController, a3);
    objc_storeStrong((id *)&v14->_applicationItems, a4);
    objc_msgSend(v12, "unitController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "primaryDisplayType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "healthStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewControllerLastQuantityContext _buildLastValueDataSourceWithUnitController:displayType:healthStore:](v14, "_buildLastValueDataSourceWithUnitController:displayType:healthStore:", v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    cacheDataSource = v14->_cacheDataSource;
    v14->_cacheDataSource = (HKInteractiveChartOverlayNamedDataSource *)v18;

    v14->_overlayMode = a5;
    -[HKOverlayRoomViewControllerLastQuantityContext _buildLastQuantityDisplayType](v14, "_buildLastQuantityDisplayType");
    v20 = objc_claimAutoreleasedReturnValue();
    overlayDisplayType = v14->_overlayDisplayType;
    v14->_overlayDisplayType = (HKDisplayType *)v20;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewControllerLastQuantityContext _buildContextWithTime:value:isUnitIncludedInValue:](v14, "_buildContextWithTime:value:isUnitIncludedInValue:", &stru_1E9C4C428, v23, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    lastUpdatedContextItem = v14->_lastUpdatedContextItem;
    v14->_lastUpdatedContextItem = (HKDisplayTypeContextItem *)v24;

  }
  return v14;
}

- (id)sampleTypeForDateRangeUpdates
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[HKOverlayRoomViewControllerLastQuantityContext overlayChartController](self, "overlayChartController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryDisplayType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *, uint64_t);
  void *v21;
  HKOverlayRoomViewControllerLastQuantityContext *v22;
  id v23;

  v8 = a7;
  -[HKOverlayRoomViewControllerLastQuantityContext sampleTypeForDateRangeUpdates](self, "sampleTypeForDateRangeUpdates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewControllerLastQuantityContext applicationItems](self, "applicationItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "healthStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __133__HKOverlayRoomViewControllerLastQuantityContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
  v21 = &unk_1E9C40238;
  v12 = v8;
  v22 = self;
  v23 = v12;
  v13 = _Block_copy(&v18);
  if (self->_attenuated
    && (objc_msgSend(v9, "identifier", v18, v19, v20, v21),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = (void *)*MEMORY[0x1E0CB5C78],
        v14,
        v14 == v15))
  {
    objc_msgSend(MEMORY[0x1E0CB6780], "queryForMostRecentAttenuatedEAEQuantityWithHealthStore:completion:", v11, v13);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6780], "queryForMostRecentQuantityOfType:healthStore:predicate:completion:", v9, v11, 0, v13, v18, v19, v20, v21);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v16;
  objc_msgSend(v11, "executeQuery:", v16);

}

void __133__HKOverlayRoomViewControllerLastQuantityContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __133__HKOverlayRoomViewControllerLastQuantityContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2;
    v12[3] = &unk_1E9C40210;
    v10 = v8;
    v11 = *(_QWORD *)(a1 + 32);
    v13 = v10;
    v14 = v11;
    v15 = v7;
    v16 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
}

void __133__HKOverlayRoomViewControllerLastQuantityContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "applicationItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKMostRecentSampleEndDateText(v2, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "applicationItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "overlayDisplayType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unitForDisplayType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  objc_msgSend(*(id *)(a1 + 40), "_stringValueFromQuantity:unit:isUnitIncludedInValue:", *(_QWORD *)(a1 + 48), v9, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_buildContextWithTime:value:isUnitIncludedInValue:", v5, v10, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setLastUpdatedContextItem:", v11);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (void)invalidateContextItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKInteractiveChartOverlayNamedDataSource *v9;
  HKInteractiveChartOverlayNamedDataSource *cacheDataSource;
  HKDisplayType *v11;
  HKDisplayType *overlayDisplayType;
  void *v13;
  HKDisplayTypeContextItem *v14;
  HKDisplayTypeContextItem *lastUpdatedContextItem;
  id v16;

  -[HKOverlayRoomViewControllerLastQuantityContext applicationItems](self, "applicationItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unitController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewControllerLastQuantityContext overlayChartController](self, "overlayChartController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryDisplayType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewControllerLastQuantityContext applicationItems](self, "applicationItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "healthStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewControllerLastQuantityContext _buildLastValueDataSourceWithUnitController:displayType:healthStore:](self, "_buildLastValueDataSourceWithUnitController:displayType:healthStore:", v4, v6, v8);
  v9 = (HKInteractiveChartOverlayNamedDataSource *)objc_claimAutoreleasedReturnValue();
  cacheDataSource = self->_cacheDataSource;
  self->_cacheDataSource = v9;

  -[HKOverlayRoomViewControllerLastQuantityContext _buildLastQuantityDisplayType](self, "_buildLastQuantityDisplayType");
  v11 = (HKDisplayType *)objc_claimAutoreleasedReturnValue();
  overlayDisplayType = self->_overlayDisplayType;
  self->_overlayDisplayType = v11;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewControllerLastQuantityContext _buildContextWithTime:value:isUnitIncludedInValue:](self, "_buildContextWithTime:value:isUnitIncludedInValue:", &stru_1E9C4C428, v13, 0);
  v14 = (HKDisplayTypeContextItem *)objc_claimAutoreleasedReturnValue();
  lastUpdatedContextItem = self->_lastUpdatedContextItem;
  self->_lastUpdatedContextItem = v14;

}

- (void)overlayWasExplicitlySelected:(id)a3 chartController:(id)a4
{
  objc_msgSend(a4, "scrollToMostRecentData", a3);
}

- (id)_buildLastQuantityDisplayType
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

  -[HKOverlayRoomViewControllerLastQuantityContext overlayChartController](self, "overlayChartController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryDisplayType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomViewControllerLastQuantityContext _colorForDisplayType:](self, "_colorForDisplayType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_interactiveChartsFormatterForTimeScope:", 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "setOverrideStatFormatterItemOptions:", &unk_1E9CE9C20);
  -[HKOverlayRoomViewControllerLastQuantityContext overlayChartController](self, "overlayChartController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewControllerLastQuantityContext applicationItems](self, "applicationItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayTypeController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayTypeForQuantityIdentifier:timeScope:displayTypeController:overlayColor:cacheDataSource:alternateLineSeries:alternateFormatter:seriesOptions:", v6, 5, v11, v7, self->_cacheDataSource, 0, v8, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_buildLastValueDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKMostRecentValueQuantityTypeDataSource *v11;
  void *v12;
  HKMostRecentValueQuantityTypeDataSource *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HKInteractiveChartOverlayNamedDataSource *v20;
  _QWORD v22[4];
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [HKMostRecentValueQuantityTypeDataSource alloc];
  -[HKInteractiveChartViewController currentCalendar](self->_overlayChartController, "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKMostRecentValueQuantityTypeDataSource initWithUnitController:displayType:healthStore:currentCalendar:attenuated:](v11, "initWithUnitController:displayType:healthStore:currentCalendar:attenuated:", v8, v9, v10, v12, self->_attenuated);

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __118__HKOverlayRoomViewControllerLastQuantityContext__buildLastValueDataSourceWithUnitController_displayType_healthStore___block_invoke;
  v22[3] = &unk_1E9C40260;
  v23 = v8;
  v24 = v9;
  v14 = v9;
  v15 = v8;
  -[HKQuantityTypeDataSource setUserInfoCreationBlock:](v13, "setUserInfoCreationBlock:", v22);
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v14, "objectType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("LAST_QUANTITY_CONTEXT_%@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[HKInteractiveChartOverlayNamedDataSource initWithDataSource:named:withContextTitleForTimeScope:]([HKInteractiveChartOverlayNamedDataSource alloc], "initWithDataSource:named:withContextTitleForTimeScope:", v13, v19, 0);
  return v20;
}

HKInteractiveChartSinglePointData *__118__HKOverlayRoomViewControllerLastQuantityContext__buildLastValueDataSourceWithUnitController_displayType_healthStore___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  HKInteractiveChartSinglePointData *v6;
  void *v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "unitForDisplayType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(HKInteractiveChartSinglePointData);
  objc_msgSend(v4, "mostRecentQuantity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v5);
  -[HKInteractiveChartSinglePointData setValue:](v6, "setValue:");

  -[HKInteractiveChartSinglePointData setUnit:](v6, "setUnit:", v5);
  -[HKInteractiveChartSinglePointData setRecordCount:](v6, "setRecordCount:", 1);
  objc_msgSend(v4, "statisticsInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartSinglePointData setStatisticsInterval:](v6, "setStatisticsInterval:", v8);
  return v6;
}

- (id)_buildContextWithTime:(id)a3 value:(id)a4 isUnitIncludedInValue:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  HKDisplayTypeContextItem *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[HKOverlayRoomViewControllerLastQuantityContext overlayChartController](self, "overlayChartController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "primaryDisplayType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(HKDisplayTypeContextItem);
  if (objc_msgSend(v8, "length"))
  {
    -[HKOverlayRoomViewControllerLastQuantityContext _buildFullTitle:](self, "_buildFullTitle:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextItem setTitle:](v12, "setTitle:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("LATEST_NO_TIME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextItem setTitle:](v12, "setTitle:", v14);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartOverlayAccessibilityIdentifier:", CFSTR("Latest"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setAccessibilityIdentifier:](v12, "setAccessibilityIdentifier:", v15);

  -[HKDisplayTypeContextItem setInfoHidden:](v12, "setInfoHidden:", 1);
  -[HKOverlayRoomViewControllerLastQuantityContext applicationItems](self, "applicationItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "unitController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedDisplayNameForDisplayType:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setUnit:](v12, "setUnit:", v18);

  -[HKDisplayTypeContextItem setUseTightSpacingBetweenValueAndUnit:](v12, "setUseTightSpacingBetweenValueAndUnit:", objc_msgSend(v11, "contextItemShouldUseTightSpacingBetweenValueAndUnit"));
  -[HKDisplayTypeContextItem setIsUnitIncludedInValue:](v12, "setIsUnitIncludedInValue:", v5);
  -[HKDisplayTypeContextItem setValue:](v12, "setValue:", v9);

  +[HKOverlayContextUtilities defaultMetricColorsForOverlayMode:](HKOverlayContextUtilities, "defaultMetricColorsForOverlayMode:", -[HKOverlayRoomViewControllerLastQuantityContext overlayMode](self, "overlayMode"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setMetricColors:](v12, "setMetricColors:", v19);

  +[HKOverlayContextUtilities selectedMetricColorsForCategory:](HKOverlayContextUtilities, "selectedMetricColorsForCategory:", objc_msgSend(v11, "categoryIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setSelectedMetricColors:](v12, "setSelectedMetricColors:", v20);

  return v12;
}

- (id)_buildFullTitle:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LATEST_WITH_TIME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_colorForDisplayType:(id)a3
{
  void *v3;
  void *v4;

  +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", objc_msgSend(a3, "categoryIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_stringValueFromQuantity:(id)a3 unit:(id)a4 isUnitIncludedInValue:(BOOL *)a5
{
  id v8;
  id v9;
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

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    -[HKOverlayRoomViewControllerLastQuantityContext overlayChartController](self, "overlayChartController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryDisplayType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "presentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "doubleValueForUnit:", v9);
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "adjustedValueForDaemonValue:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "hk_valueFormatterForUnit:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewControllerLastQuantityContext applicationItems](self, "applicationItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unitController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringFromValue:displayType:unitController:", v15, v11, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
      *a5 = 1;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  if (self == a3)
  {
    isKindOfClass = 1;
  }
  else
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (int64_t)overlayMode
{
  return self->_overlayMode;
}

- (void)setOverlayMode:(int64_t)a3
{
  self->_overlayMode = a3;
}

- (HKInteractiveChartOverlayViewController)overlayChartController
{
  return self->_overlayChartController;
}

- (void)setOverlayChartController:(id)a3
{
  objc_storeStrong((id *)&self->_overlayChartController, a3);
}

- (HKOverlayRoomApplicationItems)applicationItems
{
  return self->_applicationItems;
}

- (void)setApplicationItems:(id)a3
{
  objc_storeStrong((id *)&self->_applicationItems, a3);
}

- (HKDisplayType)overlayDisplayType
{
  return self->_overlayDisplayType;
}

- (void)setOverlayDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_overlayDisplayType, a3);
}

- (HKDisplayTypeContextItem)lastUpdatedContextItem
{
  return self->_lastUpdatedContextItem;
}

- (void)setLastUpdatedContextItem:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedContextItem, a3);
}

- (HKInteractiveChartOverlayNamedDataSource)cacheDataSource
{
  return self->_cacheDataSource;
}

- (void)setCacheDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDataSource, a3);
}

- (BOOL)attenuated
{
  return self->_attenuated;
}

- (void)setAttenuated:(BOOL)a3
{
  self->_attenuated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDataSource, 0);
  objc_storeStrong((id *)&self->_lastUpdatedContextItem, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_applicationItems, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
}

@end
