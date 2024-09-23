@implementation ATXDefaultHomeScreenItemProducer

- (ATXDefaultHomeScreenItemProducer)initWithDescriptors:(id)a3 descriptorInstallDates:(id)a4 homeScreenConfig:(id)a5 isDayZeroExperience:(BOOL)a6 isiPad:(BOOL)a7 spotlightAppLaunchHistogram:(id)a8 appLaunchCounts:(id)a9
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  ATXDefaultHomeScreenItemProducer *v22;

  v10 = a7;
  v11 = a6;
  v16 = a9;
  v17 = a8;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  +[ATXBatteryDrainBehavior sharedInstance](ATXBatteryDrainBehavior, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[ATXDefaultHomeScreenItemProducer initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:adblDrainClassification:appLaunchCounts:](self, "initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:adblDrainClassification:appLaunchCounts:", v20, v19, v18, v11, v10, v17, objc_msgSend(v21, "fetchADBLDrainClassification"), v16);

  return v22;
}

- (ATXDefaultHomeScreenItemProducer)initWithDescriptors:(id)a3 descriptorInstallDates:(id)a4 homeScreenConfig:(id)a5 isDayZeroExperience:(BOOL)a6 isiPad:(BOOL)a7 spotlightAppLaunchHistogram:(id)a8 adblDrainClassification:(unint64_t)a9 appLaunchCounts:(id)a10
{
  id v16;
  id v17;
  id v18;
  ATXDefaultHomeScreenItemProducer *v19;
  ATXDefaultHomeScreenItemProducer *v20;
  id v23;
  id v24;
  objc_super v25;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v24 = a8;
  v23 = a10;
  v25.receiver = self;
  v25.super_class = (Class)ATXDefaultHomeScreenItemProducer;
  v19 = -[ATXDefaultHomeScreenItemProducer init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_descriptors, a3);
    objc_storeStrong((id *)&v20->_descriptorInstallDates, a4);
    objc_storeStrong((id *)&v20->_homeScreenConfig, a5);
    v20->_isDayZeroExperience = a6;
    v20->_isiPad = a7;
    objc_storeStrong((id *)&v20->_spotlightAppLaunchHistogram, a8);
    v20->_adblDrainClassification = a9;
    objc_storeStrong((id *)&v20->_appLaunchCounts, a10);
    -[ATXDefaultHomeScreenItemProducer _initializeCachedWidgetPersonalityToAppScoreCache](v20, "_initializeCachedWidgetPersonalityToAppScoreCache");
  }

  return v20;
}

- (void)_initializeCachedWidgetPersonalityToAppScoreCache
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *cachedWidgetPersonalityToAppScore;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __objc2_class **v21;
  uint64_t v22;
  void *v23;
  void *v24;
  ATXDefaultHomeScreenItemAppLaunchScorer *v25;
  void *v26;
  __objc2_class **v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  void *v32;
  void *context;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A85A4F90](self, a2);
  v4 = (NSMutableDictionary *)objc_opt_new();
  cachedWidgetPersonalityToAppScore = self->_cachedWidgetPersonalityToAppScore;
  self->_cachedWidgetPersonalityToAppScore = v4;

  if (!self->_isDayZeroExperience)
  {
    v29 = v3;
    v32 = (void *)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[ATXDefaultHomeScreenItemProducer candidateDescriptors](self, "candidateDescriptors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v39;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v39 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v10);
          v12 = (void *)MEMORY[0x1A85A4F90]();
          objc_msgSend(v11, "appBundleId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v11, "appBundleId");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "addObject:", v14);

            objc_msgSend(v11, "appBundleId");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v14) = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

            if ((_DWORD)v14)
              objc_msgSend(v32, "addObject:", CFSTR("com.apple.camera"));
          }
          objc_autoreleasePoolPop(v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v8);
    }

    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:", v32);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[ATXDefaultHomeScreenItemProducer candidateDescriptors](self, "candidateDescriptors");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v35;
      v21 = off_1E4D54000;
      v30 = v17;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v35 != v20)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v22);
          context = (void *)MEMORY[0x1A85A4F90]();
          -[__objc2_class stringRepresentationForATXHomeScreenWidgetDescriptor:](v21[124], "stringRepresentationForATXHomeScreenWidgetDescriptor:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[ATXDefaultHomeScreenItemAppLaunchScorer initWithWidget:appLaunchHistogram:]([ATXDefaultHomeScreenItemAppLaunchScorer alloc], "initWithWidget:appLaunchHistogram:", v23, self->_spotlightAppLaunchHistogram);
          if (-[ATXDefaultHomeScreenItemAppLaunchScorer isWidgetSpecialCase](v25, "isWidgetSpecialCase"))
          {
            -[ATXDefaultHomeScreenItemAppLaunchScorer scoreWithCachedAppLaunchData:](v25, "scoreWithCachedAppLaunchData:", v17);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedWidgetPersonalityToAppScore, "setObject:forKeyedSubscript:", v26, v24);
          }
          else
          {
            objc_msgSend(v23, "appBundleId");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              objc_msgSend(v17, "objectForKeyedSubscript:", v26);
              v27 = v21;
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedWidgetPersonalityToAppScore, "setObject:forKeyedSubscript:", v28, v24);

              v21 = v27;
              v17 = v30;
            }
          }

          objc_autoreleasePoolPop(context);
          ++v22;
        }
        while (v19 != v22);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v19);
    }

    v3 = v29;
  }
  objc_autoreleasePoolPop(v3);
}

- (ATXDefaultHomeScreenItemUpdate)update
{
  if (-[ATXDefaultHomeScreenItemProducer isDayZeroExperience](self, "isDayZeroExperience"))
    -[ATXDefaultHomeScreenItemProducer _dayZeroUpdate](self, "_dayZeroUpdate");
  else
    -[ATXDefaultHomeScreenItemProducer _personalizedUpdate](self, "_personalizedUpdate");
  return (ATXDefaultHomeScreenItemUpdate *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_dayZeroUpdate
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  ATXDefaultHomeScreenItemUpdate *v17;
  ATXDefaultHomeScreenItemRanker *v18;
  void *v19;
  void *v20;
  void *v21;
  ATXDefaultHomeScreenItemUpdate *v22;
  void *v23;
  ATXDefaultHomeScreenItemUpdate *v24;
  void *v25;
  ATXDefaultHomeScreenItemUpdate *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  _QWORD v42[2];
  _QWORD v43[2];
  uint8_t buf[4];
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[ATXDefaultHomeScreenItemProducer _dayZeroUpdate]";
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "%s: updating with day zero defaults", buf, 0xCu);
  }

  +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:](ATXDefaultHomeScreenItemProducerUtilities, "personalitiesFromAssetsWithKey:", CFSTR("dayZeroDefaultStack"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemProducer _stackFromDefaultStackPersonalities:](self, "_stackFromDefaultStackPersonalities:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:](ATXDefaultHomeScreenItemProducerUtilities, "personalitiesFromAssetsWithKey:", CFSTR("dayZeroTodayPageDefaultStack"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemProducer _stackFromDefaultStackPersonalities:](self, "_stackFromDefaultStackPersonalities:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemProducer _dayZeroOnboardingStacks](self, "_dayZeroOnboardingStacks");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isiPad)
    v6 = CFSTR("dayZeroDefaultWidgetsiPad");
  else
    v6 = CFSTR("dayZeroDefaultWidgetsiPhone");
  +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:](ATXDefaultHomeScreenItemProducerUtilities, "personalitiesFromAssetsWithKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemProducer personalityToDescriptorDictionary](self, "personalityToDescriptorDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:size:personalityToDescriptorDictionary:](ATXDefaultHomeScreenItemProducerUtilities, "widgetsFromPersonalities:size:personalityToDescriptorDictionary:", v7, 0, v8);
  v39 = objc_claimAutoreleasedReturnValue();

  -[ATXDefaultHomeScreenItemProducer personalityToDescriptorDictionary](self, "personalityToDescriptorDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:size:personalityToDescriptorDictionary:](ATXDefaultHomeScreenItemProducerUtilities, "widgetsFromPersonalities:size:personalityToDescriptorDictionary:", v7, 1, v9);
  v10 = objc_claimAutoreleasedReturnValue();

  -[ATXDefaultHomeScreenItemProducer personalityToDescriptorDictionary](self, "personalityToDescriptorDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:size:personalityToDescriptorDictionary:](ATXDefaultHomeScreenItemProducerUtilities, "widgetsFromPersonalities:size:personalityToDescriptorDictionary:", v7, 2, v11);
  v12 = objc_claimAutoreleasedReturnValue();

  if (self->_isiPad)
  {
    -[ATXDefaultHomeScreenItemProducer personalityToDescriptorDictionary](self, "personalityToDescriptorDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:size:personalityToDescriptorDictionary:](ATXDefaultHomeScreenItemProducerUtilities, "widgetsFromPersonalities:size:personalityToDescriptorDictionary:", v7, 4, v13);
    v14 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = objc_opt_new();
  }
  v36 = (void *)v14;
  v37 = (void *)v5;
  v15 = (void *)v39;
  v34 = (void *)v12;
  v35 = (void *)v10;
  if (self->_isiPad)
  {
    v16 = v10;
    v17 = [ATXDefaultHomeScreenItemUpdate alloc];
    objc_msgSend(v40, "stack1");
    v18 = (ATXDefaultHomeScreenItemRanker *)objc_claimAutoreleasedReturnValue();
    v43[0] = v18;
    objc_msgSend(v40, "stack2");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v30) = 0;
    v21 = v36;
    v22 = v17;
    v23 = v37;
    v24 = -[ATXDefaultHomeScreenItemUpdate initWithStack:todayStack:onboardingStacks:smallWidgets:mediumWidgets:largeWidgets:extraLargeWidgets:shouldSuggestStackInGallery:](v22, "initWithStack:todayStack:onboardingStacks:smallWidgets:mediumWidgets:largeWidgets:extraLargeWidgets:shouldSuggestStackInGallery:", v41, v37, v20, v39, v16, v12, v36, v30);
  }
  else
  {
    v18 = -[ATXDefaultHomeScreenItemRanker initWithCachedWidgetPersonalityToAppScore:spotlightAppLaunchHistogram:appLaunchCounts:]([ATXDefaultHomeScreenItemRanker alloc], "initWithCachedWidgetPersonalityToAppScore:spotlightAppLaunchHistogram:appLaunchCounts:", self->_cachedWidgetPersonalityToAppScore, self->_spotlightAppLaunchHistogram, self->_appLaunchCounts);
    -[ATXDefaultHomeScreenItemRanker widgetsBySortingWidgetsUsingDayZeroGalleryAlgorithm:](v18, "widgetsBySortingWidgetsUsingDayZeroGalleryAlgorithm:", v39);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXDefaultHomeScreenItemRanker widgetsBySortingWidgetsUsingDayZeroGalleryAlgorithm:](v18, "widgetsBySortingWidgetsUsingDayZeroGalleryAlgorithm:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXDefaultHomeScreenItemRanker widgetsBySortingWidgetsUsingDayZeroGalleryAlgorithm:](v18, "widgetsBySortingWidgetsUsingDayZeroGalleryAlgorithm:", v12);
    v32 = v7;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = [ATXDefaultHomeScreenItemUpdate alloc];
    objc_msgSend(v40, "stack1");
    v33 = v4;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v31;
    objc_msgSend(v40, "stack2");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v30) = !-[ATXDefaultHomeScreenItemProducer _isStackConfiguredOnHomeScreen](self, "_isStackConfiguredOnHomeScreen");
    v21 = v36;
    v24 = -[ATXDefaultHomeScreenItemUpdate initWithStack:todayStack:onboardingStacks:smallWidgets:mediumWidgets:largeWidgets:extraLargeWidgets:shouldSuggestStackInGallery:](v26, "initWithStack:todayStack:onboardingStacks:smallWidgets:mediumWidgets:largeWidgets:extraLargeWidgets:shouldSuggestStackInGallery:", v41, v37, v28, v19, v20, v25, v36, v30);

    v15 = (void *)v39;
    v23 = v37;

    v4 = v33;
    v7 = v32;
  }

  return v24;
}

- (id)onboardingStacks
{
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v8;
  void *v9;
  NSMutableDictionary *cachedWidgetPersonalityToAppScore;
  void *v11;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[ATXDefaultHomeScreenItemProducer isDayZeroExperience](self, "isDayZeroExperience");
    -[ATXDefaultHomeScreenItemProducer descriptors](self, "descriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    -[ATXDefaultHomeScreenItemProducer descriptorInstallDates](self, "descriptorInstallDates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v18 = "-[ATXDefaultHomeScreenItemProducer onboardingStacks]";
    v19 = 1024;
    v20 = v4;
    v21 = 2048;
    v22 = v6;
    v23 = 2048;
    v24 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "%s: generating onboarding stacks. dayZero:%d, numDescriptors:%lu, descriptorCacheSize:%lu", buf, 0x26u);

  }
  v8 = [ATXDefaultHomeScreenItemOnboardingStacksProducer alloc];
  -[ATXDefaultHomeScreenItemProducer _stackableCandidates](self, "_stackableCandidates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  cachedWidgetPersonalityToAppScore = self->_cachedWidgetPersonalityToAppScore;
  -[ATXDefaultHomeScreenItemProducer personalityToDescriptorDictionary](self, "personalityToDescriptorDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = 0;
  LOBYTE(v15) = 1;
  v12 = -[ATXDefaultHomeScreenItemOnboardingStacksProducer initWithCandidateWidgets:cachedWidgetPersonalityToAppScore:personalityToDescriptorDictionary:adblDrainClassification:isiPad:isDayZeroExperience:shouldIncludeContactsWidget:cachedHasiCloudFamily:appLaunchCounts:isAmbient:](v8, "initWithCandidateWidgets:cachedWidgetPersonalityToAppScore:personalityToDescriptorDictionary:adblDrainClassification:isiPad:isDayZeroExperience:shouldIncludeContactsWidget:cachedHasiCloudFamily:appLaunchCounts:isAmbient:", v9, cachedWidgetPersonalityToAppScore, v11, self->_adblDrainClassification, self->_isiPad, self->_isDayZeroExperience, v15, 0, self->_appLaunchCounts, v16);

  -[ATXDefaultHomeScreenItemOnboardingStacksProducer onboardingStacks](v12, "onboardingStacks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)ambientOnboardingStacks
{
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v8;
  void *v9;
  NSMutableDictionary *cachedWidgetPersonalityToAppScore;
  void *v11;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[ATXDefaultHomeScreenItemProducer isDayZeroExperience](self, "isDayZeroExperience");
    -[ATXDefaultHomeScreenItemProducer descriptors](self, "descriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    -[ATXDefaultHomeScreenItemProducer descriptorInstallDates](self, "descriptorInstallDates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v18 = "-[ATXDefaultHomeScreenItemProducer ambientOnboardingStacks]";
    v19 = 1024;
    v20 = v4;
    v21 = 2048;
    v22 = v6;
    v23 = 2048;
    v24 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "%s: generating onboarding stacks. dayZero:%d, numDescriptors:%lu, descriptorCacheSize:%lu", buf, 0x26u);

  }
  v8 = [ATXDefaultHomeScreenItemOnboardingStacksProducer alloc];
  -[ATXDefaultHomeScreenItemProducer _stackableCandidates](self, "_stackableCandidates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  cachedWidgetPersonalityToAppScore = self->_cachedWidgetPersonalityToAppScore;
  -[ATXDefaultHomeScreenItemProducer personalityToDescriptorDictionary](self, "personalityToDescriptorDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = 1;
  LOBYTE(v15) = 1;
  v12 = -[ATXDefaultHomeScreenItemOnboardingStacksProducer initWithCandidateWidgets:cachedWidgetPersonalityToAppScore:personalityToDescriptorDictionary:adblDrainClassification:isiPad:isDayZeroExperience:shouldIncludeContactsWidget:cachedHasiCloudFamily:appLaunchCounts:isAmbient:](v8, "initWithCandidateWidgets:cachedWidgetPersonalityToAppScore:personalityToDescriptorDictionary:adblDrainClassification:isiPad:isDayZeroExperience:shouldIncludeContactsWidget:cachedHasiCloudFamily:appLaunchCounts:isAmbient:", v9, cachedWidgetPersonalityToAppScore, v11, self->_adblDrainClassification, self->_isiPad, self->_isDayZeroExperience, v15, 0, self->_appLaunchCounts, v16);

  -[ATXDefaultHomeScreenItemOnboardingStacksProducer onboardingStacks](v12, "onboardingStacks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_dayZeroOnboardingStacks
{
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v3;
  void *v4;
  NSMutableDictionary *cachedWidgetPersonalityToAppScore;
  void *v6;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;

  v3 = [ATXDefaultHomeScreenItemOnboardingStacksProducer alloc];
  -[ATXDefaultHomeScreenItemProducer _stackableCandidates](self, "_stackableCandidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  cachedWidgetPersonalityToAppScore = self->_cachedWidgetPersonalityToAppScore;
  -[ATXDefaultHomeScreenItemProducer personalityToDescriptorDictionary](self, "personalityToDescriptorDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = 0;
  LOBYTE(v10) = 1;
  v7 = -[ATXDefaultHomeScreenItemOnboardingStacksProducer initWithCandidateWidgets:cachedWidgetPersonalityToAppScore:personalityToDescriptorDictionary:adblDrainClassification:isiPad:isDayZeroExperience:shouldIncludeContactsWidget:cachedHasiCloudFamily:appLaunchCounts:isAmbient:](v3, "initWithCandidateWidgets:cachedWidgetPersonalityToAppScore:personalityToDescriptorDictionary:adblDrainClassification:isiPad:isDayZeroExperience:shouldIncludeContactsWidget:cachedHasiCloudFamily:appLaunchCounts:isAmbient:", v4, cachedWidgetPersonalityToAppScore, v6, self->_adblDrainClassification, self->_isiPad, 1, v10, 0, self->_appLaunchCounts, v11);

  -[ATXDefaultHomeScreenItemOnboardingStacksProducer onboardingStacks](v7, "onboardingStacks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_personalizedUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXDefaultHomeScreenItemUpdate *v7;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  ATXDefaultHomeScreenItemUpdate *v21;
  uint64_t v22;
  _QWORD v23[2];
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ATXDefaultHomeScreenItemProducer _personalizedUpdate]";
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "%s: updating personalized defaults", buf, 0xCu);
  }

  -[ATXDefaultHomeScreenItemProducer _personalizedStack](self, "_personalizedStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "smallDefaultStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
    goto LABEL_6;
  objc_msgSend(v4, "mediumDefaultStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") <= 1)
  {

LABEL_6:
LABEL_7:
    -[ATXDefaultHomeScreenItemProducer _dayZeroUpdate](self, "_dayZeroUpdate");
    v7 = (ATXDefaultHomeScreenItemUpdate *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v4, "largeDefaultStack");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 < 2)
    goto LABEL_7;
  -[ATXDefaultHomeScreenItemProducer _personalizedTodayStack](self, "_personalizedTodayStack");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemProducer personalizedOnboardingStacksWithRankingAlgorithm:](self, "personalizedOnboardingStacksWithRankingAlgorithm:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stack1");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  objc_msgSend(v12, "stack2");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXDefaultHomeScreenItemProducer _personalizedGalleryWidgetsForSize:](self, "_personalizedGalleryWidgetsForSize:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemProducer _personalizedGalleryWidgetsForSize:](self, "_personalizedGalleryWidgetsForSize:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemProducer _personalizedGalleryWidgetsForSize:](self, "_personalizedGalleryWidgetsForSize:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isiPad)
  {
    -[ATXDefaultHomeScreenItemProducer _personalizedGalleryWidgetsForSize:](self, "_personalizedGalleryWidgetsForSize:", 4);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = objc_opt_new();
  }
  v20 = (void *)v19;
  v21 = [ATXDefaultHomeScreenItemUpdate alloc];
  LOBYTE(v22) = !-[ATXDefaultHomeScreenItemProducer _isStackConfiguredOnHomeScreen](self, "_isStackConfiguredOnHomeScreen");
  v7 = -[ATXDefaultHomeScreenItemUpdate initWithStack:todayStack:onboardingStacks:smallWidgets:mediumWidgets:largeWidgets:extraLargeWidgets:shouldSuggestStackInGallery:](v21, "initWithStack:todayStack:onboardingStacks:smallWidgets:mediumWidgets:largeWidgets:extraLargeWidgets:shouldSuggestStackInGallery:", v4, v11, v15, v16, v17, v18, v20, v22);

LABEL_8:
  return v7;
}

- (id)_stackFromDefaultStackPersonalities:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ATXDefaultHomeScreenItemProducer personalityToDescriptorDictionary](self, "personalityToDescriptorDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemProducerUtilities stackFromDefaultStackPersonalities:suggestedSize:maxWidgetsPerStack:personalityToDescriptorDictionary:isiPad:](ATXDefaultHomeScreenItemProducerUtilities, "stackFromDefaultStackPersonalities:suggestedSize:maxWidgetsPerStack:personalityToDescriptorDictionary:isiPad:", v4, 1, 7, v5, self->_isiPad);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)personalityToDescriptorDictionary
{
  NSDictionary *personalityToDescriptorDictionary;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  ATXWidgetPersonality *v12;
  void *v13;
  void *v14;
  ATXWidgetPersonality *v15;
  NSDictionary *v16;
  ATXDefaultHomeScreenItemProducer *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  personalityToDescriptorDictionary = self->_personalityToDescriptorDictionary;
  if (!personalityToDescriptorDictionary)
  {
    v4 = (NSDictionary *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v18 = self;
    -[ATXDefaultHomeScreenItemProducer candidateDescriptors](self, "candidateDescriptors");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
          v10 = (void *)MEMORY[0x1A85A4F90]();
          objc_msgSend(v9, "avocadoDescriptor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = [ATXWidgetPersonality alloc];
            objc_msgSend(v11, "extensionBundleIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "kind");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[ATXWidgetPersonality initWithExtensionBundleId:kind:](v12, "initWithExtensionBundleId:kind:", v13, v14);

            -[NSDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, v15);
          }

          objc_autoreleasePoolPop(v10);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v6);
    }

    v16 = v18->_personalityToDescriptorDictionary;
    v18->_personalityToDescriptorDictionary = v4;

    personalityToDescriptorDictionary = v18->_personalityToDescriptorDictionary;
  }
  return personalityToDescriptorDictionary;
}

- (NSArray)candidateDescriptors
{
  NSArray *candidateDescriptors;
  NSArray *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  ATXWidgetPersonality *v8;
  void *v9;
  void *v10;
  ATXWidgetPersonality *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  NSArray *v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  id obj;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  candidateDescriptors = self->_candidateDescriptors;
  if (!candidateDescriptors)
  {
    v4 = (NSArray *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[ATXDefaultHomeScreenItemProducer descriptors](self, "descriptors");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v26)
    {
      v25 = *(_QWORD *)v29;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v29 != v25)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v5);
          v7 = (void *)MEMORY[0x1A85A4F90]();
          v8 = [ATXWidgetPersonality alloc];
          objc_msgSend(v6, "extensionBundleIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "kind");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[ATXWidgetPersonality initWithExtensionBundleId:kind:](v8, "initWithExtensionBundleId:kind:", v9, v10);

          -[ATXDefaultHomeScreenItemProducer descriptorInstallDates](self, "descriptorInstallDates");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v14 = -[ATXDefaultHomeScreenItemProducer _isNewlyInstalledWidget:](self, "_isNewlyInstalledWidget:", v6);
            -[ATXDefaultHomeScreenItemProducer widgetsOnHomeScreen](self, "widgetsOnHomeScreen");
            v27 = v7;
            v15 = v4;
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[ATXDefaultHomeScreenItemProducer _rankTypeGivenWidgetIsNewlyInstalled:isAlreadyAdded:](self, "_rankTypeGivenWidgetIsNewlyInstalled:isAlreadyAdded:", v14, objc_msgSend(v16, "containsObject:", v11));

            objc_msgSend(v6, "extensionIdentity");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "containerBundleIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = v15;
            v7 = v27;
            +[ATXDefaultHomeScreenItemProducerUtilities widgetDescriptorFromChronoDescriptor:appBundleId:rankType:](ATXDefaultHomeScreenItemProducerUtilities, "widgetDescriptorFromChronoDescriptor:appBundleId:rankType:", v6, v19, v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObject:](v4, "addObject:", v20);

          }
          objc_autoreleasePoolPop(v7);
          ++v5;
        }
        while (v26 != v5);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v26);
    }

    -[ATXDefaultHomeScreenItemProducer _appPredictionsWidgetDescriptor](self, "_appPredictionsWidgetDescriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      -[NSArray addObject:](v4, "addObject:", v21);
    v22 = self->_candidateDescriptors;
    self->_candidateDescriptors = v4;

    candidateDescriptors = self->_candidateDescriptors;
  }
  return (NSArray *)(id)-[NSArray copy](candidateDescriptors, "copy");
}

- (id)_personalizedStack
{
  return -[ATXDefaultHomeScreenItemProducer _personalizedStackForRankerPlistType:](self, "_personalizedStackForRankerPlistType:", 4);
}

- (id)_personalizedTodayStack
{
  return -[ATXDefaultHomeScreenItemProducer _personalizedStackForRankerPlistType:](self, "_personalizedStackForRankerPlistType:", 5);
}

- (id)personalizedOnboardingStacksWithRankingAlgorithm:(int)a3
{
  uint64_t v3;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v5;
  void *v6;
  NSMutableDictionary *cachedWidgetPersonalityToAppScore;
  void *v8;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;

  v3 = *(_QWORD *)&a3;
  v5 = [ATXDefaultHomeScreenItemOnboardingStacksProducer alloc];
  -[ATXDefaultHomeScreenItemProducer _stackableCandidates](self, "_stackableCandidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  cachedWidgetPersonalityToAppScore = self->_cachedWidgetPersonalityToAppScore;
  -[ATXDefaultHomeScreenItemProducer personalityToDescriptorDictionary](self, "personalityToDescriptorDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = 0;
  LOBYTE(v12) = 1;
  v9 = -[ATXDefaultHomeScreenItemOnboardingStacksProducer initWithCandidateWidgets:cachedWidgetPersonalityToAppScore:personalityToDescriptorDictionary:adblDrainClassification:isiPad:isDayZeroExperience:shouldIncludeContactsWidget:cachedHasiCloudFamily:appLaunchCounts:isAmbient:](v5, "initWithCandidateWidgets:cachedWidgetPersonalityToAppScore:personalityToDescriptorDictionary:adblDrainClassification:isiPad:isDayZeroExperience:shouldIncludeContactsWidget:cachedHasiCloudFamily:appLaunchCounts:isAmbient:", v6, cachedWidgetPersonalityToAppScore, v8, self->_adblDrainClassification, self->_isiPad, 0, v12, 0, self->_appLaunchCounts, v13);

  -[ATXDefaultHomeScreenItemOnboardingStacksProducer personalizedOnboardingStacksWithRankingAlgorithm:](v9, "personalizedOnboardingStacksWithRankingAlgorithm:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_personalizedStackForRankerPlistType:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v3 = *(_QWORD *)&a3;
  -[ATXDefaultHomeScreenItemProducer _stackableCandidates](self, "_stackableCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemProducer _personalizedStackFromCandidates:rankerPlistType:size:](self, "_personalizedStackFromCandidates:rankerPlistType:size:", v5, v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemProducer _personalizedStackFromCandidates:rankerPlistType:size:](self, "_personalizedStackFromCandidates:rankerPlistType:size:", v5, v3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemProducer _personalizedStackFromCandidates:rankerPlistType:size:](self, "_personalizedStackFromCandidates:rankerPlistType:size:", v5, v3, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isiPad)
  {
    -[ATXDefaultHomeScreenItemProducer _personalizedStackFromCandidates:rankerPlistType:size:](self, "_personalizedStackFromCandidates:rankerPlistType:size:", v5, v3, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  LOBYTE(v12) = self->_isiPad;
  +[ATXDefaultHomeScreenItemProducerUtilities defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:](ATXDefaultHomeScreenItemProducerUtilities, "defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:", v6, v7, v8, v9, 1, 7, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_stackableCandidates
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend((id)objc_opt_class(), "appPredictionsWidgetDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemProducer candidateDescriptors](self, "candidateDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__ATXDefaultHomeScreenItemProducer__stackableCandidates__block_invoke;
  v8[3] = &unk_1E4D591E0;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __56__ATXDefaultHomeScreenItemProducer__stackableCandidates__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "avocadoDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

- (id)_personalizedStackFromCandidates:(id)a3 rankerPlistType:(int)a4 size:(unint64_t)a5
{
  uint64_t v5;
  void *v7;
  ATXDefaultHomeScreenItemRanker *v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)&a4;
  +[ATXDefaultHomeScreenItemProducerUtilities widgets:filteredForSize:](ATXDefaultHomeScreenItemProducerUtilities, "widgets:filteredForSize:", a3, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXDefaultHomeScreenItemRanker initWithCachedWidgetPersonalityToAppScore:spotlightAppLaunchHistogram:appLaunchCounts:]([ATXDefaultHomeScreenItemRanker alloc], "initWithCachedWidgetPersonalityToAppScore:spotlightAppLaunchHistogram:appLaunchCounts:", self->_cachedWidgetPersonalityToAppScore, self->_spotlightAppLaunchHistogram, self->_appLaunchCounts);
  -[ATXDefaultHomeScreenItemRanker widgetsBySortingAndFilteringWidgetsUsingPersonalizedTodayandAddSheetStackAlgorithm:rankerPlistType:regularlyUsedThreshold:](v8, "widgetsBySortingAndFilteringWidgetsUsingPersonalizedTodayandAddSheetStackAlgorithm:rankerPlistType:regularlyUsedThreshold:", v7, v5, 7.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  return v10;
}

- (id)_personalizedGalleryWidgetsForSize:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  ATXDefaultHomeScreenItemRanker *v10;

  -[ATXDefaultHomeScreenItemProducer candidateDescriptors](self, "candidateDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemProducerUtilities widgets:filteredForSize:](ATXDefaultHomeScreenItemProducerUtilities, "widgets:filteredForSize:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a3)
  {
    case 1uLL:
      v7 = 1;
      goto LABEL_9;
    case 2uLL:
      v7 = 2;
      goto LABEL_9;
    case 3uLL:
      __atxlog_handle_home_screen();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[ATXDefaultHomeScreenItemProducer _personalizedGalleryWidgetsForSize:].cold.1(v8);

      v9 = 0;
      goto LABEL_10;
    case 4uLL:
      v7 = 3;
      goto LABEL_9;
    default:
      v7 = 0;
LABEL_9:
      v10 = -[ATXDefaultHomeScreenItemRanker initWithCachedWidgetPersonalityToAppScore:spotlightAppLaunchHistogram:appLaunchCounts:]([ATXDefaultHomeScreenItemRanker alloc], "initWithCachedWidgetPersonalityToAppScore:spotlightAppLaunchHistogram:appLaunchCounts:", self->_cachedWidgetPersonalityToAppScore, self->_spotlightAppLaunchHistogram, self->_appLaunchCounts);
      -[ATXDefaultHomeScreenItemRanker widgetsBySortingAndFilteringWidgetsUsingPersonalizedGalleryAlgorithm:rankerPlistType:regularlyUsedThreshold:](v10, "widgetsBySortingAndFilteringWidgetsUsingPersonalizedGalleryAlgorithm:rankerPlistType:regularlyUsedThreshold:", v6, v7, 7.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
      return v9;
  }
}

- (id)_appPredictionsWidgetDescriptor
{
  void *v3;
  ATXWidgetPersonality *v4;
  void *v5;
  int64_t v6;
  void *v7;
  NSObject *v8;

  objc_msgSend((id)objc_opt_class(), "appPredictionsWidgetDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[ATXWidgetPersonality initWithExtensionBundleId:kind:]([ATXWidgetPersonality alloc], "initWithExtensionBundleId:kind:", CFSTR("com.apple.proactive.appprediction.panel"), CFSTR("com.apple.proactive.appprediction.panel"));
    -[ATXDefaultHomeScreenItemProducer widgetsOnHomeScreen](self, "widgetsOnHomeScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ATXDefaultHomeScreenItemProducer _rankTypeGivenWidgetIsNewlyInstalled:isAlreadyAdded:](self, "_rankTypeGivenWidgetIsNewlyInstalled:isAlreadyAdded:", 0, objc_msgSend(v5, "containsObject:", v4));

    +[ATXDefaultHomeScreenItemProducerUtilities widgetDescriptorFromChronoDescriptor:appBundleId:rankType:](ATXDefaultHomeScreenItemProducerUtilities, "widgetDescriptorFromChronoDescriptor:appBundleId:rankType:", v3, 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_home_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXDefaultHomeScreenItemProducer _appPredictionsWidgetDescriptor].cold.1(v8);

    v7 = 0;
  }

  return v7;
}

+ (CHSWidgetDescriptor)appPredictionsWidgetDescriptor
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0D10168]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", &stru_1E4D5DB30, 0, 0);
  v4 = (void *)objc_msgSend(v2, "initWithExtensionIdentity:kind:supportedFamilies:intentType:", v3, CFSTR("SBHSpecialAvocadoDescriptorKindAppPredictions"), 4, 0);

  return (CHSWidgetDescriptor *)v4;
}

- (NSSet)widgetsOnHomeScreen
{
  NSSet *widgetsOnHomeScreen;
  NSSet *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  ATXWidgetPersonality *v18;
  void *v19;
  void *v20;
  ATXWidgetPersonality *v21;
  NSSet *v22;
  ATXDefaultHomeScreenItemProducer *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  void *context;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  widgetsOnHomeScreen = self->_widgetsOnHomeScreen;
  if (!widgetsOnHomeScreen)
  {
    v4 = (NSSet *)objc_opt_new();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v24 = self;
    -[ATXDefaultHomeScreenItemProducer homeScreenConfig](self, "homeScreenConfig");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v27)
    {
      v26 = *(_QWORD *)v42;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v42 != v26)
            objc_enumerationMutation(obj);
          v29 = v5;
          v6 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v5);
          context = (void *)MEMORY[0x1A85A4F90]();
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(v6, "stacks");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "panels");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = v9;
          v32 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          if (v32)
          {
            v31 = *(_QWORD *)v38;
            do
            {
              v10 = 0;
              do
              {
                if (*(_QWORD *)v38 != v31)
                  objc_enumerationMutation(v30);
                v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v10);
                v33 = 0u;
                v34 = 0u;
                v35 = 0u;
                v36 = 0u;
                objc_msgSend(v11, "widgets");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
                if (v13)
                {
                  v14 = v13;
                  v15 = *(_QWORD *)v34;
                  do
                  {
                    v16 = 0;
                    do
                    {
                      if (*(_QWORD *)v34 != v15)
                        objc_enumerationMutation(v12);
                      v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v16);
                      v18 = [ATXWidgetPersonality alloc];
                      objc_msgSend(v17, "extensionBundleId");
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v17, "widgetKind");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      v21 = -[ATXWidgetPersonality initWithExtensionBundleId:kind:](v18, "initWithExtensionBundleId:kind:", v19, v20);

                      -[NSSet addObject:](v4, "addObject:", v21);
                      ++v16;
                    }
                    while (v14 != v16);
                    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
                  }
                  while (v14);
                }

                ++v10;
              }
              while (v10 != v32);
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
            }
            while (v32);
          }

          objc_autoreleasePoolPop(context);
          v5 = v29 + 1;
        }
        while (v29 + 1 != v27);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v27);
    }

    v22 = v24->_widgetsOnHomeScreen;
    v24->_widgetsOnHomeScreen = v4;

    widgetsOnHomeScreen = v24->_widgetsOnHomeScreen;
  }
  return widgetsOnHomeScreen;
}

- (BOOL)_isStackConfiguredOnHomeScreen
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  unint64_t v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[ATXDefaultHomeScreenItemProducer homeScreenConfig](self, "homeScreenConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v7, "stacks", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v18;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v18 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "widgets");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "count");

              if (v14 > 1)
              {

                v15 = 1;
                goto LABEL_19;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            if (v10)
              continue;
            break;
          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v15 = 0;
    }
    while (v4);
  }
  else
  {
    v15 = 0;
  }
LABEL_19:

  return v15;
}

- (BOOL)_isNewlyInstalledWidget:(id)a3
{
  id v4;
  void *v5;
  ATXWidgetPersonality *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  -[ATXDefaultHomeScreenItemProducer _firstInstalledWidgetDate](self, "_firstInstalledWidgetDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXWidgetPersonality initWithDescriptor:]([ATXWidgetPersonality alloc], "initWithDescriptor:", v4);

  -[ATXDefaultHomeScreenItemProducer descriptorInstallDates](self, "descriptorInstallDates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "installDate");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = 0;
    if (v5 && v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 16, 1, v5, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v10, "compare:", v13);
      v11 = v14 == 1;
      if (v14 == 1)
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dateByAddingUnit:value:toDate:options:", 16, -2, v16, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v17, "compare:", v10) == -1;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_firstInstalledWidgetDate
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v3, "objectForKey:", CFSTR("dateOfFirstInstalledAvocado"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (int64_t)_rankTypeGivenWidgetIsNewlyInstalled:(BOOL)a3 isAlreadyAdded:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  int64_t v7;
  int64_t v8;

  v4 = a4;
  v5 = a3;
  v6 = -[ATXDefaultHomeScreenItemProducer isDayZeroExperience](self, "isDayZeroExperience");
  v7 = 1;
  if (v5)
    v7 = 2;
  v8 = 5;
  if (v4)
  {
    v8 = 6;
    v7 = 4;
  }
  if (v6)
    return v8;
  else
    return v7;
}

- (NSSet)descriptors
{
  return self->_descriptors;
}

- (NSDictionary)descriptorInstallDates
{
  return self->_descriptorInstallDates;
}

- (NSArray)homeScreenConfig
{
  return self->_homeScreenConfig;
}

- (BOOL)isDayZeroExperience
{
  return self->_isDayZeroExperience;
}

- (void)setIsDayZeroExperience:(BOOL)a3
{
  self->_isDayZeroExperience = a3;
}

- (BOOL)isiPad
{
  return self->_isiPad;
}

- (void)setIsiPad:(BOOL)a3
{
  self->_isiPad = a3;
}

- (unint64_t)adblDrainClassification
{
  return self->_adblDrainClassification;
}

- (void)setAdblDrainClassification:(unint64_t)a3
{
  self->_adblDrainClassification = a3;
}

- (void)setPersonalityToDescriptorDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_personalityToDescriptorDictionary, a3);
}

- (void)setCandidateDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_candidateDescriptors, a3);
}

- (void)setWidgetsOnHomeScreen:(id)a3
{
  objc_storeStrong((id *)&self->_widgetsOnHomeScreen, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetsOnHomeScreen, 0);
  objc_storeStrong((id *)&self->_candidateDescriptors, 0);
  objc_storeStrong((id *)&self->_personalityToDescriptorDictionary, 0);
  objc_storeStrong((id *)&self->_homeScreenConfig, 0);
  objc_storeStrong((id *)&self->_descriptorInstallDates, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_appLaunchCounts, 0);
  objc_storeStrong((id *)&self->_spotlightAppLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_cachedWidgetPersonalityToAppScore, 0);
}

- (void)_personalizedGalleryWidgetsForSize:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A49EF000, log, OS_LOG_TYPE_FAULT, "ATXDefaultHomeScreenItemProducer: we should not be ranking any widgets that are 6x4 size", v1, 2u);
}

- (void)_appPredictionsWidgetDescriptor
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "ATXDefaultHomeScreenItemProducer: could not add app predictions widget to default stack due to issue initializing the special CHSWidgetDescriptor", v1, 2u);
}

@end
