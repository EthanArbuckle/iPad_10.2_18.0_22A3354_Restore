@implementation ATXDefaultHomeScreenItemAppLaunchScorer

- (ATXDefaultHomeScreenItemAppLaunchScorer)initWithWidget:(id)a3 appLaunchHistogram:(id)a4
{
  id v7;
  id v8;
  ATXDefaultHomeScreenItemAppLaunchScorer *v9;
  ATXDefaultHomeScreenItemAppLaunchScorer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXDefaultHomeScreenItemAppLaunchScorer;
  v9 = -[ATXDefaultHomeScreenItemAppLaunchScorer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_widget, a3);
    objc_storeStrong((id *)&v10->_spotlightLaunchesHistogram, a4);
  }

  return v10;
}

- (id)_dateOfSleepOnboardingCompletion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1A85A4F90](self, a2);
  objc_msgSend(MEMORY[0x1E0C99EA0], "hksp_sleepdUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "integerForKey:", *MEMORY[0x1E0DA8358]) < 1)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DA8360]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

  }
  objc_autoreleasePoolPop(v2);
  return v6;
}

- (id)_appLaunchScoreForSleepWidget
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  ATXAggregatedAppLaunchData *v12;
  ATXAggregatedAppLaunchData *v13;
  void *v14;
  void *v15;
  void *v16;
  ATXAggregatedAppLaunchData *v17;
  ATXAggregatedAppLaunchData *v19;
  void *v20;
  void *v21;
  _QWORD block[5];

  -[ATXHomeScreenWidgetDescriptor avocadoDescriptor](self->_widget, "avocadoDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Health.Sleep.SleepWidgetExtension"));

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXDefaultHomeScreenItemAppLaunchScorer.m"), 71, CFSTR("Widget extension bundle id must belong to that of the sleep widget: %@"), CFSTR("com.apple.Health.Sleep.SleepWidgetExtension"));

  }
  -[ATXHomeScreenWidgetDescriptor avocadoDescriptor](self->_widget, "avocadoDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.health.SleepWidget"));

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXDefaultHomeScreenItemAppLaunchScorer.m"), 72, CFSTR("Widget kind must belong to that of the sleep widget: %@"), CFSTR("com.apple.health.SleepWidget"));

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__ATXDefaultHomeScreenItemAppLaunchScorer__appLaunchScoreForSleepWidget__block_invoke;
  block[3] = &unk_1E4D57590;
  block[4] = self;
  if (_appLaunchScoreForSleepWidget_onceToken != -1)
    dispatch_once(&_appLaunchScoreForSleepWidget_onceToken, block);
  __atxlog_handle_home_screen();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ATXDefaultHomeScreenItemAppLaunchScorer _appLaunchScoreForSleepWidget].cold.1(v10);

  v11 = _appLaunchScoreForSleepWidget_dateOfSleepOnboardingCompletion;
  v12 = [ATXAggregatedAppLaunchData alloc];
  if (!v11)
    return -[ATXAggregatedAppLaunchData initWithRawLaunchCount:uniqueDaysLaunched:](v12, "initWithRawLaunchCount:uniqueDaysLaunched:", 0, 0);
  v13 = -[ATXAggregatedAppLaunchData initWithRawLaunchCount:uniqueDaysLaunched:](v12, "initWithRawLaunchCount:uniqueDaysLaunched:", 5, 5);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateByAddingUnit:value:toDate:options:", 16, -7, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "compare:", _appLaunchScoreForSleepWidget_dateOfSleepOnboardingCompletion) == -1)
    v17 = -[ATXAggregatedAppLaunchData initWithRawLaunchCount:uniqueDaysLaunched:]([ATXAggregatedAppLaunchData alloc], "initWithRawLaunchCount:uniqueDaysLaunched:", 2 * -[ATXAggregatedAppLaunchData rawLaunchCount](v13, "rawLaunchCount"), 2 * -[ATXAggregatedAppLaunchData uniqueDaysLaunched](v13, "uniqueDaysLaunched"));
  else
    v17 = v13;
  v19 = v17;

  return v19;
}

void __72__ATXDefaultHomeScreenItemAppLaunchScorer__appLaunchScoreForSleepWidget__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_dateOfSleepOnboardingCompletion");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_appLaunchScoreForSleepWidget_dateOfSleepOnboardingCompletion;
  _appLaunchScoreForSleepWidget_dateOfSleepOnboardingCompletion = v1;

}

- (id)_appLaunchScoreForContactsWidget
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  ATXAggregatedAppLaunchData *v12;
  void *v14;
  _QWORD block[5];

  -[ATXHomeScreenWidgetDescriptor avocadoDescriptor](self->_widget, "avocadoDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.PeopleViewService.PeopleWidget-iOS"));

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXDefaultHomeScreenItemAppLaunchScorer.m"), 101, CFSTR("Widget extension bundle id must belong to that of the contacts widget: %@"), CFSTR("com.apple.PeopleViewService.PeopleWidget-iOS"));

  }
  -[ATXHomeScreenWidgetDescriptor avocadoDescriptor](self->_widget, "avocadoDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SingleContactWidget_iOS")))
  {

  }
  else
  {
    -[ATXHomeScreenWidgetDescriptor avocadoDescriptor](self->_widget, "avocadoDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "kind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("MultipleContactWidget_iOS"));

    if ((v11 & 1) != 0)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXDefaultHomeScreenItemAppLaunchScorer.m"), 102, CFSTR("Widget kind must belong to that of the contacts widget: %@ or %@"), CFSTR("SingleContactWidget_iOS"), CFSTR("MultipleContactWidget_iOS"));
  }

LABEL_8:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__ATXDefaultHomeScreenItemAppLaunchScorer__appLaunchScoreForContactsWidget__block_invoke;
  block[3] = &unk_1E4D57590;
  block[4] = self;
  if (_appLaunchScoreForContactsWidget_onceToken != -1)
    dispatch_once(&_appLaunchScoreForContactsWidget_onceToken, block);
  v12 = [ATXAggregatedAppLaunchData alloc];
  return -[ATXAggregatedAppLaunchData initWithRawLaunchCount:uniqueDaysLaunched:](v12, "initWithRawLaunchCount:uniqueDaysLaunched:", (unint64_t)*(double *)&_appLaunchScoreForContactsWidget_iCloudScore, (unint64_t)*(double *)&_appLaunchScoreForContactsWidget_iCloudScore);
}

uint64_t __75__ATXDefaultHomeScreenItemAppLaunchScorer__appLaunchScoreForContactsWidget__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "_contactsWidgetiCloudFamilyScore");
  _appLaunchScoreForContactsWidget_iCloudScore = v2;
  return result;
}

- (double)_contactsWidgetiCloudFamilyScore
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A85A4F90](self, a2);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "fetchFamilyCircle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = *(double *)&v4;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "Fetched family circle during scoring: %@", buf, 0xCu);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "members", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isMe") & 1) == 0)
        {
          v10 = v10 + 5.0;
          if (objc_msgSend(v12, "isChildAccount"))
            v10 = v10 + 5.0;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  __atxlog_handle_home_screen();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = v10;
    _os_log_impl(&dword_1A49EF000, v13, OS_LOG_TYPE_DEFAULT, "Scored family circle: %f", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v2);
  return v10;
}

- (id)_rawLaunchCountAndNumberOfUniqueDaysParentAppWasLaunchedWithCachedAppLaunchData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  ATXAggregatedAppLaunchData *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXHomeScreenWidgetDescriptor appBundleId](self->_widget, "appBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_opt_new();
    -[ATXHomeScreenWidgetDescriptor appBundleId](self->_widget, "appBundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    -[ATXHomeScreenWidgetDescriptor appBundleId](self->_widget, "appBundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

    if ((_DWORD)v7)
      objc_msgSend(v6, "addObject:", CFSTR("com.apple.camera"));
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v25;
      v14 = 0.0;
      *(_QWORD *)&v11 = 138412290;
      v23 = v11;
      v15 = 0.0;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v9);
          v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v17, v23, (_QWORD)v24);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            v15 = v15 + (double)(unint64_t)objc_msgSend(v18, "rawLaunchCount");
            v14 = v14 + (double)(unint64_t)objc_msgSend(v19, "uniqueDaysLaunched");
          }
          else
          {
            __atxlog_handle_home_screen();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              v29 = v17;
              _os_log_impl(&dword_1A49EF000, v20, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemAppLaunchScorer: No launch info for key: %@", buf, 0xCu);
            }

          }
        }
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v12);
    }
    else
    {
      v14 = 0.0;
      v15 = 0.0;
    }

  }
  else
  {
    v14 = 0.0;
    v15 = 0.0;
  }
  v21 = -[ATXAggregatedAppLaunchData initWithRawLaunchCount:uniqueDaysLaunched:]([ATXAggregatedAppLaunchData alloc], "initWithRawLaunchCount:uniqueDaysLaunched:", (unint64_t)v15, (unint64_t)v14);

  return v21;
}

- (BOOL)_isAppPredictionsWidget
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[ATXHomeScreenWidgetDescriptor avocadoDescriptor](self->_widget, "avocadoDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ATXHomeScreenWidgetDescriptor avocadoDescriptor](self->_widget, "avocadoDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXDefaultHomeScreenItemProducer appPredictionsWidgetDescriptor](ATXDefaultHomeScreenItemProducer, "appPredictionsWidgetDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isSleepWidget
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[ATXHomeScreenWidgetDescriptor avocadoDescriptor](self->_widget, "avocadoDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Health.Sleep.SleepWidgetExtension")))
  {
    -[ATXHomeScreenWidgetDescriptor avocadoDescriptor](self->_widget, "avocadoDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "kind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.health.SleepWidget"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_isContactsWidget
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  -[ATXHomeScreenWidgetDescriptor avocadoDescriptor](self->_widget, "avocadoDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.PeopleViewService.PeopleWidget-iOS"));

  if (!v5)
    return 0;
  -[ATXHomeScreenWidgetDescriptor avocadoDescriptor](self->_widget, "avocadoDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SingleContactWidget_iOS")) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[ATXHomeScreenWidgetDescriptor avocadoDescriptor](self->_widget, "avocadoDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "kind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "isEqualToString:", CFSTR("MultipleContactWidget_iOS"));

  }
  return v8;
}

- (id)scoreWithCachedAppLaunchData:(id)a3
{
  id v4;
  ATXCategoricalHistogramProtocol *spotlightLaunchesHistogram;
  double v6;
  double v7;
  ATXAggregatedAppLaunchData *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;

  v4 = a3;
  if (-[ATXDefaultHomeScreenItemAppLaunchScorer _isAppPredictionsWidget](self, "_isAppPredictionsWidget"))
  {
    spotlightLaunchesHistogram = self->_spotlightLaunchesHistogram;
    if (spotlightLaunchesHistogram)
    {
      -[ATXCategoricalHistogramProtocol totalLaunches](spotlightLaunchesHistogram, "totalLaunches");
      v7 = v6;
      v8 = [ATXAggregatedAppLaunchData alloc];
      v9 = (unint64_t)v7;
      v10 = (unint64_t)(v7 * 0.2);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "processName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("duetexpertd"));

      if (v14)
      {
        __atxlog_handle_home_screen();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          -[ATXDefaultHomeScreenItemAppLaunchScorer scoreWithCachedAppLaunchData:].cold.1(v15);

      }
      v8 = [ATXAggregatedAppLaunchData alloc];
      v9 = 0;
      v10 = 0;
    }
    v11 = -[ATXAggregatedAppLaunchData initWithRawLaunchCount:uniqueDaysLaunched:](v8, "initWithRawLaunchCount:uniqueDaysLaunched:", v9, v10);
  }
  else if (-[ATXDefaultHomeScreenItemAppLaunchScorer _isSleepWidget](self, "_isSleepWidget"))
  {
    -[ATXDefaultHomeScreenItemAppLaunchScorer _appLaunchScoreForSleepWidget](self, "_appLaunchScoreForSleepWidget");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[ATXDefaultHomeScreenItemAppLaunchScorer _isContactsWidget](self, "_isContactsWidget"))
      -[ATXDefaultHomeScreenItemAppLaunchScorer _appLaunchScoreForContactsWidget](self, "_appLaunchScoreForContactsWidget");
    else
      -[ATXDefaultHomeScreenItemAppLaunchScorer _rawLaunchCountAndNumberOfUniqueDaysParentAppWasLaunchedWithCachedAppLaunchData:](self, "_rawLaunchCountAndNumberOfUniqueDaysParentAppWasLaunchedWithCachedAppLaunchData:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v11;

  return v16;
}

- (BOOL)isWidgetSpecialCase
{
  void *v4;
  char v5;

  if (-[ATXDefaultHomeScreenItemAppLaunchScorer _isAppPredictionsWidget](self, "_isAppPredictionsWidget")
    || -[ATXDefaultHomeScreenItemAppLaunchScorer _isSleepWidget](self, "_isSleepWidget")
    || -[ATXDefaultHomeScreenItemAppLaunchScorer _isContactsWidget](self, "_isContactsWidget"))
  {
    return 1;
  }
  -[ATXHomeScreenWidgetDescriptor appBundleId](self->_widget, "appBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightLaunchesHistogram, 0);
  objc_storeStrong((id *)&self->_widget, 0);
}

- (void)_appLaunchScoreForSleepWidget
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = _appLaunchScoreForSleepWidget_dateOfSleepOnboardingCompletion != 0;
  _os_log_debug_impl(&dword_1A49EF000, log, OS_LOG_TYPE_DEBUG, "ATXDefaultHomeScreenItemAppLaunchScorer: is sleep set up: %{BOOL}d", (uint8_t *)v1, 8u);
}

- (void)scoreWithCachedAppLaunchData:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A49EF000, log, OS_LOG_TYPE_FAULT, "ATXDefaultHomeScreenItemAppLaunchScorer: _spotlightLaunchesHistogram is nil", v1, 2u);
}

@end
