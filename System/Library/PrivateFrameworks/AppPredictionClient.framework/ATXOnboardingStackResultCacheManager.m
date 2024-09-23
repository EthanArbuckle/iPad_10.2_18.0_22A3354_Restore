@implementation ATXOnboardingStackResultCacheManager

- (ATXOnboardingStackResultCacheManager)init
{
  void *v3;
  ATXOnboardingStackResultCacheManager *v4;

  objc_msgSend(MEMORY[0x1E0CF94D8], "onboardingStackResultCacheFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXOnboardingStackResultCacheManager initWithPath:isiPad:](self, "initWithPath:isiPad:", v3, objc_msgSend(MEMORY[0x1E0D81588], "isiPad"));

  return v4;
}

- (ATXOnboardingStackResultCacheManager)initWithPath:(id)a3 isiPad:(BOOL)a4
{
  id v6;
  ATXOnboardingStackResultCacheManager *v7;
  uint64_t v8;
  NSString *path;
  void *v10;
  uint64_t v11;
  NSDictionary *appLaunchCounts;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATXOnboardingStackResultCacheManager;
  v7 = -[ATXOnboardingStackResultCacheManager init](&v14, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    path = v7->_path;
    v7->_path = (NSString *)v8;

    v7->_isiPad = a4;
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps");
    v11 = objc_claimAutoreleasedReturnValue();
    appLaunchCounts = v7->_appLaunchCounts;
    v7->_appLaunchCounts = (NSDictionary *)v11;

  }
  return v7;
}

- (BOOL)updateCacheWithActivity:(id)a3 widgetCache:(id)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  uint8_t v11[16];

  v6 = a4;
  if (objc_msgSend(a3, "didDefer"))
  {
    __atxlog_handle_home_screen();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "ATXOnboardingStackResultCacheManager: Activity was deferred, stopping early", v11, 2u);
    }

    v8 = 0;
  }
  else
  {
    -[ATXOnboardingStackResultCacheManager _generateResultCacheWithWidgetCache:](self, "_generateResultCacheWithWidgetCache:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ATXOnboardingStackResultCacheManager _writeOnboardingStackResultCache:](self, "_writeOnboardingStackResultCache:", v9);

  }
  return v8;
}

- (id)_generateResultCacheWithWidgetCache:(id)a3
{
  id v4;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v5;
  void *v6;
  void *v7;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v8;
  void *v9;
  void *v10;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v11;
  void *v12;
  void *v13;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v14;
  void *v15;
  void *v16;
  ATXOnboardingStackResultCache *v17;

  v4 = a3;
  v5 = -[ATXDefaultHomeScreenItemOnboardingStacksProducer initWithOnboardingStackWidgetCache:adblDrainClassification:isiPad:shouldIncludeContactsWidget:appLaunchCounts:]([ATXDefaultHomeScreenItemOnboardingStacksProducer alloc], "initWithOnboardingStackWidgetCache:adblDrainClassification:isiPad:shouldIncludeContactsWidget:appLaunchCounts:", v4, 0, self->_isiPad, 0, self->_appLaunchCounts);
  -[ATXDefaultHomeScreenItemOnboardingStacksProducer onboardingStacks](v5, "onboardingStacks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXOnboardingStackResultCacheManager _resultFromOnboardingStacks:](self, "_resultFromOnboardingStacks:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ATXDefaultHomeScreenItemOnboardingStacksProducer initWithOnboardingStackWidgetCache:adblDrainClassification:isiPad:shouldIncludeContactsWidget:appLaunchCounts:]([ATXDefaultHomeScreenItemOnboardingStacksProducer alloc], "initWithOnboardingStackWidgetCache:adblDrainClassification:isiPad:shouldIncludeContactsWidget:appLaunchCounts:", v4, 1, self->_isiPad, 0, self->_appLaunchCounts);
  -[ATXDefaultHomeScreenItemOnboardingStacksProducer onboardingStacks](v8, "onboardingStacks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXOnboardingStackResultCacheManager _resultFromOnboardingStacks:](self, "_resultFromOnboardingStacks:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ATXDefaultHomeScreenItemOnboardingStacksProducer initWithOnboardingStackWidgetCache:adblDrainClassification:isiPad:shouldIncludeContactsWidget:appLaunchCounts:]([ATXDefaultHomeScreenItemOnboardingStacksProducer alloc], "initWithOnboardingStackWidgetCache:adblDrainClassification:isiPad:shouldIncludeContactsWidget:appLaunchCounts:", v4, 2, self->_isiPad, 0, self->_appLaunchCounts);
  -[ATXDefaultHomeScreenItemOnboardingStacksProducer onboardingStacks](v11, "onboardingStacks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXOnboardingStackResultCacheManager _resultFromOnboardingStacks:](self, "_resultFromOnboardingStacks:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[ATXDefaultHomeScreenItemOnboardingStacksProducer initWithOnboardingStackWidgetCache:adblDrainClassification:isiPad:shouldIncludeContactsWidget:appLaunchCounts:]([ATXDefaultHomeScreenItemOnboardingStacksProducer alloc], "initWithOnboardingStackWidgetCache:adblDrainClassification:isiPad:shouldIncludeContactsWidget:appLaunchCounts:", v4, 3, self->_isiPad, 0, self->_appLaunchCounts);
  -[ATXDefaultHomeScreenItemOnboardingStacksProducer onboardingStacks](v14, "onboardingStacks");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXOnboardingStackResultCacheManager _resultFromOnboardingStacks:](self, "_resultFromOnboardingStacks:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[ATXOnboardingStackResultCache initWithUnknownBatteryDrainResult:lightBatteryDrainResult:mediumBatteryDrainResult:heavyBatteryDrainResult:]([ATXOnboardingStackResultCache alloc], "initWithUnknownBatteryDrainResult:lightBatteryDrainResult:mediumBatteryDrainResult:heavyBatteryDrainResult:", v7, v10, v13, v16);
  return v17;
}

- (BOOL)_writeOnboardingStackResultCache:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  NSString *path;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0CF94C0];
  v5 = a3;
  v6 = [v4 alloc];
  path = self->_path;
  __atxlog_handle_home_screen();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithCacheFilePath:loggingHandle:debugName:", path, v8, CFSTR("onboarding stacks"));

  LOBYTE(v6) = objc_msgSend(v9, "storeSecureCodedObject:error:", v5, 0);
  return (char)v6;
}

- (id)fetchOnboardingStackResultCache
{
  id v3;
  NSString *path;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CF94C0]);
  path = self->_path;
  __atxlog_handle_home_screen();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithCacheFilePath:loggingHandle:debugName:", path, v5, CFSTR("onboarding stacks"));

  v7 = (void *)MEMORY[0x1A85A4F90]();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v6, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v8, 0, -1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_resultFromOnboardingStacks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 isiPad;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ATXOnboardingStackResult *v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  isiPad = self->_isiPad;
  objc_msgSend(v4, "stack1");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (isiPad)
  {
    objc_msgSend(v8, "mediumDefaultStack");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMediumDefaultStack:", v10);

    objc_msgSend(v4, "stack2");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "mediumDefaultStack");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMediumDefaultStack:", v12);
  }
  else
  {
    objc_msgSend(v8, "smallDefaultStack");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSmallDefaultStack:", v13);

    objc_msgSend(v4, "stack2");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "smallDefaultStack");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSmallDefaultStack:", v12);
  }

  v14 = -[ATXOnboardingStackResult initWithStack1:stack2:]([ATXOnboardingStackResult alloc], "initWithStack1:stack2:", v5, v6);
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchCounts, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
