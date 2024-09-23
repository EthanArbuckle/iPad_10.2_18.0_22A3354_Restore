@implementation ATXDefaultHomeScreenItemOnboardingStacksProducer

- (ATXDefaultHomeScreenItemOnboardingStacksProducer)initWithOnboardingStackWidgetCache:(id)a3 adblDrainClassification:(unint64_t)a4 isiPad:(BOOL)a5 shouldIncludeContactsWidget:(BOOL)a6 appLaunchCounts:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v22;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;

  v8 = a5;
  v12 = a7;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  v16 = (void *)objc_opt_new();
  objc_msgSend(v13, "descriptorToAppLaunchData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __162__ATXDefaultHomeScreenItemOnboardingStacksProducer_initWithOnboardingStackWidgetCache_adblDrainClassification_isiPad_shouldIncludeContactsWidget_appLaunchCounts___block_invoke;
  v26[3] = &unk_1E4D58398;
  v27 = v14;
  v28 = v15;
  v29 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v26);

  objc_msgSend(v13, "hasiCloudFamily");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v25) = 0;
  LOBYTE(v24) = a6;
  v22 = -[ATXDefaultHomeScreenItemOnboardingStacksProducer initWithCandidateWidgets:cachedWidgetPersonalityToAppScore:personalityToDescriptorDictionary:adblDrainClassification:isiPad:isDayZeroExperience:shouldIncludeContactsWidget:cachedHasiCloudFamily:appLaunchCounts:isAmbient:](self, "initWithCandidateWidgets:cachedWidgetPersonalityToAppScore:personalityToDescriptorDictionary:adblDrainClassification:isiPad:isDayZeroExperience:shouldIncludeContactsWidget:cachedHasiCloudFamily:appLaunchCounts:isAmbient:", v20, v19, v18, a4, v8, 0, v24, v21, v12, v25);

  return v22;
}

void __162__ATXDefaultHomeScreenItemOnboardingStacksProducer_initWithOnboardingStackWidgetCache_adblDrainClassification_isiPad_shouldIncludeContactsWidget_appLaunchCounts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  ATXWidgetPersonality *v9;
  void *v10;
  void *v11;
  ATXWidgetPersonality *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "extensionIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemProducerUtilities widgetDescriptorFromChronoDescriptor:appBundleId:rankType:](ATXDefaultHomeScreenItemProducerUtilities, "widgetDescriptorFromChronoDescriptor:appBundleId:rankType:", v6, v8, 1);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v9 = [ATXWidgetPersonality alloc];
  objc_msgSend(v6, "extensionBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "kind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[ATXWidgetPersonality initWithExtensionBundleId:kind:](v9, "initWithExtensionBundleId:kind:", v10, v11);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);
  v13 = *(void **)(a1 + 40);
  -[ATXWidgetPersonality stringRepresentation](v12, "stringRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v5, v14);

  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v15, v12);
}

- (ATXDefaultHomeScreenItemOnboardingStacksProducer)initWithCandidateWidgets:(id)a3 cachedWidgetPersonalityToAppScore:(id)a4 personalityToDescriptorDictionary:(id)a5 adblDrainClassification:(unint64_t)a6 isiPad:(BOOL)a7 isDayZeroExperience:(BOOL)a8 shouldIncludeContactsWidget:(BOOL)a9 cachedHasiCloudFamily:(id)a10 appLaunchCounts:(id)a11 isAmbient:(BOOL)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v20;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v21;
  id v26;
  objc_super v27;

  v16 = a3;
  v17 = a4;
  v26 = a5;
  v18 = a10;
  v19 = a11;
  v27.receiver = self;
  v27.super_class = (Class)ATXDefaultHomeScreenItemOnboardingStacksProducer;
  v20 = -[ATXDefaultHomeScreenItemOnboardingStacksProducer init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_stackableCandidates, a3);
    objc_storeStrong((id *)&v21->_cachedWidgetPersonalityToAppScore, a4);
    objc_storeStrong((id *)&v21->_personalityToDescriptorDictionary, a5);
    v21->_adblDrainClassification = a6;
    v21->_isiPad = a7;
    v21->_isDayZeroExperience = a8;
    v21->_shouldIncludeContactsWidget = a9;
    objc_storeStrong((id *)&v21->_cachedHasiCloudFamily, a10);
    objc_storeStrong((id *)&v21->_appLaunchCounts, a11);
    v21->_isAmbient = a12;
  }

  return v21;
}

- (id)onboardingStacks
{
  void *v3;

  if (-[ATXDefaultHomeScreenItemOnboardingStacksProducer isAmbient](self, "isAmbient"))
  {
    -[ATXDefaultHomeScreenItemOnboardingStacksProducer _ambientOnboardingStacks](self, "_ambientOnboardingStacks");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[ATXDefaultHomeScreenItemOnboardingStacksProducer isDayZeroExperience](self, "isDayZeroExperience"))
      -[ATXDefaultHomeScreenItemOnboardingStacksProducer _dayZeroOnboardingStacks](self, "_dayZeroOnboardingStacks");
    else
      -[ATXDefaultHomeScreenItemOnboardingStacksProducer personalizedOnboardingStacksWithRankingAlgorithm:](self, "personalizedOnboardingStacksWithRankingAlgorithm:", 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_ambientOnboardingStacks
{
  void *v3;
  void *v4;
  ATXDefaultHomeScreenItemRanker *v5;
  void *v6;
  ATXDefaultHomeScreenItemOnboardingStacks *v7;
  ATXDefaultHomeScreenItemOnboardingStacks *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:](ATXDefaultHomeScreenItemProducerUtilities, "personalitiesFromAssetsWithKey:", CFSTR("ambientOnboardingDefaultStack1RequiredWidgets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:](ATXDefaultHomeScreenItemProducerUtilities, "personalitiesFromAssetsWithKey:", CFSTR("ambientOnboardingDefaultStack2RequiredWidgets"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXDefaultHomeScreenItemOnboardingStacksProducer isDayZeroExperience](self, "isDayZeroExperience"))
  {
    +[ATXDefaultHomeScreenItemProducerUtilities stackFromDefaultStackPersonalities:suggestedSize:maxWidgetsPerStack:personalityToDescriptorDictionary:isiPad:](ATXDefaultHomeScreenItemProducerUtilities, "stackFromDefaultStackPersonalities:suggestedSize:maxWidgetsPerStack:personalityToDescriptorDictionary:isiPad:", v3, 0, 6, self->_personalityToDescriptorDictionary, self->_isiPad);
    v5 = (ATXDefaultHomeScreenItemRanker *)objc_claimAutoreleasedReturnValue();
    +[ATXDefaultHomeScreenItemProducerUtilities stackFromDefaultStackPersonalities:suggestedSize:maxWidgetsPerStack:personalityToDescriptorDictionary:isiPad:](ATXDefaultHomeScreenItemProducerUtilities, "stackFromDefaultStackPersonalities:suggestedSize:maxWidgetsPerStack:personalityToDescriptorDictionary:isiPad:", v4, 0, 6, self->_personalityToDescriptorDictionary, self->_isiPad);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [ATXDefaultHomeScreenItemOnboardingStacks alloc];
    v8 = -[ATXDefaultHomeScreenItemOnboardingStacks initWithOnboardingStack1:stack2:sortedThirdPartyWidgets:](v7, "initWithOnboardingStack1:stack2:sortedThirdPartyWidgets:", v5, v6, MEMORY[0x1E0C9AA60]);
  }
  else
  {
    v5 = -[ATXDefaultHomeScreenItemRanker initWithCachedWidgetPersonalityToAppScore:spotlightAppLaunchHistogram:appLaunchCounts:]([ATXDefaultHomeScreenItemRanker alloc], "initWithCachedWidgetPersonalityToAppScore:spotlightAppLaunchHistogram:appLaunchCounts:", self->_cachedWidgetPersonalityToAppScore, 0, self->_appLaunchCounts);
    -[ATXDefaultHomeScreenItemRanker widgetsBySortingAndFilteringWidgetsUsingOnboardingStacksAlgorithm:algorithm:regularlyUsedThreshold:](v5, "widgetsBySortingAndFilteringWidgetsUsingOnboardingStacksAlgorithm:algorithm:regularlyUsedThreshold:", self->_stackableCandidates, 2, (double)7uLL);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v9, "mutableCopy");

    +[ATXDefaultHomeScreenItemRanker filterOutDuplicateWidgetsFromSameAppBundleId:](ATXDefaultHomeScreenItemRanker, "filterOutDuplicateWidgetsFromSameAppBundleId:", v6);
    -[ATXDefaultHomeScreenItemOnboardingStacksProducer _blockedWidgetPersonalities](self, "_blockedWidgetPersonalities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXDefaultHomeScreenItemOnboardingStacksProducer _personalizedAmbientOnboardingStacksForSize:stack1RequiredWidgetPersonalities:stack2RequiredWidgetPersonalities:rankedWidgets:usedWidgetPersonalities:](self, "_personalizedAmbientOnboardingStacksForSize:stack1RequiredWidgetPersonalities:stack2RequiredWidgetPersonalities:rankedWidgets:usedWidgetPersonalities:", 0, v3, v4, v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v3;
    objc_msgSend(v11, "first");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = self->_isiPad;
    v13 = MEMORY[0x1E0C9AA60];
    +[ATXDefaultHomeScreenItemProducerUtilities defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:](ATXDefaultHomeScreenItemProducerUtilities, "defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:", v12, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, 6, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "second");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = self->_isiPad;
    +[ATXDefaultHomeScreenItemProducerUtilities defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:](ATXDefaultHomeScreenItemProducerUtilities, "defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:", v15, v13, v13, v13, 0, 6, v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[ATXDefaultHomeScreenItemOnboardingStacks initWithOnboardingStack1:stack2:sortedThirdPartyWidgets:]([ATXDefaultHomeScreenItemOnboardingStacks alloc], "initWithOnboardingStack1:stack2:sortedThirdPartyWidgets:", v14, v16, v13);
    v3 = v20;

  }
  return v8;
}

- (id)_dayZeroOnboardingStacks
{
  const __CFString *v3;
  void *v4;
  const __CFString *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  ATXDefaultHomeScreenItemOnboardingStacks *v15;
  ATXDefaultHomeScreenItemOnboardingStacks *v16;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_isiPad)
    v3 = CFSTR("dayZeroOnboardingDefaultStack1iPad");
  else
    v3 = CFSTR("dayZeroOnboardingDefaultStack1iPhone");
  +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:](ATXDefaultHomeScreenItemProducerUtilities, "personalitiesFromAssetsWithKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isiPad)
    v5 = CFSTR("dayZeroOnboardingDefaultStack2iPad");
  else
    v5 = CFSTR("dayZeroOnboardingDefaultStack2iPhone");
  +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:](ATXDefaultHomeScreenItemProducerUtilities, "personalitiesFromAssetsWithKey:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isTodayWidgetPermittedForLocale:", v8);

  __atxlog_handle_home_screen();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      v18 = 136315138;
      v19 = "-[ATXDefaultHomeScreenItemOnboardingStacksProducer _dayZeroOnboardingStacks]";
      _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "%s: allowing news widget", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    if (v11)
    {
      v18 = 136315138;
      v19 = "-[ATXDefaultHomeScreenItemOnboardingStacksProducer _dayZeroOnboardingStacks]";
      _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "%s: not allowing news widget", (uint8_t *)&v18, 0xCu);
    }

    objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_15);
    v12 = objc_claimAutoreleasedReturnValue();

    -[NSObject _pas_filteredArrayWithTest:](v6, "_pas_filteredArrayWithTest:", &__block_literal_global_58);
    v10 = v6;
    v6 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v12;
  }

  +[ATXDefaultHomeScreenItemProducerUtilities stackFromDefaultStackPersonalities:suggestedSize:maxWidgetsPerStack:personalityToDescriptorDictionary:isiPad:](ATXDefaultHomeScreenItemProducerUtilities, "stackFromDefaultStackPersonalities:suggestedSize:maxWidgetsPerStack:personalityToDescriptorDictionary:isiPad:", v4, 0, 4, self->_personalityToDescriptorDictionary, self->_isiPad);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemProducerUtilities stackFromDefaultStackPersonalities:suggestedSize:maxWidgetsPerStack:personalityToDescriptorDictionary:isiPad:](ATXDefaultHomeScreenItemProducerUtilities, "stackFromDefaultStackPersonalities:suggestedSize:maxWidgetsPerStack:personalityToDescriptorDictionary:isiPad:", v6, 0, 4, self->_personalityToDescriptorDictionary, self->_isiPad);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [ATXDefaultHomeScreenItemOnboardingStacks alloc];
  v16 = -[ATXDefaultHomeScreenItemOnboardingStacks initWithOnboardingStack1:stack2:sortedThirdPartyWidgets:](v15, "initWithOnboardingStack1:stack2:sortedThirdPartyWidgets:", v13, v14, MEMORY[0x1E0C9AA60]);

  return v16;
}

uint64_t __76__ATXDefaultHomeScreenItemOnboardingStacksProducer__dayZeroOnboardingStacks__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "stringRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.news.widget:today")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "stringRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.news.widget:topic")) ^ 1;

  }
  return v4;
}

uint64_t __76__ATXDefaultHomeScreenItemOnboardingStacksProducer__dayZeroOnboardingStacks__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "stringRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.news.widget:today")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "stringRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.news.widget:topic")) ^ 1;

  }
  return v4;
}

- (id)personalizedOnboardingStacksWithRankingAlgorithm:(int)a3
{
  uint64_t v3;
  ATXDefaultHomeScreenItemRanker *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  char *v31;
  unint64_t adblDrainClassification;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  char *v39;
  unint64_t v40;
  ATXDefaultHomeScreenItemOnboardingStacks *v41;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  ATXDefaultHomeScreenItemRanker *v52;
  void *v53;
  void *v54;
  void *v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v3 = *(_QWORD *)&a3;
  v60 = *MEMORY[0x1E0C80C00];
  v5 = -[ATXDefaultHomeScreenItemRanker initWithCachedWidgetPersonalityToAppScore:spotlightAppLaunchHistogram:appLaunchCounts:]([ATXDefaultHomeScreenItemRanker alloc], "initWithCachedWidgetPersonalityToAppScore:spotlightAppLaunchHistogram:appLaunchCounts:", self->_cachedWidgetPersonalityToAppScore, 0, self->_appLaunchCounts);
  +[ATXDefaultHomeScreenItemProducerUtilities splitDescriptorsIntoFirstPartyAndThirdParty:](ATXDefaultHomeScreenItemProducerUtilities, "splitDescriptorsIntoFirstPartyAndThirdParty:", self->_stackableCandidates);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v5;
  -[ATXDefaultHomeScreenItemRanker widgetsBySortingAndFilteringWidgetsUsingOnboardingStacksAlgorithm:algorithm:regularlyUsedThreshold:](v5, "widgetsBySortingAndFilteringWidgetsUsingOnboardingStacksAlgorithm:algorithm:regularlyUsedThreshold:", v6, v3, (double)7uLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_home_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "-[ATXDefaultHomeScreenItemOnboardingStacksProducer personalizedOnboardingStacksWithRankingAlgorithm:]";
    v58 = 2048;
    v59 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "%s: %lu available 3P widgets to add to stack (all sizes)", buf, 0x16u);
  }

  if (self->_isiPad)
    v9 = CFSTR("personalizedOnboardingDefaultStack1RequiredWidgetsiPad");
  else
    v9 = CFSTR("personalizedOnboardingDefaultStack1RequiredWidgetsiPhone");
  +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:](ATXDefaultHomeScreenItemProducerUtilities, "personalitiesFromAssetsWithKey:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (self->_isiPad)
    v11 = CFSTR("personalizedOnboardingDefaultStack2RequiredWidgetsiPad");
  else
    v11 = CFSTR("personalizedOnboardingDefaultStack2RequiredWidgetsiPhone");
  +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:](ATXDefaultHomeScreenItemProducerUtilities, "personalitiesFromAssetsWithKey:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (self->_isiPad)
    v13 = CFSTR("personalizedOnboardingDefaultStack1ConditionalWidgetsiPad");
  else
    v13 = CFSTR("personalizedOnboardingDefaultStack1ConditionalWidgetsiPhone");
  +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:](ATXDefaultHomeScreenItemProducerUtilities, "personalitiesFromAssetsWithKey:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (self->_isiPad)
    v15 = CFSTR("personalizedOnboardingDefaultStack2ConditionalWidgetsiPad");
  else
    v15 = CFSTR("personalizedOnboardingDefaultStack2ConditionalWidgetsiPhone");
  +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:](ATXDefaultHomeScreenItemProducerUtilities, "personalitiesFromAssetsWithKey:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  if (self->_isiPad)
    v17 = CFSTR("personalizedOnboardingDefaultStack1FallbackWidgetsiPad");
  else
    v17 = CFSTR("personalizedOnboardingDefaultStack1FallbackWidgetsiPhone");
  +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:](ATXDefaultHomeScreenItemProducerUtilities, "personalitiesFromAssetsWithKey:", v17);
  v18 = objc_claimAutoreleasedReturnValue();
  if (self->_isiPad)
    v19 = CFSTR("personalizedOnboardingDefaultStack2FallbackWidgetsiPad");
  else
    v19 = CFSTR("personalizedOnboardingDefaultStack2FallbackWidgetsiPhone");
  +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:](ATXDefaultHomeScreenItemProducerUtilities, "personalitiesFromAssetsWithKey:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemOnboardingStacksProducer _blockedWidgetPersonalities](self, "_blockedWidgetPersonalities");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemOnboardingStacksProducer _personalizedOnboardingStacksForSize:requiredWidgetPersonalitiesForStack1:requiredWidgetPersonalitiesForStack2:conditionalWidgetPersonalitiesForStack1:conditionalWidgetPersonalitiesForStack2:fallbackWidgetPersonalitiesForStack1:fallbackWidgetPersonalitiesForStack2:rankedThirdPartyWidgets:blockedWidgetPersonalities:](self, "_personalizedOnboardingStacksForSize:requiredWidgetPersonalitiesForStack1:requiredWidgetPersonalitiesForStack2:conditionalWidgetPersonalitiesForStack1:conditionalWidgetPersonalitiesForStack2:fallbackWidgetPersonalitiesForStack1:fallbackWidgetPersonalitiesForStack2:rankedThirdPartyWidgets:blockedWidgetPersonalities:", 0, v10, v12, v14, v16, v18, v20, v7, v21);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemOnboardingStacksProducer _personalizedOnboardingStacksForSize:requiredWidgetPersonalitiesForStack1:requiredWidgetPersonalitiesForStack2:conditionalWidgetPersonalitiesForStack1:conditionalWidgetPersonalitiesForStack2:fallbackWidgetPersonalitiesForStack1:fallbackWidgetPersonalitiesForStack2:rankedThirdPartyWidgets:blockedWidgetPersonalities:](self, "_personalizedOnboardingStacksForSize:requiredWidgetPersonalitiesForStack1:requiredWidgetPersonalitiesForStack2:conditionalWidgetPersonalitiesForStack1:conditionalWidgetPersonalitiesForStack2:fallbackWidgetPersonalitiesForStack1:fallbackWidgetPersonalitiesForStack2:rankedThirdPartyWidgets:blockedWidgetPersonalities:", 1, v10, v12, v14, v16, v18, v20, v7, v21);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemOnboardingStacksProducer _personalizedOnboardingStacksForSize:requiredWidgetPersonalitiesForStack1:requiredWidgetPersonalitiesForStack2:conditionalWidgetPersonalitiesForStack1:conditionalWidgetPersonalitiesForStack2:fallbackWidgetPersonalitiesForStack1:fallbackWidgetPersonalitiesForStack2:rankedThirdPartyWidgets:blockedWidgetPersonalities:](self, "_personalizedOnboardingStacksForSize:requiredWidgetPersonalitiesForStack1:requiredWidgetPersonalitiesForStack2:conditionalWidgetPersonalitiesForStack1:conditionalWidgetPersonalitiesForStack2:fallbackWidgetPersonalitiesForStack1:fallbackWidgetPersonalitiesForStack2:rankedThirdPartyWidgets:blockedWidgetPersonalities:", 2, v10, v12, v14, v16, v18, v20, v7, v21);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)v10;
  v50 = v7;
  v47 = (void *)v14;
  v48 = (void *)v12;
  v45 = (void *)v18;
  v46 = (void *)v16;
  if (self->_isiPad)
  {
    -[ATXDefaultHomeScreenItemOnboardingStacksProducer _personalizedOnboardingStacksForSize:requiredWidgetPersonalitiesForStack1:requiredWidgetPersonalitiesForStack2:conditionalWidgetPersonalitiesForStack1:conditionalWidgetPersonalitiesForStack2:fallbackWidgetPersonalitiesForStack1:fallbackWidgetPersonalitiesForStack2:rankedThirdPartyWidgets:blockedWidgetPersonalities:](self, "_personalizedOnboardingStacksForSize:requiredWidgetPersonalitiesForStack1:requiredWidgetPersonalitiesForStack2:conditionalWidgetPersonalitiesForStack1:conditionalWidgetPersonalitiesForStack2:fallbackWidgetPersonalitiesForStack1:fallbackWidgetPersonalitiesForStack2:rankedThirdPartyWidgets:blockedWidgetPersonalities:", 4, v10, v12, v14, v16, v18, v20, v7, v21, v18, v16, v14, v12, v10);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = objc_alloc(MEMORY[0x1E0D81638]);
    v22 = objc_msgSend(v23, "initWithFirst:second:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  }
  v24 = (void *)v22;
  objc_msgSend(v55, "first");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "first");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "first");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "first");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v43) = self->_isiPad;
  +[ATXDefaultHomeScreenItemProducerUtilities defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:](ATXDefaultHomeScreenItemProducerUtilities, "defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:", v25, v26, v27, v28, v43);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_home_screen();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v29, "compactDescription");
    v31 = (char *)objc_claimAutoreleasedReturnValue();
    adblDrainClassification = self->_adblDrainClassification;
    *(_DWORD *)buf = 138543618;
    v57 = v31;
    v58 = 2048;
    v59 = adblDrainClassification;
    _os_log_impl(&dword_1A49EF000, v30, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: generated personalized onboarding stack 1:%{public}@, battery drain: %lu", buf, 0x16u);

  }
  objc_msgSend(v55, "second");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "second");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "second");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "second");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v44) = self->_isiPad;
  +[ATXDefaultHomeScreenItemProducerUtilities defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:](ATXDefaultHomeScreenItemProducerUtilities, "defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:", v33, v34, v35, v36, v44);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_home_screen();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v29, "compactDescription");
    v39 = (char *)objc_claimAutoreleasedReturnValue();
    v40 = self->_adblDrainClassification;
    *(_DWORD *)buf = 138543618;
    v57 = v39;
    v58 = 2048;
    v59 = v40;
    _os_log_impl(&dword_1A49EF000, v38, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: generated personalized onboarding stack 2:%{public}@, battery drain: %lu", buf, 0x16u);

  }
  v41 = -[ATXDefaultHomeScreenItemOnboardingStacks initWithOnboardingStack1:stack2:sortedThirdPartyWidgets:]([ATXDefaultHomeScreenItemOnboardingStacks alloc], "initWithOnboardingStack1:stack2:sortedThirdPartyWidgets:", v29, v37, v50);

  return v41;
}

- (id)_personalizedAmbientOnboardingStacksForSize:(unint64_t)a3 stack1RequiredWidgetPersonalities:(id)a4 stack2RequiredWidgetPersonalities:(id)a5 rankedWidgets:(id)a6 usedWidgetPersonalities:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v41;
  void *v42;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v43;
  unint64_t v44;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v45 = a5;
  v41 = a6;
  v13 = a7;
  v46 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v43 = self;
  v44 = a3;
  +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:size:personalityToDescriptorDictionary:](ATXDefaultHomeScreenItemProducerUtilities, "widgetsFromPersonalities:size:personalityToDescriptorDictionary:", v12, a3, self->_personalityToDescriptorDictionary);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v52 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
        +[ATXWidgetPersonality stringRepresentationForATXHomeScreenWidgetDescriptor:](ATXWidgetPersonality, "stringRepresentationForATXHomeScreenWidgetDescriptor:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "containsObject:", v21))
        {
          __atxlog_handle_home_screen();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v57 = v21;
            _os_log_impl(&dword_1A49EF000, v22, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: not adding required widget %{public}@ to first ambient onboarding stack because it is already used (or on deny list)", buf, 0xCu);
          }

        }
        else
        {
          objc_msgSend(v46, "addObject:", v20);
          objc_msgSend(v13, "addObject:", v21);
        }

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v17);
  }
  v42 = v12;
  objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_61);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v23);

  +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:size:personalityToDescriptorDictionary:](ATXDefaultHomeScreenItemProducerUtilities, "widgetsFromPersonalities:size:personalityToDescriptorDictionary:", v45, v44, v43->_personalityToDescriptorDictionary);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v48 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
        +[ATXWidgetPersonality stringRepresentationForATXHomeScreenWidgetDescriptor:](ATXWidgetPersonality, "stringRepresentationForATXHomeScreenWidgetDescriptor:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "containsObject:", v30))
        {
          __atxlog_handle_home_screen();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v57 = v30;
            _os_log_impl(&dword_1A49EF000, v31, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: not adding required widget %{public}@ to second ambient onboarding stack because it is already used (or on deny list)", buf, 0xCu);
          }

        }
        else
        {
          objc_msgSend(v14, "addObject:", v29);
          objc_msgSend(v13, "addObject:", v30);
        }

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v26);
  }
  objc_msgSend(v45, "_pas_mappedArrayWithTransform:", &__block_literal_global_63);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v32);

  if ((unint64_t)objc_msgSend(v46, "count") <= 5)
  {
    v33 = MEMORY[0x1E0C9AA60];
    do
    {
      -[ATXDefaultHomeScreenItemOnboardingStacksProducer _firstUnusedWidgetFromList:fallbackWidgets:usedPersonalities:size:](v43, "_firstUnusedWidgetFromList:fallbackWidgets:usedPersonalities:size:", v41, v33, v13, v44);
      v34 = objc_claimAutoreleasedReturnValue();
      if (!v34)
        break;
      v35 = (void *)v34;
      -[ATXDefaultHomeScreenItemOnboardingStacksProducer _addWidget:toStack:andMarkAsUsed:](v43, "_addWidget:toStack:andMarkAsUsed:", v34, v46, v13);

    }
    while ((unint64_t)objc_msgSend(v46, "count") < 6);
  }
  if ((unint64_t)objc_msgSend(v14, "count") <= 5)
  {
    v36 = MEMORY[0x1E0C9AA60];
    do
    {
      -[ATXDefaultHomeScreenItemOnboardingStacksProducer _firstUnusedWidgetFromList:fallbackWidgets:usedPersonalities:size:](v43, "_firstUnusedWidgetFromList:fallbackWidgets:usedPersonalities:size:", v41, v36, v13, v44);
      v37 = objc_claimAutoreleasedReturnValue();
      if (!v37)
        break;
      v38 = (void *)v37;
      -[ATXDefaultHomeScreenItemOnboardingStacksProducer _addWidget:toStack:andMarkAsUsed:](v43, "_addWidget:toStack:andMarkAsUsed:", v37, v14, v13);

    }
    while ((unint64_t)objc_msgSend(v14, "count") < 6);
  }
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v46, v14);

  return v39;
}

uint64_t __202__ATXDefaultHomeScreenItemOnboardingStacksProducer__personalizedAmbientOnboardingStacksForSize_stack1RequiredWidgetPersonalities_stack2RequiredWidgetPersonalities_rankedWidgets_usedWidgetPersonalities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringRepresentation");
}

uint64_t __202__ATXDefaultHomeScreenItemOnboardingStacksProducer__personalizedAmbientOnboardingStacksForSize_stack1RequiredWidgetPersonalities_stack2RequiredWidgetPersonalities_rankedWidgets_usedWidgetPersonalities___block_invoke_62(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringRepresentation");
}

- (id)_personalizedOnboardingStacksForSize:(unint64_t)a3 requiredWidgetPersonalitiesForStack1:(id)a4 requiredWidgetPersonalitiesForStack2:(id)a5 conditionalWidgetPersonalitiesForStack1:(id)a6 conditionalWidgetPersonalitiesForStack2:(id)a7 fallbackWidgetPersonalitiesForStack1:(id)a8 fallbackWidgetPersonalitiesForStack2:(id)a9 rankedThirdPartyWidgets:(id)a10 blockedWidgetPersonalities:(id)a11
{
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v31 = a11;
  v34 = a9;
  v32 = a8;
  v33 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  +[ATXDefaultHomeScreenItemProducerUtilities widgets:filteredForSize:](ATXDefaultHomeScreenItemProducerUtilities, "widgets:filteredForSize:", a10, a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");

  +[ATXDefaultHomeScreenItemRanker filterOutDuplicateWidgetsFromSameAppBundleId:](ATXDefaultHomeScreenItemRanker, "filterOutDuplicateWidgetsFromSameAppBundleId:", v22);
  __atxlog_handle_home_screen();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v36 = "-[ATXDefaultHomeScreenItemOnboardingStacksProducer _personalizedOnboardingStacksForSize:requiredWidgetPersonal"
          "itiesForStack1:requiredWidgetPersonalitiesForStack2:conditionalWidgetPersonalitiesForStack1:conditionalWidgetP"
          "ersonalitiesForStack2:fallbackWidgetPersonalitiesForStack1:fallbackWidgetPersonalitiesForStack2:rankedThirdPar"
          "tyWidgets:blockedWidgetPersonalities:]";
    v37 = 2048;
    v38 = objc_msgSend(v22, "count");
    v39 = 2048;
    v40 = a3;
    _os_log_impl(&dword_1A49EF000, v23, OS_LOG_TYPE_DEFAULT, "%s: %lu available 3P widgets for onboarding stack of size:%lu)", buf, 0x20u);
  }

  v24 = (void *)objc_msgSend(v31, "mutableCopy");
  LOBYTE(v29) = 1;
  -[ATXDefaultHomeScreenItemOnboardingStacksProducer _personalizedOnboardingStackForSize:requiredWidgetPersonalities:conditionalWidgetPersonalities:fallbackWidgetPersonalities:rankedThirdPartyWidgets:usedWidgetPersonalities:shouldAdd3PWidgetToStack:](self, "_personalizedOnboardingStackForSize:requiredWidgetPersonalities:conditionalWidgetPersonalities:fallbackWidgetPersonalities:rankedThirdPartyWidgets:usedWidgetPersonalities:shouldAdd3PWidgetToStack:", a3, v20, v18, v32, v22, v24, v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v30) = self->_adblDrainClassification != 3;
  -[ATXDefaultHomeScreenItemOnboardingStacksProducer _personalizedOnboardingStackForSize:requiredWidgetPersonalities:conditionalWidgetPersonalities:fallbackWidgetPersonalities:rankedThirdPartyWidgets:usedWidgetPersonalities:shouldAdd3PWidgetToStack:](self, "_personalizedOnboardingStackForSize:requiredWidgetPersonalities:conditionalWidgetPersonalities:fallbackWidgetPersonalities:rankedThirdPartyWidgets:usedWidgetPersonalities:shouldAdd3PWidgetToStack:", a3, v19, v33, v34, v22, v24, v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v25, v26);
  return v27;
}

- (id)_blockedWidgetPersonalities
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  if ((self->_adblDrainClassification & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:](ATXDefaultHomeScreenItemProducerUtilities, "personalitiesFromAssetsWithKey:", CFSTR("personalizedOnboardingDefaultStackADBLDenyListWidgets"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v3;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: deny list personalities: %@", (uint8_t *)&v14, 0xCu);
  }

  v6 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_66);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v11 = objc_msgSend(v10, "isTodayWidgetPermittedForLocale:", v9);

  if ((v11 & 1) == 0)
  {
    __atxlog_handle_home_screen();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = v9;
      _os_log_impl(&dword_1A49EF000, v12, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: in a region (%{public}@) that does not allow news widget, adding news to deny list", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(v8, "addObject:", CFSTR("com.apple.news.widget:today"));
    objc_msgSend(v8, "addObject:", CFSTR("com.apple.news.widget:topic"));
  }

  return v8;
}

uint64_t __79__ATXDefaultHomeScreenItemOnboardingStacksProducer__blockedWidgetPersonalities__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringRepresentation");
}

- (id)_personalizedOnboardingStackForSize:(unint64_t)a3 requiredWidgetPersonalities:(id)a4 conditionalWidgetPersonalities:(id)a5 fallbackWidgetPersonalities:(id)a6 rankedThirdPartyWidgets:(id)a7 usedWidgetPersonalities:(id)a8 shouldAdd3PWidgetToStack:(BOOL)a9
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  unsigned int (**v36)(void);
  ATXWidgetPersonality *v37;
  void *v38;
  char v39;
  NSObject *v40;
  NSObject *v41;
  _BOOL4 v42;
  _BOOL4 v43;
  NSNumber *cachedHasiCloudFamily;
  id v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  ATXDefaultHomeScreenItemRanker *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  unint64_t adblDrainClassification;
  id v59;
  id v60;
  id v61;
  void *v62;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v63;
  unint64_t v64;
  id v65;
  id obj;
  _QWORD v67[5];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  _BYTE v73[10];
  unint64_t v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v61 = a5;
  v60 = a6;
  v59 = a7;
  v16 = a8;
  v64 = a3;
  v65 = (id)objc_opt_new();
  v62 = v15;
  v63 = self;
  +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:size:personalityToDescriptorDictionary:](ATXDefaultHomeScreenItemProducerUtilities, "widgetsFromPersonalities:size:personalityToDescriptorDictionary:", v15, a3, self->_personalityToDescriptorDictionary);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v18;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v69 != v21)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
        +[ATXWidgetPersonality stringRepresentationForATXHomeScreenWidgetDescriptor:](ATXWidgetPersonality, "stringRepresentationForATXHomeScreenWidgetDescriptor:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "containsObject:", v24))
        {
          __atxlog_handle_home_screen();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)v73 = v24;
            *(_WORD *)&v73[8] = 2048;
            v74 = v64;
            _os_log_impl(&dword_1A49EF000, v25, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: not adding required widget %{public}@ to onboarding stack of size: %lu because it is already used (or on deny list)", buf, 0x16u);
          }

        }
        else
        {
          objc_msgSend(v65, "addObject:", v23);
          objc_msgSend(v16, "addObject:", v24);
        }

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
    }
    while (v20);
  }

  objc_msgSend(v15, "_pas_mappedArrayWithTransform:", &__block_literal_global_67);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v26);

  v27 = objc_alloc(MEMORY[0x1E0C99E60]);
  v28 = (void *)CFPreferencesCopyAppValue(CFSTR("SBSearchDisabledShortcuts"), CFSTR("com.apple.spotlightui"));
  v29 = v28;
  if (v28)
    v30 = v28;
  else
    v30 = (id)objc_opt_new();
  v31 = v30;

  v32 = (void *)objc_msgSend(v27, "initWithArray:", v31);
  if (-[ATXDefaultHomeScreenItemOnboardingStacksProducer isiPad](v63, "isiPad")
    && -[ATXDefaultHomeScreenItemOnboardingStacksProducer shouldIncludeContactsWidget](v63, "shouldIncludeContactsWidget"))
  {
    __atxlog_handle_home_screen();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v61;
    v35 = v59;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v33, OS_LOG_TYPE_DEFAULT, "Considering Contacts widget... is iPad: YES, should include: YES", buf, 2u);
    }

    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __248__ATXDefaultHomeScreenItemOnboardingStacksProducer__personalizedOnboardingStackForSize_requiredWidgetPersonalities_conditionalWidgetPersonalities_fallbackWidgetPersonalities_rankedThirdPartyWidgets_usedWidgetPersonalities_shouldAdd3PWidgetToStack___block_invoke_69;
    v67[3] = &unk_1E4D58400;
    v67[4] = v63;
    v36 = (unsigned int (**)(void))MEMORY[0x1A85A511C](v67);
    if (v36[2]())
    {
      v37 = -[ATXWidgetPersonality initWithExtensionBundleId:kind:]([ATXWidgetPersonality alloc], "initWithExtensionBundleId:kind:", CFSTR("com.apple.PeopleViewService.PeopleWidget-iOS"), CFSTR("MultipleContactWidget_iOS"));
      -[ATXWidgetPersonality stringRepresentation](v37, "stringRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v16, "containsObject:", v38);

      if ((v39 & 1) != 0)
      {
        __atxlog_handle_home_screen();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A49EF000, v40, OS_LOG_TYPE_DEFAULT, "Contacts widget already exists in used personalities list, not adding", buf, 2u);
        }
      }
      else
      {
        v45 = objc_alloc(MEMORY[0x1E0D100B8]);
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", CFSTR("com.apple.PeopleViewService.PeopleWidget-iOS"), CFSTR("com.apple.PeopleViewService"), 0);
        v40 = objc_msgSend(v45, "initWithExtensionIdentity:kind:supportedFamilies:intentType:", v46, CFSTR("MultipleContactWidget_iOS"), 28, CFSTR("SelectPeopleIntent"));

        v47 = (void *)objc_opt_new();
        objc_msgSend(v47, "setAvocadoDescriptor:", v40);
        objc_msgSend(v47, "setSuggestedSize:", 1);
        if (-[ATXDefaultHomeScreenItemOnboardingStacksProducer _shouldAddWidget:andFilterFromApps:](v63, "_shouldAddWidget:andFilterFromApps:", v47, v32))
        {
          -[ATXDefaultHomeScreenItemOnboardingStacksProducer _addWidget:toStack:andMarkAsUsed:](v63, "_addWidget:toStack:andMarkAsUsed:", v47, v65, v16);
        }
        __atxlog_handle_home_screen();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v73 = v47;
          _os_log_impl(&dword_1A49EF000, v48, OS_LOG_TYPE_DEFAULT, "Added contacts widget to stack: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      __atxlog_handle_home_screen();
      v37 = (ATXWidgetPersonality *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v37->super, OS_LOG_TYPE_DEFAULT))
      {
        cachedHasiCloudFamily = v63->_cachedHasiCloudFamily;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v73 = cachedHasiCloudFamily;
        _os_log_impl(&dword_1A49EF000, &v37->super, OS_LOG_TYPE_DEFAULT, "Not considering Contacts widget... no iCloud family (cached bit: %@)", buf, 0xCu);
      }
    }

  }
  else
  {
    __atxlog_handle_home_screen();
    v41 = objc_claimAutoreleasedReturnValue();
    v34 = v61;
    v35 = v59;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = -[ATXDefaultHomeScreenItemOnboardingStacksProducer isiPad](v63, "isiPad");
      v43 = -[ATXDefaultHomeScreenItemOnboardingStacksProducer shouldIncludeContactsWidget](v63, "shouldIncludeContactsWidget");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v73 = v42;
      *(_WORD *)&v73[4] = 1024;
      *(_DWORD *)&v73[6] = v43;
      _os_log_impl(&dword_1A49EF000, v41, OS_LOG_TYPE_DEFAULT, "Not considering Contacts widget... is iPad: %{BOOL}d, should include: %{BOOL}d", buf, 0xEu);
    }

  }
  +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:size:personalityToDescriptorDictionary:](ATXDefaultHomeScreenItemProducerUtilities, "widgetsFromPersonalities:size:personalityToDescriptorDictionary:", v34, v64, v63->_personalityToDescriptorDictionary);
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = -[ATXDefaultHomeScreenItemRanker initWithCachedWidgetPersonalityToAppScore:spotlightAppLaunchHistogram:appLaunchCounts:]([ATXDefaultHomeScreenItemRanker alloc], "initWithCachedWidgetPersonalityToAppScore:spotlightAppLaunchHistogram:appLaunchCounts:", v63->_cachedWidgetPersonalityToAppScore, 0, v63->_appLaunchCounts);
  v51 = (void *)v49;
  -[ATXDefaultHomeScreenItemRanker widgetsBySortingAndFilteringWidgetsUsingOnboardingStacksAlgorithm:algorithm:regularlyUsedThreshold:](v50, "widgetsBySortingAndFilteringWidgetsUsingOnboardingStacksAlgorithm:algorithm:regularlyUsedThreshold:", v49, 3, (double)7uLL);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:size:personalityToDescriptorDictionary:](ATXDefaultHomeScreenItemProducerUtilities, "widgetsFromPersonalities:size:personalityToDescriptorDictionary:", v60, v64, v63->_personalityToDescriptorDictionary);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemOnboardingStacksProducer _firstUnusedWidgetFromList:fallbackWidgets:usedPersonalities:size:](v63, "_firstUnusedWidgetFromList:fallbackWidgets:usedPersonalities:size:", v52, v53, v16, v64);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemOnboardingStacksProducer _addWidget:toStack:andMarkAsUsed:](v63, "_addWidget:toStack:andMarkAsUsed:", v54, v65, v16);
  if ((unint64_t)objc_msgSend(v65, "count") <= 2)
  {
    -[ATXDefaultHomeScreenItemOnboardingStacksProducer _firstUnusedWidgetFromList:fallbackWidgets:usedPersonalities:size:](v63, "_firstUnusedWidgetFromList:fallbackWidgets:usedPersonalities:size:", v52, v53, v16, v64);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXDefaultHomeScreenItemOnboardingStacksProducer _addWidget:toStack:andMarkAsUsed:](v63, "_addWidget:toStack:andMarkAsUsed:", v55, v65, v16);

  }
  if (a9)
  {
    -[ATXDefaultHomeScreenItemOnboardingStacksProducer _firstWidgetThatIsntUsedYet:usedPersonalities:](v63, "_firstWidgetThatIsntUsedYet:usedPersonalities:", v35, v16);
    v56 = objc_claimAutoreleasedReturnValue();
    -[ATXDefaultHomeScreenItemOnboardingStacksProducer _addWidget:toStack:andMarkAsUsed:](v63, "_addWidget:toStack:andMarkAsUsed:", v56, v65, v16);
  }
  else
  {
    __atxlog_handle_home_screen();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      adblDrainClassification = v63->_adblDrainClassification;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v73 = v64;
      *(_WORD *)&v73[8] = 2048;
      v74 = adblDrainClassification;
      _os_log_impl(&dword_1A49EF000, v56, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: not adding 3P widget to onboarding stack of size: %lu because of drain: %lu", buf, 0x16u);
    }
  }

  return v65;
}

uint64_t __248__ATXDefaultHomeScreenItemOnboardingStacksProducer__personalizedOnboardingStackForSize_requiredWidgetPersonalities_conditionalWidgetPersonalities_fallbackWidgetPersonalities_rankedThirdPartyWidgets_usedWidgetPersonalities_shouldAdd3PWidgetToStack___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringRepresentation");
}

uint64_t __248__ATXDefaultHomeScreenItemOnboardingStacksProducer__personalizedOnboardingStackForSize_requiredWidgetPersonalities_conditionalWidgetPersonalities_fallbackWidgetPersonalities_rankedThirdPartyWidgets_usedWidgetPersonalities_shouldAdd3PWidgetToStack___block_invoke_69(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  void *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "BOOLValue"))
  {
    __atxlog_handle_home_screen();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5[0]) = 0;
      _os_log_impl(&dword_1A49EF000, v1, OS_LOG_TYPE_DEFAULT, "Considering Contacts widget... has cached iCloud family", (uint8_t *)v5, 2u);
    }
    v2 = 1;
  }
  else
  {
    v3 = (void *)objc_opt_new();
    v2 = objc_msgSend(v3, "hasiCloudFamily");

    __atxlog_handle_home_screen();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v2;
      _os_log_impl(&dword_1A49EF000, v1, OS_LOG_TYPE_DEFAULT, "Considering Contacts widget... scorer response: %{BOOL}d", (uint8_t *)v5, 8u);
    }
  }

  return v2;
}

- (void)_addWidget:(id)a3 toStack:(id)a4 andMarkAsUsed:(id)a5
{
  id v7;
  id v8;
  id v9;

  if (a3)
  {
    v7 = a5;
    v8 = a3;
    objc_msgSend(a4, "addObject:", v8);
    +[ATXWidgetPersonality stringRepresentationForATXHomeScreenWidgetDescriptor:](ATXWidgetPersonality, "stringRepresentationForATXHomeScreenWidgetDescriptor:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v9);
  }
}

- (BOOL)_shouldAddWidget:(id)a3 andFilterFromApps:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  int v10;
  NSObject *v11;
  char *v12;
  const char *v13;
  void *v14;
  _BOOL4 v15;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "appBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (!v7)
  {
    __atxlog_handle_home_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315394;
      v18 = "-[ATXDefaultHomeScreenItemOnboardingStacksProducer _shouldAddWidget:andFilterFromApps:]";
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "%s: No parent bundleId for Widget descriptor: %@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_11;
  }
  objc_msgSend(v5, "appBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "containsObject:", v9);

  if (v10)
  {
    __atxlog_handle_home_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "appBundleId");
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v12;
      v13 = "ATXDefaultHomeScreenItemProducer: Show on Homescreen is turned off for app with bundleId: %@. Hence not adding its widget";
LABEL_10:
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v5, "appBundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[ATXAppProtectionInfo bundleIdIsLockedOrHiddenByUserPreference:](ATXAppProtectionInfo, "bundleIdIsLockedOrHiddenByUserPreference:", v14);

    if (!v15)
    {
      v8 = 1;
      goto LABEL_12;
    }
    __atxlog_handle_home_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "appBundleId");
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v12;
      v13 = "ATXDefaultHomeScreenItemProducer: App: %@ is locked or hidden by user preference. Hence not adding its widget";
      goto LABEL_10;
    }
  }
LABEL_11:

LABEL_12:
  return v8;
}

- (id)_firstUnusedWidgetFromList:(id)a3 fallbackWidgets:(id)a4 usedPersonalities:(id)a5 size:(unint64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v9 = a4;
  v10 = a5;
  -[ATXDefaultHomeScreenItemOnboardingStacksProducer _firstWidgetThatIsntUsedYet:usedPersonalities:](self, "_firstWidgetThatIsntUsedYet:usedPersonalities:", a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    -[ATXDefaultHomeScreenItemOnboardingStacksProducer _firstWidgetThatIsntUsedYet:usedPersonalities:](self, "_firstWidgetThatIsntUsedYet:usedPersonalities:", v9, v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

- (id)_firstWidgetThatIsntUsedYet:(id)a3 usedPersonalities:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = a4;
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = (void *)CFPreferencesCopyAppValue(CFSTR("SBSearchDisabledShortcuts"), CFSTR("com.apple.spotlightui"));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_opt_new();
  v11 = v10;

  v12 = (void *)objc_msgSend(v7, "initWithArray:", v11);
  v13 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = v6;
  v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        +[ATXWidgetPersonality stringRepresentationForATXHomeScreenWidgetDescriptor:](ATXWidgetPersonality, "stringRepresentationForATXHomeScreenWidgetDescriptor:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[ATXDefaultHomeScreenItemOnboardingStacksProducer _shouldAddWidget:andFilterFromApps:](self, "_shouldAddWidget:andFilterFromApps:", v19, v12)|| (objc_msgSend(v13, "addObject:", v20), !objc_msgSend(v24, "containsObject:", v20)))
        {
          v22 = v19;

          v21 = v14;
          goto LABEL_17;
        }

      }
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
        continue;
      break;
    }
  }

  __atxlog_handle_home_screen();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    -[ATXDefaultHomeScreenItemOnboardingStacksProducer _firstWidgetThatIsntUsedYet:usedPersonalities:].cold.1((uint64_t)v24, (uint64_t)v13, v21);
  v22 = 0;
LABEL_17:

  return v22;
}

- (NSArray)stackableCandidates
{
  return self->_stackableCandidates;
}

- (NSMutableDictionary)cachedWidgetPersonalityToAppScore
{
  return self->_cachedWidgetPersonalityToAppScore;
}

- (void)setCachedWidgetPersonalityToAppScore:(id)a3
{
  objc_storeStrong((id *)&self->_cachedWidgetPersonalityToAppScore, a3);
}

- (NSDictionary)personalityToDescriptorDictionary
{
  return self->_personalityToDescriptorDictionary;
}

- (void)setPersonalityToDescriptorDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_personalityToDescriptorDictionary, a3);
}

- (BOOL)isDayZeroExperience
{
  return self->_isDayZeroExperience;
}

- (BOOL)isiPad
{
  return self->_isiPad;
}

- (NSNumber)cachedHasiCloudFamily
{
  return self->_cachedHasiCloudFamily;
}

- (BOOL)shouldIncludeContactsWidget
{
  return self->_shouldIncludeContactsWidget;
}

- (unint64_t)adblDrainClassification
{
  return self->_adblDrainClassification;
}

- (BOOL)isAmbient
{
  return self->_isAmbient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedHasiCloudFamily, 0);
  objc_storeStrong((id *)&self->_personalityToDescriptorDictionary, 0);
  objc_storeStrong((id *)&self->_cachedWidgetPersonalityToAppScore, 0);
  objc_storeStrong((id *)&self->_stackableCandidates, 0);
  objc_storeStrong((id *)&self->_appLaunchCounts, 0);
}

- (void)_firstWidgetThatIsntUsedYet:(os_log_t)log usedPersonalities:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "-[ATXDefaultHomeScreenItemOnboardingStacksProducer _firstWidgetThatIsntUsedYet:usedPersonalities:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "%s: could not find widget that wasn't already used, used personalities: %@, available widgets: %@", (uint8_t *)&v3, 0x20u);
}

@end
