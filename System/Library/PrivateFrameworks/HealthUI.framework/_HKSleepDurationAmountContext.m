@implementation _HKSleepDurationAmountContext

- (_HKSleepDurationAmountContext)initWithBaseDisplayType:(id)a3 overlayChartController:(id)a4 contextChangeDelegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  _HKSleepDurationAmountContext *v12;
  _HKSleepDurationAmountContext *v13;
  uint64_t v14;
  HKDisplayTypeContextItem *lastUpdatedItem;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_HKSleepDurationAmountContext;
  v12 = -[_HKSleepDurationAmountContext init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_overlayChartController, a4);
    objc_storeStrong((id *)&v13->_baseDisplayType, a3);
    objc_storeWeak((id *)&v13->_contextChangeDelegate, v11);
    -[_HKSleepDurationAmountContext _contextItemWithAmountString:](v13, "_contextItemWithAmountString:", &stru_1E9C4C428);
    v14 = objc_claimAutoreleasedReturnValue();
    lastUpdatedItem = v13->_lastUpdatedItem;
    v13->_lastUpdatedItem = (HKDisplayTypeContextItem *)v14;

  }
  return v13;
}

- (id)_contextItemWithAmountString:(id)a3
{
  id v3;
  HKDisplayTypeContextItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(HKDisplayTypeContextItem);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SLEEP_DURATION_AMOUNTS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setTitle:](v4, "setTitle:", v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartOverlayAccessibilityIdentifier:", CFSTR("SLEEP_DURATION_AMOUNTS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

  -[HKDisplayTypeContextItem setInfoHidden:](v4, "setInfoHidden:", 1);
  -[HKDisplayTypeContextItem setUnit:](v4, "setUnit:", &stru_1E9C4C428);
  -[HKDisplayTypeContextItem setValue:](v4, "setValue:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUIMetricColors defaultContextViewColorsUsingColor:](HKUIMetricColors, "defaultContextViewColorsUsingColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setMetricColors:](v4, "setMetricColors:", v9);

  +[HKUIMetricColors sleepColors](HKUIMetricColors, "sleepColors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setSelectedMetricColors:](v4, "setSelectedMetricColors:", v10);

  return v4;
}

- (id)_daysWithSleepDataFromChartPoints:(id)a3
{
  id v3;
  void *v4;
  _HKSleepDurationAmountCounts *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  double v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = objc_alloc_init(_HKSleepDurationAmountCounts);
    -[_HKSleepDurationAmountCounts setDaysWithSleepData:](v5, "setDaysWithSleepData:", 0);
    -[_HKSleepDurationAmountCounts setTotalDays:](v5, "setTotalDays:", 0);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = v11;
            objc_msgSend(v12, "inBedValue", (_QWORD)v16);
            if (v13 > 2.22044605e-16 || (objc_msgSend(v12, "asleepValue"), v14 > 2.22044605e-16))
              -[_HKSleepDurationAmountCounts setDaysWithSleepData:](v5, "setDaysWithSleepData:", -[_HKSleepDurationAmountCounts daysWithSleepData](v5, "daysWithSleepData") + 1);
            -[_HKSleepDurationAmountCounts setTotalDays:](v5, "setTotalDays:", -[_HKSleepDurationAmountCounts totalDays](v5, "totalDays") + 1);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_amountStringFromCounts:(id)a3 timeScope:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;

  v5 = a3;
  if (v5)
  {
    HKIntegerFormatter();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "daysWithSleepData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromNumber:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    switch(a4)
    {
      case 0:
      case 1:
      case 2:
      case 7:
      case 8:
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("UNSUPPORTED_SLEEP_COUNT"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 3:
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = CFSTR("SLEEP_AMOUNTS_WEEKS");
        goto LABEL_8;
      case 4:
      case 5:
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = CFSTR("SLEEP_AMOUNTS_DAYS");
LABEL_8:
        objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringWithFormat:", v15, objc_msgSend(v5, "totalDays"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      case 6:
        v20 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SLEEP_AMOUNTS_SINGLE_DAY_COUNT_%d"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringWithFormat:", v17, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      default:
        v9 = 0;
LABEL_9:
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SLEEP_AMOUNTS_DAY_COUNT_%@_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", v18, v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
        break;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SLEEP_AVERAGE_NO_DAY_COUNTS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)sampleTypeForDateRangeUpdates
{
  return 0;
}

- (id)overlayDisplayTypeForTimeScope:(int64_t)a3
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
  -[_HKSleepDurationAmountContext baseDisplayType](self, "baseDisplayType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_HKSleepDurationAmountContext baseDisplayType](self, "baseDisplayType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKSleepDurationAmountContext overlayChartController](self, "overlayChartController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "graphSeriesForTimeScope:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __116___HKSleepDurationAmountContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
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

- (BOOL)unselectedContextShouldUseContextBaseType
{
  return 0;
}

- (HKInteractiveChartOverlayViewController)overlayChartController
{
  return self->_overlayChartController;
}

- (HKDisplayType)baseDisplayType
{
  return self->_baseDisplayType;
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contextChangeDelegate);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
}

@end
