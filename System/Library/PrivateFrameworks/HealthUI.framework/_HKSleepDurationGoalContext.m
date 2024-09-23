@implementation _HKSleepDurationGoalContext

- (_HKSleepDurationGoalContext)initWithBaseDisplayType:(id)a3 overlayDisplayType:(id)a4 overlayChartController:(id)a5 overlayMode:(int64_t)a6 isPrimaryContext:(BOOL)a7 contextChangeDelegate:(id)a8
{
  id v15;
  id v16;
  id v17;
  _HKSleepDurationGoalContext *v18;
  _HKSleepDurationGoalContext *v19;
  uint64_t v20;
  HKDisplayTypeContextItem *lastUpdatedItem;
  uint64_t v22;
  HKSampleType *monitoringSampleType;
  id v25;
  objc_super v26;

  v25 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)_HKSleepDurationGoalContext;
  v18 = -[_HKSleepDurationGoalContext init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_baseDisplayType, a3);
    objc_storeStrong((id *)&v19->_overlayChartController, a5);
    objc_storeStrong((id *)&v19->_overlayDisplayType, a4);
    v19->_overlayMode = a6;
    v19->_isPrimaryContext = a7;
    -[_HKSleepDurationGoalContext _durationContextItemWithGoal:](v19, "_durationContextItemWithGoal:", &stru_1E9C4C428);
    v20 = objc_claimAutoreleasedReturnValue();
    lastUpdatedItem = v19->_lastUpdatedItem;
    v19->_lastUpdatedItem = (HKDisplayTypeContextItem *)v20;

    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB7150]);
    v22 = objc_claimAutoreleasedReturnValue();
    monitoringSampleType = v19->_monitoringSampleType;
    v19->_monitoringSampleType = (HKSampleType *)v22;

    objc_storeWeak((id *)&v19->_contextChangeDelegate, v17);
  }

  return v19;
}

- (id)baseDisplayTypeForOverlay:(int64_t)a3
{
  void *v4;

  if (-[_HKSleepDurationGoalContext isPrimaryContext](self, "isPrimaryContext", a3))
  {
    v4 = 0;
  }
  else
  {
    -[_HKSleepDurationGoalContext baseDisplayType](self, "baseDisplayType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
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

  v10 = a3;
  v11 = a7;
  -[_HKSleepDurationGoalContext overlayDisplayType](self, "overlayDisplayType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_HKSleepDurationGoalContext overlayDisplayType](self, "overlayDisplayType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKSleepDurationGoalContext overlayChartController](self, "overlayChartController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "graphSeriesForTimeScope:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __114___HKSleepDurationGoalContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
    v19[3] = &unk_1E9C40570;
    v19[4] = self;
    v20 = v11;
    objc_msgSend(v15, "cachedDataForCustomGraphSeries:timeScope:resolution:startDate:endDate:completion:", v16, a5, 0, v17, v18, v19);

  }
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  _BOOL8 v5;
  id v6;

  v5 = a3;
  -[_HKSleepDurationGoalContext contextChangeDelegate](self, "contextChangeDelegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDurationContextSelected:", v5);

}

- (id)_durationContextItemWithGoal:(id)a3
{
  id v4;
  HKDisplayTypeContextItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = objc_alloc_init(HKDisplayTypeContextItem);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SLEEP_GOAL_CONTEXT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setTitle:](v5, "setTitle:", v7);

  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartOverlayAccessibilityIdentifier:", CFSTR("SLEEP_GOAL_CONTEXT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

  -[HKDisplayTypeContextItem setInfoHidden:](v5, "setInfoHidden:", 1);
  -[HKDisplayTypeContextItem setUnit:](v5, "setUnit:", &stru_1E9C4C428);
  -[HKDisplayTypeContextItem setValue:](v5, "setValue:", v4);

  if (-[_HKSleepDurationGoalContext overlayMode](self, "overlayMode") != 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[_HKSleepDurationGoalContext contextChangeDelegate](self, "contextChangeDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "shouldHighlightBaseDisplayContext") & 1) == 0)
  {

    goto LABEL_7;
  }
  -[_HKSleepDurationGoalContext contextChangeDelegate](self, "contextChangeDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "baseDisplayIsSchedule");

  if ((v11 & 1) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepOverlayTintColor");
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v13 = (void *)v12;
  +[HKUIMetricColors defaultContextViewColorsUsingColor:](HKUIMetricColors, "defaultContextViewColorsUsingColor:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setMetricColors:](v5, "setMetricColors:", v14);

  +[HKUIMetricColors sleepColors](HKUIMetricColors, "sleepColors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setSelectedMetricColors:](v5, "setSelectedMetricColors:", v15);

  return v5;
}

- (id)_goalGivenChartPoints:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "goalValue", (_QWORD)v19);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              objc_msgSend(v5, "addObject:", v12);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
    {
      if ((unint64_t)objc_msgSend(v5, "count") < 2)
      {
        objc_msgSend(v5, "anyObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        HKTimePeriodString(v14, 12);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("SLEEP_MULTIPLE_GOAL_CONTEXT");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("SLEEP_NO_GOAL_CONTEXT");
    }
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"), (_QWORD)v19);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v16 = (void *)v17;

    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SLEEP_NO_GOAL_CONTEXT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v16;
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

- (int64_t)overlayMode
{
  return self->_overlayMode;
}

- (BOOL)isPrimaryContext
{
  return self->_isPrimaryContext;
}

- (HKDisplayTypeContextItem)lastUpdatedItem
{
  return self->_lastUpdatedItem;
}

- (void)setLastUpdatedItem:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedItem, a3);
}

- (HKSampleType)monitoringSampleType
{
  return self->_monitoringSampleType;
}

- (void)setMonitoringSampleType:(id)a3
{
  objc_storeStrong((id *)&self->_monitoringSampleType, a3);
}

- (HKOverlaySleepRoomContextChangeDelegate)contextChangeDelegate
{
  return (HKOverlaySleepRoomContextChangeDelegate *)objc_loadWeakRetained((id *)&self->_contextChangeDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contextChangeDelegate);
  objc_storeStrong((id *)&self->_monitoringSampleType, 0);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
}

@end
