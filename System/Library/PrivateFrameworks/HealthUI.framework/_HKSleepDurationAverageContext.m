@implementation _HKSleepDurationAverageContext

- (_HKSleepDurationAverageContext)initWithBaseDisplayType:(id)a3 overlayDisplayType:(id)a4 overlayChartController:(id)a5 useInBedAverage:(BOOL)a6 contextChangeDelegate:(id)a7 overlayAverageSeries:(id)a8 averageChartFormatter:(id)a9
{
  id v16;
  id v17;
  id v18;
  _HKSleepDurationAverageContext *v19;
  _HKSleepDurationAverageContext *v20;
  uint64_t v21;
  HKDisplayTypeContextItem *lastUpdatedItem;
  void *v23;
  uint64_t v24;
  HKUIMetricColors *metricColors;
  uint64_t v26;
  HKUIMetricColors *selectedMetricColors;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a3;
  v30 = a4;
  v29 = a5;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v32.receiver = self;
  v32.super_class = (Class)_HKSleepDurationAverageContext;
  v19 = -[_HKSleepDurationAverageContext init](&v32, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_baseDisplayType, a3);
    objc_storeStrong((id *)&v20->_overlayDisplayType, a4);
    objc_storeStrong((id *)&v20->_overlayChartController, a5);
    v20->_useInBedAverage = a6;
    objc_storeWeak((id *)&v20->_contextChangeDelegate, v16);
    objc_storeStrong((id *)&v20->_overlayAverageSeries, a8);
    objc_storeStrong((id *)&v20->_averageChartFormatter, a9);
    -[_HKSleepDurationAverageContext _contextItemWithDuration:timeScope:](v20, "_contextItemWithDuration:timeScope:", 5, -1.0);
    v21 = objc_claimAutoreleasedReturnValue();
    lastUpdatedItem = v20->_lastUpdatedItem;
    v20->_lastUpdatedItem = (HKDisplayTypeContextItem *)v21;

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUIMetricColors defaultContextViewColorsUsingColor:](HKUIMetricColors, "defaultContextViewColorsUsingColor:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    metricColors = v20->_metricColors;
    v20->_metricColors = (HKUIMetricColors *)v24;

    +[HKUIMetricColors sleepColors](HKUIMetricColors, "sleepColors");
    v26 = objc_claimAutoreleasedReturnValue();
    selectedMetricColors = v20->_selectedMetricColors;
    v20->_selectedMetricColors = (HKUIMetricColors *)v26;

  }
  return v20;
}

- (id)_contextItemWithDuration:(double)a3 timeScope:(int64_t)a4
{
  HKDisplayTypeContextItem *v7;
  BOOL v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = objc_alloc_init(HKDisplayTypeContextItem);
  v8 = -[_HKSleepDurationAverageContext useInBedAverage](self, "useInBedAverage");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a4 == 6)
  {
    if (v8)
      v11 = CFSTR("TIME_IN_BED");
    else
      v11 = CFSTR("TIME_ASLEEP");
    v12 = CFSTR("HealthUI-Localizable");
  }
  else
  {
    if (v8)
      v11 = CFSTR("SLEEP_AVERAGE_IN_BED");
    else
      v11 = CFSTR("SLEEP_AVERAGE_ASLEEP");
    v12 = CFSTR("HealthUI-Localizable-Eucalyptus");
  }
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1E9C4C428, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setTitle:](v7, "setTitle:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  if (-[_HKSleepDurationAverageContext useInBedAverage](self, "useInBedAverage"))
    v15 = CFSTR("TIME_IN_BED");
  else
    v15 = CFSTR("TIME_ASLEEP");
  objc_msgSend(v14, "hk_chartOverlayAccessibilityIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", v16);

  -[HKDisplayTypeContextItem setInfoHidden:](v7, "setInfoHidden:", 1);
  -[HKDisplayTypeContextItem setUnit:](v7, "setUnit:", &stru_1E9C4C428);
  -[_HKSleepDurationAverageContext _attributedTitleOverrideWithDuration:](self, "_attributedTitleOverrideWithDuration:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setAttributedLabelTextOverride:](v7, "setAttributedLabelTextOverride:", v17);

  -[_HKSleepDurationAverageContext metricColors](self, "metricColors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setMetricColors:](v7, "setMetricColors:", v18);

  -[_HKSleepDurationAverageContext selectedMetricColors](self, "selectedMetricColors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setSelectedMetricColors:](v7, "setSelectedMetricColors:", v19);

  return v7;
}

- (id)_attributedTitleOverrideWithDuration:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[_HKSleepDurationAverageContext _attributedDurationStringFromDuration:isSelected:](self, "_attributedDurationStringFromDuration:isSelected:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKSleepDurationAverageContext _attributedDurationStringFromDuration:isSelected:](self, "_attributedDurationStringFromDuration:isSelected:", 1, a3);
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
    -[_HKSleepDurationAverageContext selectedMetricColors](self, "selectedMetricColors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contextViewPrimaryTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_HKSleepDurationAverageContext selectedMetricColors](self, "selectedMetricColors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contextViewPrimaryTextColor");
  }
  else
  {
    -[_HKSleepDurationAverageContext metricColors](self, "metricColors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contextViewPrimaryTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_HKSleepDurationAverageContext metricColors](self, "metricColors");
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

- (double)_averageValueFromChartPoints:(id)a3 useInBedAverage:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  BOOL v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5 || !objc_msgSend(v5, "count"))
    goto LABEL_20;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v8)
  {

LABEL_20:
    v17 = -1.0;
    goto LABEL_21;
  }
  v9 = v8;
  v10 = *(_QWORD *)v20;
  v11 = 0.0;
  v12 = 0.0;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v20 != v10)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      if (v4)
        objc_msgSend(v14, "inBedValue");
      else
        objc_msgSend(v14, "asleepValue", (_QWORD)v19);
      v16 = v15 <= 2.22044605e-16;
      if (v15 <= 2.22044605e-16)
        v15 = -0.0;
      v11 = v11 + v15;
      if (!v16)
        v12 = v12 + 1.0;
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v9);

  if (v12 == 0.0)
    goto LABEL_20;
  v17 = v11 / v12;
LABEL_21:

  return v17;
}

- (id)_averagePhraseFromAverageValue:(double)a3 shortForm:(BOOL)a4 timeScope:(int64_t)a5
{
  void *v5;
  uint64_t v6;
  __int16 v7;
  void *v8;

  if (a3 == -1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"), a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SLEEP_DURATION_NO_DATA_CONTEXT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
      v7 = 8;
    else
      v7 = 12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HKTimePeriodString(v5, v7);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;

  return v8;
}

- (id)sampleTypeForDateRangeUpdates
{
  return 0;
}

- (BOOL)unselectedContextShouldUseContextBaseType
{
  return 0;
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
  -[_HKSleepDurationAverageContext overlayDisplayType](self, "overlayDisplayType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_HKSleepDurationAverageContext overlayDisplayType](self, "overlayDisplayType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKSleepDurationAverageContext overlayChartController](self, "overlayChartController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "graphSeriesForTimeScope:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __117___HKSleepDurationAverageContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
    v19[3] = &unk_1E9C41238;
    v19[4] = self;
    v21 = a5;
    v20 = v11;
    objc_msgSend(v15, "cachedDataForCustomGraphSeries:timeScope:resolution:startDate:endDate:completion:", v16, a5, 0, v17, v18, v19);

  }
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (void)_updateRangeDataWithChartPoints:(id)a3 useInBedAverage:(BOOL)a4 isHighlighted:(BOOL)a5 timeScope:(int64_t)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  double v10;
  double v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v7 = a5;
  v8 = a4;
  v18 = a3;
  -[_HKSleepDurationAverageContext _averageValueFromChartPoints:useInBedAverage:](self, "_averageValueFromChartPoints:useInBedAverage:");
  v11 = v10;
  if (v10 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v18, "hk_mapToSet:", &__block_literal_global_668);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (unint64_t)objc_msgSend(v13, "count") > 1;
  -[_HKSleepDurationAverageContext averageChartFormatter](self, "averageChartFormatter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCurrentVisibleAverageNumber:isTimeInBed:isHighlighted:useAverageCopy:", v12, v8, v7, v14);

  if (v7)
  {
    -[_HKSleepDurationAverageContext overlayAverageSeries](self, "overlayAverageSeries");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAverageValue:", v11);

    -[_HKSleepDurationAverageContext _contextItemWithDuration:timeScope:](self, "_contextItemWithDuration:timeScope:", a6, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKSleepDurationAverageContext setLastUpdatedItem:](self, "setLastUpdatedItem:", v17);

  }
}

- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a3;
  v7 = a5;
  -[_HKSleepDurationAverageContext contextChangeDelegate](self, "contextChangeDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDurationContextSelected:", v5);

  objc_msgSend(v7, "selectedTimeScopeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "selectedTimeScope");
  -[_HKSleepDurationAverageContext _findSleepDurationSeriesForTimeScope:](self, "_findSleepDurationSeriesForTimeScope:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = v11;
    if (-[_HKSleepDurationAverageContext useInBedAverage](self, "useInBedAverage"))
      objc_msgSend(v12, "setHideAsleepData:", v5);
    else
      objc_msgSend(v12, "setHideInBedData:", v5);
    v11 = v12;
  }

}

- (id)_findSleepDurationSeriesForTimeScope:(int64_t)a3
{
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  id v9;

  -[_HKSleepDurationAverageContext baseDisplayType](self, "baseDisplayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_HKSleepDurationAverageContext baseDisplayType](self, "baseDisplayType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "graphSeriesForTimeScope:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }
  return v9;
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

- (BOOL)useInBedAverage
{
  return self->_useInBedAverage;
}

- (_HKSleepDurationAverageFormatter)averageChartFormatter
{
  return self->_averageChartFormatter;
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

- (_HKSleepDurationAverageSeries)overlayAverageSeries
{
  return self->_overlayAverageSeries;
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
  objc_storeStrong((id *)&self->_overlayAverageSeries, 0);
  objc_destroyWeak((id *)&self->_contextChangeDelegate);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
  objc_storeStrong((id *)&self->_averageChartFormatter, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
}

@end
