@implementation HKSleepStageDayAxis

- (id)_currentOrGregorianCalendar
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[HKDateAxis currentCalendar](self, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C996C8];
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C996C8]) & 1) != 0)
    -[HKDateAxis currentCalendar](self, "currentCalendar");
  else
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stringForDate:(id)a3 zoom:(int64_t)a4 labelType:(int64_t)a5
{
  id v8;
  os_log_t *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  os_log_t v18;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  int64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  _HKInitializeLogging();
  v9 = (os_log_t *)MEMORY[0x1E0CB5368];
  v10 = (void *)*MEMORY[0x1E0CB5368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEBUG))
  {
    v20 = v10;
    v21 = (void *)objc_opt_class();
    v22 = v21;
    objc_msgSend(v8, "description");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138544130;
    v30 = v21;
    v31 = 2114;
    v32 = v23;
    v33 = 2048;
    v34 = a4;
    v35 = 2048;
    v36 = a5;
    _os_log_debug_impl(&dword_1D7813000, v20, OS_LOG_TYPE_DEBUG, "[%{public}@] Determining string for date %{public}@ zoom %ld labelType %ld", (uint8_t *)&v29, 0x2Au);

  }
  v11 = 0;
  if (a4 == 6 && a5 != 2)
  {
    -[HKSleepStageDayAxis delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sleepDaySummaryForDate:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "hkui_somnogramChartDateInterval");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      -[HKSleepStageDayAxis _currentOrGregorianCalendar](self, "_currentOrGregorianCalendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v8, "hk_morningIndexWithCalendar:", v15);
      objc_msgSend(MEMORY[0x1E0CB3588], "hk_sleepDayIntervalForMorningIndex:calendar:", v16, v15);
      v17 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v17;
    }
    -[HKSleepStageDayAxis stringForDate:somnogramDateInterval:](self, "stringForDate:somnogramDateInterval:", v8, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v18 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      v24 = v18;
      v25 = (void *)objc_opt_class();
      v26 = v25;
      objc_msgSend(v8, "description");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "description");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138544130;
      v30 = v25;
      v31 = 2114;
      v32 = v11;
      v33 = 2114;
      v34 = (int64_t)v27;
      v35 = 2114;
      v36 = (int64_t)v28;
      _os_log_debug_impl(&dword_1D7813000, v24, OS_LOG_TYPE_DEBUG, "[%{public}@] Returning date label: %{public}@ axis date: %{public}@ summary: %{public}@", (uint8_t *)&v29, 0x2Au);

    }
  }

  return v11;
}

- (id)stringForDate:(id)a3 somnogramDateInterval:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDateAxis axisLabelIntervalComponentsForZoomLevelConfiguration:](self, "axisLabelIntervalComponentsForZoomLevelConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hour");

  objc_msgSend(v8, "canonicalSize");
  v12 = v11 / ((double)v10 * 3600.0);
  -[HKDateAxis currentCalendar](self, "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "component:fromDate:", 32, v7);

  objc_msgSend(v6, "duration");
  v16 = v15 / (double)(uint64_t)v12;
  objc_msgSend(v6, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "dateByAddingTimeInterval:", v16 * (double)(v14 / v10));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  HKLocalizedStringForDateAndTemplate(v18, 24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (HKSleepStageDayAxisDelegate)delegate
{
  return (HKSleepStageDayAxisDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
