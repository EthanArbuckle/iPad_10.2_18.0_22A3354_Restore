@implementation _HKSleepScheduleContext

- (_HKSleepScheduleContext)initWithBaseDisplayType:(id)a3 overlayDisplayType:(id)a4 overlayChartController:(id)a5 overlayMode:(int64_t)a6 isPrimaryContext:(BOOL)a7 contextChangeDelegate:(id)a8
{
  id v15;
  id v16;
  id v17;
  _HKSleepScheduleContext *v18;
  _HKSleepScheduleContext *v19;
  uint64_t v20;
  HKSampleType *monitoringSampleType;
  uint64_t v22;
  HKDisplayTypeContextItem *lastUpdatedItem;
  id v25;
  objc_super v26;

  v25 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)_HKSleepScheduleContext;
  v18 = -[_HKSleepScheduleContext init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_baseDisplayType, a3);
    objc_storeStrong((id *)&v19->_overlayDisplayType, a4);
    objc_storeStrong((id *)&v19->_overlayChartController, a5);
    v19->_overlayMode = a6;
    v19->_isPrimaryContext = a7;
    objc_msgSend(MEMORY[0x1E0CB6978], "sleepScheduleType");
    v20 = objc_claimAutoreleasedReturnValue();
    monitoringSampleType = v19->_monitoringSampleType;
    v19->_monitoringSampleType = (HKSampleType *)v20;

    objc_storeWeak((id *)&v19->_contextChangeDelegate, v17);
    -[_HKSleepScheduleContext _scheduleContextItemWithPhrase:](v19, "_scheduleContextItemWithPhrase:", &stru_1E9C4C428);
    v22 = objc_claimAutoreleasedReturnValue();
    lastUpdatedItem = v19->_lastUpdatedItem;
    v19->_lastUpdatedItem = (HKDisplayTypeContextItem *)v22;

  }
  return v19;
}

- (id)baseDisplayTypeForOverlay:(int64_t)a3
{
  void *v4;

  if (-[_HKSleepScheduleContext isPrimaryContext](self, "isPrimaryContext", a3))
  {
    v4 = 0;
  }
  else
  {
    -[_HKSleepScheduleContext baseDisplayType](self, "baseDisplayType");
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
  -[_HKSleepScheduleContext baseDisplayType](self, "baseDisplayType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_HKSleepScheduleContext baseDisplayType](self, "baseDisplayType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKSleepScheduleContext overlayChartController](self, "overlayChartController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "graphSeriesForTimeScope:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __110___HKSleepScheduleContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
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
  -[_HKSleepScheduleContext contextChangeDelegate](self, "contextChangeDelegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScheduleContextSelected:", v5);

}

- (id)_schedulePhraseFromChartPoints:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v25 = v5;
    v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = v11;
            objc_msgSend(v12, "upperGoal");
            v13 = objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              v14 = (void *)v13;
              objc_msgSend(v12, "lowerGoal");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {
                objc_msgSend(v12, "upperGoal");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "lowerGoal");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[_HKSleepScheduleContext _schedulePhraseFromUpperGoal:lowerGoal:](self, "_schedulePhraseFromUpperGoal:lowerGoal:", v16, v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (v18)
                  objc_msgSend(v26, "addObject:", v18);

              }
            }

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v8);
    }

    v19 = v26;
    if (objc_msgSend(v26, "count"))
    {
      if ((unint64_t)objc_msgSend(v26, "count") < 2)
      {
        objc_msgSend(v26, "anyObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = CFSTR("SLEEP_MULTIPLE_SCHEDULES");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = CFSTR("SLEEP_NO_SCHEDULE");
    }
    objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"), v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
    v5 = v25;
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("SLEEP_NO_SCHEDULE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v23;
}

- (id)_scheduleContextItemWithPhrase:(id)a3
{
  id v4;
  HKDisplayTypeContextItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = objc_alloc_init(HKDisplayTypeContextItem);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SLEEP_SCHEDULE_CONTEXT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setTitle:](v5, "setTitle:", v7);

  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartOverlayAccessibilityIdentifier:", CFSTR("SLEEP_SCHEDULE_CONTEXT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

  -[HKDisplayTypeContextItem setInfoHidden:](v5, "setInfoHidden:", 1);
  -[HKDisplayTypeContextItem setUnit:](v5, "setUnit:", &stru_1E9C4C428);
  -[HKDisplayTypeContextItem setValue:](v5, "setValue:", v4);

  if (-[_HKSleepScheduleContext overlayMode](self, "overlayMode") != 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[_HKSleepScheduleContext contextChangeDelegate](self, "contextChangeDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "shouldHighlightBaseDisplayContext") & 1) == 0)
  {

    goto LABEL_7;
  }
  -[_HKSleepScheduleContext contextChangeDelegate](self, "contextChangeDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "baseDisplayIsSchedule");

  if (!v11)
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

- (id)_schedulePhraseFromUpperGoal:(id)a3 lowerGoal:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[_HKSleepScheduleContext _stringFromGoalOffset:](self, "_stringFromGoalOffset:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKSleepScheduleContext _stringFromGoalOffset:](self, "_stringFromGoalOffset:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SLEEP_SCHEDULE_PHRASE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v11, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_stringFromGoalOffset:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKCalendarDateTransformPreceding6PM();
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *))v6)[2](v6, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "doubleValue");
  v10 = v9;

  objc_msgSend(v8, "dateByAddingTimeInterval:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate(v11, 27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (HKDisplayTypeContextItem)lastUpdatedItem
{
  return self->_lastUpdatedItem;
}

- (void)setLastUpdatedItem:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedItem, a3);
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

- (HKInteractiveChartOverlayViewController)overlayChartController
{
  return self->_overlayChartController;
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
  objc_storeStrong((id *)&self->_overlayChartController, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
}

@end
