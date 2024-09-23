@implementation HKSleepStageDurationContext

- (HKSleepStageDurationContext)initWithBaseDisplayType:(id)a3 overlayDisplayType:(id)a4 overlayChartController:(id)a5 contextChangeDelegate:(id)a6 sleepValue:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HKSleepStageDurationContext *v17;
  HKSleepStageDurationContext *v18;
  uint64_t v19;
  HKDisplayTypeContextItem *lastUpdatedItem;
  void *v21;
  uint64_t v22;
  HKUIMetricColors *metricColors;
  uint64_t v24;
  HKUIMetricColors *selectedMetricColors;
  objc_super v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HKSleepStageDurationContext;
  v17 = -[HKSleepStageDurationContext init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_overlayChartController, a5);
    objc_storeStrong((id *)&v18->_baseDisplayType, a3);
    objc_storeStrong((id *)&v18->_overlayDisplayType, a4);
    objc_storeWeak((id *)&v18->_contextChangeDelegate, v16);
    v18->_sleepValue = a7;
    -[HKSleepStageDurationContext _contextItemWithDuration:timeScope:](v18, "_contextItemWithDuration:timeScope:", 5, -1.0);
    v19 = objc_claimAutoreleasedReturnValue();
    lastUpdatedItem = v18->_lastUpdatedItem;
    v18->_lastUpdatedItem = (HKDisplayTypeContextItem *)v19;

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUIMetricColors defaultContextViewColorsUsingColor:](HKUIMetricColors, "defaultContextViewColorsUsingColor:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    metricColors = v18->_metricColors;
    v18->_metricColors = (HKUIMetricColors *)v22;

    +[HKUIMetricColors sleepColorsForSleepAnalysis:](HKUIMetricColors, "sleepColorsForSleepAnalysis:", a7);
    v24 = objc_claimAutoreleasedReturnValue();
    selectedMetricColors = v18->_selectedMetricColors;
    v18->_selectedMetricColors = (HKUIMetricColors *)v24;

  }
  return v18;
}

- (id)_contextItemWithDuration:(double)a3 timeScope:(int64_t)a4
{
  HKDisplayTypeContextItem *v7;
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

  v7 = objc_alloc_init(HKDisplayTypeContextItem);
  +[HKSleepUtilities sleepStageContextTitleForSleepValue:timeScope:](HKSleepUtilities, "sleepStageContextTitleForSleepValue:timeScope:", -[HKSleepStageDurationContext sleepValue](self, "sleepValue"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setTitle:](v7, "setTitle:", v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[HKDisplayTypeContextItem title](v7, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_chartOverlayAccessibilityIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepColorForSleepAnalysis:", -[HKSleepStageDurationContext sleepValue](self, "sleepValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKDisplayTypeContextItemTitleAccessory titleAccessoryWithImagedNamed:imageColor:](HKDisplayTypeContextItemTitleAccessory, "titleAccessoryWithImagedNamed:imageColor:", CFSTR("circle.fill"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setTitleAccessory:](v7, "setTitleAccessory:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepPrimaryTextColorForSleepAnalysis:", -[HKSleepStageDurationContext sleepValue](self, "sleepValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKDisplayTypeContextItemTitleAccessory titleAccessoryWithImagedNamed:imageColor:](HKDisplayTypeContextItemTitleAccessory, "titleAccessoryWithImagedNamed:imageColor:", CFSTR("circle"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setSelectedTitleAccessory:](v7, "setSelectedTitleAccessory:", v15);

  -[HKDisplayTypeContextItem setInfoHidden:](v7, "setInfoHidden:", 1);
  -[HKDisplayTypeContextItem setUnit:](v7, "setUnit:", &stru_1E9C4C428);
  -[HKSleepStageDurationContext _attributedTitleOverrideWithDuration:](self, "_attributedTitleOverrideWithDuration:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setAttributedLabelTextOverride:](v7, "setAttributedLabelTextOverride:", v16);

  -[HKSleepStageDurationContext metricColors](self, "metricColors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setMetricColors:](v7, "setMetricColors:", v17);

  -[HKSleepStageDurationContext selectedMetricColors](self, "selectedMetricColors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setSelectedMetricColors:](v7, "setSelectedMetricColors:", v18);

  return v7;
}

- (id)sampleTypeForDateRangeUpdates
{
  return 0;
}

- (BOOL)unselectedContextShouldUseContextBaseType
{
  return 0;
}

- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  _BOOL8 v5;
  id v6;

  v5 = a3;
  -[HKSleepStageDurationContext contextChangeDelegate](self, "contextChangeDelegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStageDurationContextSelected:", v5);

}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v10;
  id v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  int64_t v21;

  v10 = a3;
  v11 = a7;
  -[HKSleepStageDurationContext baseDisplayType](self, "baseDisplayType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HKSleepStageDurationContext baseDisplayType](self, "baseDisplayType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepStageDurationContext overlayChartController](self, "overlayChartController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "graphSeriesForTimeScope:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __114__HKSleepStageDurationContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
    v19[3] = &unk_1E9C41238;
    v19[4] = self;
    v21 = a5;
    v20 = v11;
    objc_msgSend(v15, "cachedDataForCustomGraphSeries:timeScope:resolution:startDate:endDate:completion:", v16, a5, 0, v17, v18, v19);

  }
}

uint64_t __114__HKSleepStageDurationContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;

  if (!a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_computeAverageValueFromChartPoints:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_contextItemWithDuration:timeScope:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLastUpdatedItem:", v4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (double)_computeAverageValueFromChartPoints:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  _QWORD v12[5];

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "hk_mapToSet:", &__block_literal_global_75);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "allObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __67__HKSleepStageDurationContext__computeAverageValueFromChartPoints___block_invoke_2;
      v12[3] = &unk_1E9C45718;
      v12[4] = self;
      objc_msgSend(v7, "hk_averageUsingEvaluationBlock:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v10 = v9;

    }
    else
    {
      v10 = -1.0;
    }

  }
  else
  {
    v10 = -1.0;
  }

  return v10;
}

id __67__HKSleepStageDurationContext__computeAverageValueFromChartPoints___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepDaySummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "hasSleepStageData"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

double __67__HKSleepStageDurationContext__computeAverageValueFromChartPoints___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  double v4;
  double v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "hkui_durationForSleepCategoryValue:", objc_msgSend(v2, "sleepValue"));
  v5 = v4;

  return v5;
}

- (id)_attributedTitleOverrideWithDuration:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[HKSleepStageDurationContext _attributedDurationStringFromDuration:isSelected:](self, "_attributedDurationStringFromDuration:isSelected:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepStageDurationContext _attributedDurationStringFromDuration:isSelected:](self, "_attributedDurationStringFromDuration:isSelected:", 1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKDisplayTypeContextItemAttributedLabelOverride attributedLabelOverrideWithText:selectedText:](HKDisplayTypeContextItemAttributedLabelOverride, "attributedLabelOverrideWithText:selectedText:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_attributedDurationStringFromDuration:(double)a3 isSelected:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a4)
  {
    -[HKSleepStageDurationContext selectedMetricColors](self, "selectedMetricColors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contextViewPrimaryTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKSleepStageDurationContext selectedMetricColors](self, "selectedMetricColors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contextViewPrimaryTextColor");
  }
  else
  {
    -[HKSleepStageDurationContext metricColors](self, "metricColors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contextViewPrimaryTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKSleepStageDurationContext metricColors](self, "metricColors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contextViewSecondaryTextColor");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartOverlaySectionItemValueAndUnitFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKAttributedDurationFormatter formattedValueWithDuration:unitsStyle:font:valueColor:unitColor:](HKAttributedDurationFormatter, "formattedValueWithDuration:unitsStyle:font:valueColor:unitColor:", 0, v11, v7, v10, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (HKInteractiveChartOverlayViewController)overlayChartController
{
  return self->_overlayChartController;
}

- (HKDisplayType)baseDisplayType
{
  return self->_baseDisplayType;
}

- (HKDisplayType)overlayDisplayType
{
  return self->_overlayDisplayType;
}

- (int64_t)sleepValue
{
  return self->_sleepValue;
}

- (HKDisplayTypeContextItem)lastUpdatedItem
{
  return self->_lastUpdatedItem;
}

- (void)setLastUpdatedItem:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedItem, a3);
}

- (HKOverlaySleepRoomContextChangeDelegate)contextChangeDelegate
{
  return (HKOverlaySleepRoomContextChangeDelegate *)objc_loadWeakRetained((id *)&self->_contextChangeDelegate);
}

- (HKUIMetricColors)metricColors
{
  return self->_metricColors;
}

- (HKUIMetricColors)selectedMetricColors
{
  return self->_selectedMetricColors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedMetricColors, 0);
  objc_storeStrong((id *)&self->_metricColors, 0);
  objc_destroyWeak((id *)&self->_contextChangeDelegate);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
}

@end
