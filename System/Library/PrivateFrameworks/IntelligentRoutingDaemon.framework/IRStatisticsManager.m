@implementation IRStatisticsManager

- (void)contextChangedWithReason:(id)a3 mode:(int64_t)a4 miloPrediction:(id)a5 date:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "isEqual:", CFSTR("App in focus")))
  {
    -[IRStatisticsManager setAppLaunchDate:](self, "setAppLaunchDate:", v12);
    -[IRStatisticsManager setTimeToBannerInMilliSeconds:](self, "setTimeToBannerInMilliSeconds:", 0);
  }
  if (-[IRStatisticsManager _isAllowedToCollectStatisticsForDate:](self, "_isAllowedToCollectStatisticsForDate:", v12))
  {
    -[IRStatisticsManager _updateMiLoStatisticsIfNeededWithReason:mode:miloPrediction:](self, "_updateMiLoStatisticsIfNeededWithReason:mode:miloPrediction:", v10, a4, v11);
    -[IRStatisticsManager _updateModeStatisticsIfNeededWithReason:mode:date:](self, "_updateModeStatisticsIfNeededWithReason:mode:date:", v10, a4, v12);
    -[IRStatisticsManager store](self, "store");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRStatisticsManager statistics](self, "statistics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "updateStatistics:", v14);

    if ((v15 & 1) == 0)
    {
      dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      {
        v18 = 136315394;
        v19 = "#statistics-manager, ";
        v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_23FFBA000, v17, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Statistics update error context] Couldnt update statistics upon context change", (uint8_t *)&v18, 0x16u);
      }

    }
  }

}

- (IRServiceStore)store
{
  return self->_store;
}

- (void)_updateModeStatisticsIfNeededWithReason:(id)a3 mode:(int64_t)a4 date:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a5;
  if (a4 == 1)
  {
    if ((objc_msgSend(v19, "isEqual:", CFSTR("Request current context")) & 1) == 0)
    {
      -[IRStatisticsManager statistics](self, "statistics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IRStatisticsManager statistics](self, "statistics");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "copyWithReplacementNumberOfContextChanges:", objc_msgSend(v10, "numberOfContextChanges") + 1);
      -[IRStatisticsManager setStatistics:](self, "setStatistics:", v11);

    }
    if (!-[IRStatisticsManager mode](self, "mode"))
    {
      -[IRStatisticsManager setMode:](self, "setMode:", 1);
      -[IRStatisticsManager setModeDate:](self, "setModeDate:", v8);
    }
  }
  else
  {
    -[IRStatisticsManager mode](self, "mode");
  }
  v12 = -[IRStatisticsManager mode](self, "mode");
  if (!a4 && v12 == 1)
  {
    -[IRStatisticsManager setMode:](self, "setMode:", 0);
    -[IRStatisticsManager statistics](self, "statistics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRStatisticsManager statistics](self, "statistics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "timeInUpdatesModeInSeconds");
    -[IRStatisticsManager modeDate](self, "modeDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v16);
    v18 = (void *)objc_msgSend(v13, "copyWithReplacementTimeInUpdatesModeInSeconds:", v15 + (uint64_t)v17);
    -[IRStatisticsManager setStatistics:](self, "setStatistics:", v18);

  }
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)_updateMiLoStatisticsIfNeededWithReason:(id)a3 mode:(int64_t)a4 miloPrediction:(id)a5
{
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a5;
  if (objc_msgSend(a3, "isEqual:", CFSTR("MiLo prediction"))
    && objc_msgSend(v23, "canLabel"))
  {
    -[IRStatisticsManager statistics](self, "statistics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRStatisticsManager statistics](self, "statistics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "copyWithReplacementNumberOfMiLoPredictions:", objc_msgSend(v9, "numberOfMiLoPredictions") + 1);
    -[IRStatisticsManager setStatistics:](self, "setStatistics:", v10);

    if (a4 == 1)
    {
      -[IRStatisticsManager statistics](self, "statistics");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IRStatisticsManager statistics](self, "statistics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "copyWithReplacementNumberOfMiLoPredictionsInUpdatesMode:", objc_msgSend(v12, "numberOfMiLoPredictionsInUpdatesMode") + 1);
      -[IRStatisticsManager setStatistics:](self, "setStatistics:", v13);

    }
    -[IRStatisticsManager statistics](self, "statistics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copyWithReplacementLastMiLoModels:", 0);
    -[IRStatisticsManager setStatistics:](self, "setStatistics:", v15);

    -[IRStatisticsManager statistics](self, "statistics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copyWithReplacementLastMiLoQuality:", objc_msgSend(v23, "miLoServiceQuality"));
    -[IRStatisticsManager setStatistics:](self, "setStatistics:", v17);

    -[IRStatisticsManager statistics](self, "statistics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copyWithReplacementLastMiLoQualityReasonBitmap:", objc_msgSend(v23, "miLoServiceQualityReasonBitmap"));
    -[IRStatisticsManager setStatistics:](self, "setStatistics:", v19);

    -[IRStatisticsManager statistics](self, "statistics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scores");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "copyWithReplacementLastMiLoLSLItems:", objc_msgSend(v21, "count"));
    -[IRStatisticsManager setStatistics:](self, "setStatistics:", v22);

  }
}

- (BOOL)_isAllowedToCollectStatisticsForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[IRStatisticsManager statistics](self, "statistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastClearDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRPreferences shared](IRPreferences, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coreAnalyticsStatisticsCollectionPeriodInSeconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v6, "dateByAddingTimeInterval:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "isEarlierThan:", v9);

  return v10;
}

- (IRStatisticsDO)statistics
{
  return self->_statistics;
}

- (void)setTimeToBannerInMilliSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_timeToBannerInMilliSeconds, a3);
}

- (void)setAppLaunchDate:(id)a3
{
  objc_storeStrong((id *)&self->_appLaunchDate, a3);
}

- (void)setStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_statistics, a3);
}

- (void)setModeDate:(id)a3
{
  objc_storeStrong((id *)&self->_modeDate, a3);
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (IRStatisticsManager)initWithStore:(id)a3
{
  id v4;
  IRStatisticsManager *v5;
  IRStatisticsManager *v6;
  IRStatisticsManager *v7;
  void *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IRStatisticsManager;
  v5 = -[IRStatisticsManager init](&v11, sel_init);
  v6 = v5;
  if (v5
    && (-[IRStatisticsManager setStore:](v5, "setStore:", v4),
        -[IRStatisticsManager setMode:](v6, "setMode:", 0),
        !-[IRStatisticsManager _initStatistics](v6, "_initStatistics")))
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "#statistics-manager, ";
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_23FFBA000, v9, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Statistics init error] Couldnt fetch statistics", buf, 0x16u);
    }

    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (void)event:(id)a3 forCandidate:(id)a4 inspections:(id)a5 date:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
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
  void *v25;
  char v26;
  void *v27;
  NSObject *v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (-[IRStatisticsManager _isAllowedToCollectStatisticsForDate:](self, "_isAllowedToCollectStatisticsForDate:", a6))
  {
    +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "isEqual:", v13);

    if (v14)
    {
      if (objc_msgSend(v11, "containsAirplayTarget"))
      {
        -[IRStatisticsManager statistics](self, "statistics");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[IRStatisticsManager statistics](self, "statistics");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "copyWithReplacementNumberOfPickerChoiceEvents:", objc_msgSend(v16, "numberOfPickerChoiceEvents") + 1);
        -[IRStatisticsManager setStatistics:](self, "setStatistics:", v17);

        objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE5B260]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "candidates");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __59__IRStatisticsManager_event_forCandidate_inspections_date___block_invoke;
        v29[3] = &unk_251045230;
        v30 = v11;
        objc_msgSend(v19, "firstWhere:", v29);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          -[IRStatisticsManager statistics](self, "statistics");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[IRStatisticsManager statistics](self, "statistics");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v21, "copyWithReplacementNumberOfCorrectPickerChoiceEvents:", objc_msgSend(v22, "numberOfCorrectPickerChoiceEvents") + 1);
          -[IRStatisticsManager setStatistics:](self, "setStatistics:", v23);

        }
        -[IRStatisticsManager store](self, "store");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[IRStatisticsManager statistics](self, "statistics");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "updateStatistics:", v25);

        if ((v26 & 1) == 0)
        {
          dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = *MEMORY[0x24BE5B270];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v32 = "#statistics-manager, ";
            v33 = 2112;
            v34 = v27;
            _os_log_impl(&dword_23FFBA000, v28, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Statistics update error event] Couldnt update statistics upon adding event", buf, 0x16u);
          }

        }
      }
    }
  }

}

BOOL __59__IRStatisticsManager_event_forCandidate_inspections_date___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v3 = a2;
  objc_msgSend(v3, "inspectionGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidateIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "candidateIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    objc_msgSend(v3, "inspectionGenerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "classification") > 1;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)clearStatistics:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  +[IRStatisticsDO statisticsDOWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:](IRStatisticsDO, "statisticsDOWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStatisticsManager setStatistics:](self, "setStatistics:", v4);

  -[IRStatisticsManager store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStatisticsManager statistics](self, "statistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "updateStatistics:", v6);

  if ((v7 & 1) == 0)
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "#statistics-manager, ";
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_23FFBA000, v9, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Statistics clear error] Couldnt clear statistics", buf, 0x16u);
    }

  }
}

- (void)bannerContextWithDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  -[IRStatisticsManager appLaunchDate](self, "appLaunchDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  objc_msgSend(v4, "numberWithDouble:", v8 * 1000.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStatisticsManager setTimeToBannerInMilliSeconds:](self, "setTimeToBannerInMilliSeconds:", v9);

  -[IRStatisticsManager setAppLaunchDate:](self, "setAppLaunchDate:", 0);
}

- (BOOL)_initStatistics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[IRStatisticsManager store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchStatistics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStatisticsManager setStatistics:](self, "setStatistics:", v4);

  -[IRStatisticsManager statistics](self, "statistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IRStatisticsManager statistics](self, "statistics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastClearDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[IRStatisticsManager statistics](self, "statistics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "copyWithReplacementLastClearDate:", v9);
      -[IRStatisticsManager setStatistics:](self, "setStatistics:", v10);

    }
  }
  return v5 != 0;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (NSNumber)timeToBannerInMilliSeconds
{
  return self->_timeToBannerInMilliSeconds;
}

- (NSDate)modeDate
{
  return self->_modeDate;
}

- (NSDate)appLaunchDate
{
  return self->_appLaunchDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchDate, 0);
  objc_storeStrong((id *)&self->_modeDate, 0);
  objc_storeStrong((id *)&self->_timeToBannerInMilliSeconds, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
