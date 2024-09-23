@implementation ATXDefaultHomeScreenItemRanker

- (ATXDefaultHomeScreenItemRanker)initWithCachedWidgetPersonalityToAppScore:(id)a3 spotlightAppLaunchHistogram:(id)a4 appLaunchCounts:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXDefaultHomeScreenItemRanker *v12;
  ATXDefaultHomeScreenItemRanker *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXDefaultHomeScreenItemRanker;
  v12 = -[ATXDefaultHomeScreenItemRanker init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cachedWidgetPersonalityToAppScore, a3);
    objc_storeStrong((id *)&v13->_spotlightAppLaunchHistogram, a4);
    objc_storeStrong((id *)&v13->_appLaunchCounts, a5);
  }

  return v13;
}

+ (int64_t)_downrankComparator:(id)a3 widget2:(id)a4
{
  id v6;
  int v7;
  unsigned int v8;

  v6 = a4;
  v7 = objc_msgSend(a1, "_shouldDownrankWidget:", a3);
  v8 = objc_msgSend(a1, "_shouldDownrankWidget:", v6);

  if (v7 ^ 1 | v8)
    return (uint64_t)((unint64_t)((v7 ^ 1) & v8) << 63) >> 63;
  else
    return 1;
}

+ (BOOL)_shouldDownrankWidget:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "rankType") == 4 || objc_msgSend(v3, "rankType") == 6;

  return v4;
}

- (int64_t)_rankerDictionaryComparator:(id)a3 timelineRelevanceAdoptionHelper:(id)a4 widget1:(id)a5 widget2:(id)a6
{
  unint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  ATXDefaultHomeScreenItemRanker *v22;
  void *v23;
  uint64_t v24;
  int64_t v25;
  NSObject *v26;
  id v28;

  v10 = (unint64_t)a3;
  v11 = (unint64_t)a4;
  v12 = a5;
  v13 = a6;
  if (!(v10 | v11))
  {
    __atxlog_handle_home_screen();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[ATXDefaultHomeScreenItemRanker _rankerDictionaryComparator:timelineRelevanceAdoptionHelper:widget1:widget2:].cold.1(v26);

    goto LABEL_9;
  }
  if (v11)
  {
    objc_msgSend(v12, "avocadoDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "extensionBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v12;
    objc_msgSend(v12, "avocadoDescriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "kind");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "globalDiverseSchemaRawNumber:kind:", v15, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "avocadoDescriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "extensionBundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "avocadoDescriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "kind");
    v22 = self;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "globalDiverseSchemaRawNumber:kind:", v20, v23);
    v24 = objc_claimAutoreleasedReturnValue();

    self = v22;
    if (v18)
      goto LABEL_4;
LABEL_19:
    v12 = v28;
    goto LABEL_10;
  }
  if (!v10)
  {
LABEL_9:
    v24 = 0;
    v18 = 0;
    goto LABEL_10;
  }
  v28 = v12;
  -[ATXDefaultHomeScreenItemRanker _scoreForWidget:withGlobalPopularityDictionary:](self, "_scoreForWidget:withGlobalPopularityDictionary:", v12, v10);
  v18 = objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemRanker _scoreForWidget:withGlobalPopularityDictionary:](self, "_scoreForWidget:withGlobalPopularityDictionary:", v13, v10);
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_19;
LABEL_4:
  v12 = v28;
  if (v24)
  {
    v25 = objc_msgSend((id)v24, "compare:", v18);
LABEL_15:

    goto LABEL_16;
  }
LABEL_10:
  if (v18 | v24)
  {
    if (v18)
      v25 = -1;
    else
      v25 = 1;
    goto LABEL_15;
  }
  v25 = -[ATXDefaultHomeScreenItemRanker _uniqueDaysLaunchedComparatorForWidget1:widget2:](self, "_uniqueDaysLaunchedComparatorForWidget1:widget2:", v12, v13);
LABEL_16:

  return v25;
}

- (id)_scoreForWidget:(id)a3 withGlobalPopularityDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "avocadoDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avocadoDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "kind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXWidgetPersonality stringRepresentationForExtensionBundleId:kind:](ATXWidgetPersonality, "stringRepresentationForExtensionBundleId:kind:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)_uniqueDaysLaunchedScoreForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ATXDefaultHomeScreenItemAppLaunchScorer *v11;
  void *v12;
  void *v13;
  double v14;

  v4 = a3;
  objc_msgSend(v4, "avocadoDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avocadoDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXWidgetPersonality stringRepresentationForExtensionBundleId:kind:](ATXWidgetPersonality, "stringRepresentationForExtensionBundleId:kind:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedWidgetPersonalityToAppScore, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = -[ATXDefaultHomeScreenItemAppLaunchScorer initWithWidget:appLaunchHistogram:]([ATXDefaultHomeScreenItemAppLaunchScorer alloc], "initWithWidget:appLaunchHistogram:", v4, self->_spotlightAppLaunchHistogram);
    -[ATXDefaultHomeScreenItemAppLaunchScorer scoreWithCachedAppLaunchData:](v11, "scoreWithCachedAppLaunchData:", self->_appLaunchCounts);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedWidgetPersonalityToAppScore, "setObject:forKeyedSubscript:", v12, v9);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedWidgetPersonalityToAppScore, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (double)(unint64_t)objc_msgSend(v13, "uniqueDaysLaunched");

  return v14;
}

- (double)_rawLaunchScoreForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ATXDefaultHomeScreenItemAppLaunchScorer *v11;
  void *v12;
  void *v13;
  double v14;

  v4 = a3;
  objc_msgSend(v4, "avocadoDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avocadoDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXWidgetPersonality stringRepresentationForExtensionBundleId:kind:](ATXWidgetPersonality, "stringRepresentationForExtensionBundleId:kind:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedWidgetPersonalityToAppScore, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = -[ATXDefaultHomeScreenItemAppLaunchScorer initWithWidget:appLaunchHistogram:]([ATXDefaultHomeScreenItemAppLaunchScorer alloc], "initWithWidget:appLaunchHistogram:", v4, self->_spotlightAppLaunchHistogram);
    -[ATXDefaultHomeScreenItemAppLaunchScorer scoreWithCachedAppLaunchData:](v11, "scoreWithCachedAppLaunchData:", self->_appLaunchCounts);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedWidgetPersonalityToAppScore, "setObject:forKeyedSubscript:", v12, v9);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedWidgetPersonalityToAppScore, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (double)(unint64_t)objc_msgSend(v13, "rawLaunchCount");

  return v14;
}

- (int64_t)_uniqueDaysLaunchedComparatorForWidget1:(id)a3 widget2:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;

  v6 = a4;
  -[ATXDefaultHomeScreenItemRanker _uniqueDaysLaunchedScoreForWidget:](self, "_uniqueDaysLaunchedScoreForWidget:", a3);
  v8 = v7;
  -[ATXDefaultHomeScreenItemRanker _uniqueDaysLaunchedScoreForWidget:](self, "_uniqueDaysLaunchedScoreForWidget:", v6);
  v10 = v9;

  v11 = -1;
  if (v8 <= v10)
    v11 = 1;
  if (v8 == v10)
    return 0;
  else
    return v11;
}

- (void)_sortWidgetsByRawLaunchCounts:(id)a3 shouldDownRankAlreadyInstalledWidgets:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __102__ATXDefaultHomeScreenItemRanker__sortWidgetsByRawLaunchCounts_shouldDownRankAlreadyInstalledWidgets___block_invoke;
  v4[3] = &unk_1E4D5C3D8;
  v5 = a4;
  v4[4] = self;
  objc_msgSend(a3, "sortWithOptions:usingComparator:", 16, v4);
}

uint64_t __102__ATXDefaultHomeScreenItemRanker__sortWidgetsByRawLaunchCounts_shouldDownRankAlreadyInstalledWidgets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  if (!*(_BYTE *)(a1 + 40) || (v7 = objc_msgSend((id)objc_opt_class(), "_downrankComparator:widget2:", v5, v6)) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_rawLaunchScoreForWidget:", v5);
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "_rawLaunchScoreForWidget:", v6);
    v11 = -1;
    if (v9 <= v10)
      v11 = 1;
    if (v9 == v10)
      v7 = 0;
    else
      v7 = v11;
  }

  return v7;
}

- (void)_sortWidgetsByDistinctDaysAppWasLaunched:(id)a3 shouldDownRankAlreadyInstalledWidgets:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __113__ATXDefaultHomeScreenItemRanker__sortWidgetsByDistinctDaysAppWasLaunched_shouldDownRankAlreadyInstalledWidgets___block_invoke;
  v4[3] = &unk_1E4D5C3D8;
  v5 = a4;
  v4[4] = self;
  objc_msgSend(a3, "sortWithOptions:usingComparator:", 16, v4);
}

uint64_t __113__ATXDefaultHomeScreenItemRanker__sortWidgetsByDistinctDaysAppWasLaunched_shouldDownRankAlreadyInstalledWidgets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a2;
  v6 = a3;
  if (!*(_BYTE *)(a1 + 40) || (v7 = objc_msgSend((id)objc_opt_class(), "_downrankComparator:widget2:", v5, v6)) == 0)
    v7 = objc_msgSend(*(id *)(a1 + 32), "_uniqueDaysLaunchedComparatorForWidget1:widget2:", v5, v6);

  return v7;
}

- (void)_sortWidgets:(id)a3 byRankerPlist:(int)a4 shouldDownRankAlreadyInstalledWidgets:(BOOL)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  -[ATXDefaultHomeScreenItemRanker _rankerPlistToDictionary:](self, "_rankerPlistToDictionary:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemRanker _timelineRelevanceAdoptionHelper:](self, "_timelineRelevanceAdoptionHelper:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __99__ATXDefaultHomeScreenItemRanker__sortWidgets_byRankerPlist_shouldDownRankAlreadyInstalledWidgets___block_invoke;
  v13[3] = &unk_1E4D5C400;
  v16 = a5;
  v13[4] = self;
  v14 = v9;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  objc_msgSend(v8, "sortWithOptions:usingComparator:", 16, v13);

}

uint64_t __99__ATXDefaultHomeScreenItemRanker__sortWidgets_byRankerPlist_shouldDownRankAlreadyInstalledWidgets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a2;
  v6 = a3;
  if (!*(_BYTE *)(a1 + 56) || (v7 = objc_msgSend((id)objc_opt_class(), "_downrankComparator:widget2:", v5, v6)) == 0)
    v7 = objc_msgSend(*(id *)(a1 + 32), "_rankerDictionaryComparator:timelineRelevanceAdoptionHelper:widget1:widget2:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5, v6);

  return v7;
}

- (id)_timelineRelevanceAdoptionHelper:(int)a3
{
  if (a3 == 6)
    return (id)objc_opt_new();
  else
    return 0;
}

- (id)_rankerPlistToDictionary:(int)a3
{
  uint64_t v3;
  NSDictionary *v5;
  NSDictionary *v6;
  NSDictionary *cachedRankerDictionary;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a3 > 5)
    goto LABEL_7;
  v3 = *(_QWORD *)&a3;
  v5 = self->_cachedRankerDictionary;
  if (v5
    || (+[ATXAssets2 dictionaryFromLazyPlistForClass:](ATXAssets2, "dictionaryFromLazyPlistForClass:", objc_opt_class()), v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(), cachedRankerDictionary = self->_cachedRankerDictionary, self->_cachedRankerDictionary = v6, cachedRankerDictionary, (v5 = self->_cachedRankerDictionary) != 0))
  {
    -[ATXDefaultHomeScreenItemRanker _globalPopularityPlistStringKey:](self, "_globalPopularityPlistStringKey:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = v9;

  }
  else
  {
LABEL_7:
    v10 = 0;
  }
  return v10;
}

- (id)widgetsBySortingWidgetsUsingDayZeroGalleryAlgorithm:(id)a3
{
  void *v4;
  _QWORD v6[5];

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__ATXDefaultHomeScreenItemRanker_widgetsBySortingWidgetsUsingDayZeroGalleryAlgorithm___block_invoke;
  v6[3] = &unk_1E4D5C428;
  v6[4] = self;
  objc_msgSend(v4, "sortWithOptions:usingComparator:", 16, v6);
  return v4;
}

uint64_t __86__ATXDefaultHomeScreenItemRanker_widgetsBySortingWidgetsUsingDayZeroGalleryAlgorithm___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend((id)objc_opt_class(), "_downrankComparator:widget2:", v5, v4);

  return v6;
}

- (id)widgetsBySortingAndFilteringWidgetsUsingPersonalizedGalleryAlgorithm:(id)a3 rankerPlistType:(int)a4 regularlyUsedThreshold:(double)a5
{
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v6 = *(_QWORD *)&a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a3, "mutableCopy");
  v9 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = (void *)objc_msgSend(v8, "copy", 0);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v15, "rankType") == 2)
        {
          objc_msgSend(v9, "addObject:", v15);
          objc_msgSend(v8, "removeObject:", v15);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  -[ATXDefaultHomeScreenItemRanker _widgetsBySortingAndFilteringWidgets:byAppLaunchAndRankerPlist:regularlyUsedThreshold:](self, "_widgetsBySortingAndFilteringWidgets:byAppLaunchAndRankerPlist:regularlyUsedThreshold:", v8, v6, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemRanker _widgetsBySortingAndFilteringWidgets:byAppLaunchAndRankerPlist:regularlyUsedThreshold:](self, "_widgetsBySortingAndFilteringWidgets:byAppLaunchAndRankerPlist:regularlyUsedThreshold:", v9, v6, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v17, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "insertObjects:atIndexes:", v17, v18);

  return v16;
}

- (id)widgetsBySortingAndFilteringWidgetsUsingOnboardingStacksAlgorithm:(id)a3 algorithm:(int)a4 regularlyUsedThreshold:(double)a5
{
  void *v8;

  v8 = (void *)objc_msgSend(a3, "mutableCopy");
  switch(a4)
  {
    case 0:
      -[ATXDefaultHomeScreenItemRanker _sortWidgetsByRawLaunchCounts:shouldDownRankAlreadyInstalledWidgets:](self, "_sortWidgetsByRawLaunchCounts:shouldDownRankAlreadyInstalledWidgets:", v8, 0);
      goto LABEL_4;
    case 1:
      -[ATXDefaultHomeScreenItemRanker _sortWidgets:byRankerPlist:shouldDownRankAlreadyInstalledWidgets:](self, "_sortWidgets:byRankerPlist:shouldDownRankAlreadyInstalledWidgets:", v8, 6, 0);
LABEL_4:
      -[ATXDefaultHomeScreenItemRanker _sortWidgetsByDistinctDaysAppWasLaunched:shouldDownRankAlreadyInstalledWidgets:](self, "_sortWidgetsByDistinctDaysAppWasLaunched:shouldDownRankAlreadyInstalledWidgets:", v8, 0);
      goto LABEL_7;
    case 2:
      -[ATXDefaultHomeScreenItemRanker _sortWidgets:byRankerPlist:shouldDownRankAlreadyInstalledWidgets:](self, "_sortWidgets:byRankerPlist:shouldDownRankAlreadyInstalledWidgets:", v8, 6, 0);
      -[ATXDefaultHomeScreenItemRanker _sortWidgetsByDistinctDaysAppWasLaunched:shouldDownRankAlreadyInstalledWidgets:](self, "_sortWidgetsByDistinctDaysAppWasLaunched:shouldDownRankAlreadyInstalledWidgets:", v8, 0);
      break;
    case 3:
      -[ATXDefaultHomeScreenItemRanker _sortWidgetsByDistinctDaysAppWasLaunched:shouldDownRankAlreadyInstalledWidgets:](self, "_sortWidgetsByDistinctDaysAppWasLaunched:shouldDownRankAlreadyInstalledWidgets:", v8, 0);
      -[ATXDefaultHomeScreenItemRanker _sortWidgets:byRankerPlist:shouldDownRankAlreadyInstalledWidgets:](self, "_sortWidgets:byRankerPlist:shouldDownRankAlreadyInstalledWidgets:", v8, 6, 0);
LABEL_7:
      -[ATXDefaultHomeScreenItemRanker _filterOutWidgetsThatAreNotRegularlyUsed:regularlyUsedThreshold:](self, "_filterOutWidgetsThatAreNotRegularlyUsed:regularlyUsedThreshold:", v8, a5);
      break;
    default:
      break;
  }
  -[ATXDefaultHomeScreenItemRanker _filterOutWidgetsFromProtectedApps:](self, "_filterOutWidgetsFromProtectedApps:", v8);
  return v8;
}

- (void)_filterOutWidgetsFromProtectedApps:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("SBSearchDisabledShortcuts"), CFSTR("com.apple.spotlightui"));
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  v9 = (void *)objc_msgSend(v4, "initWithArray:", v8);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = (void *)objc_msgSend(v3, "copy");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v29;
    *(_QWORD *)&v12 = 136315394;
    v27 = v12;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v16, "appBundleId", v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v16, "appBundleId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v9, "containsObject:", v18);

          if (v19)
          {
            __atxlog_handle_home_screen();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v16, "appBundleId");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v33 = "-[ATXDefaultHomeScreenItemRanker _filterOutWidgetsFromProtectedApps:]";
              v34 = 2112;
              v35 = v16;
              v36 = 2112;
              v37 = v21;
              _os_log_impl(&dword_1A49EF000, v20, OS_LOG_TYPE_DEFAULT, "%s: filtering out widget descriptor: %@. Reason: Show on Homescreen is disabled for the parent bundleId %@", buf, 0x20u);

            }
            objc_msgSend(v3, "removeObject:", v16);
          }
          objc_msgSend(v16, "appBundleId");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = +[ATXAppProtectionInfo bundleIdIsLockedOrHiddenByUserPreference:](ATXAppProtectionInfo, "bundleIdIsLockedOrHiddenByUserPreference:", v22);

          if (v23)
          {
            __atxlog_handle_home_screen();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v16, "appBundleId");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v33 = "-[ATXDefaultHomeScreenItemRanker _filterOutWidgetsFromProtectedApps:]";
              v34 = 2112;
              v35 = v16;
              v36 = 2112;
              v37 = v25;
              _os_log_impl(&dword_1A49EF000, v24, OS_LOG_TYPE_DEFAULT, "%s: filtering out widget descriptor: %@. Reason: the parent bundleId %@ is locked or hidden by user preference", buf, 0x20u);

            }
            objc_msgSend(v3, "removeObject:", v16);
          }
        }
        else
        {
          __atxlog_handle_home_screen();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v27;
            v33 = "-[ATXDefaultHomeScreenItemRanker _filterOutWidgetsFromProtectedApps:]";
            v34 = 2112;
            v35 = v16;
            _os_log_impl(&dword_1A49EF000, v26, OS_LOG_TYPE_DEFAULT, "%s: No parent bundleId for Widget descriptor: %@", buf, 0x16u);
          }

        }
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v13);
  }

}

- (void)_filterOutWidgetsThatAreNotRegularlyUsed:(id)a3 regularlyUsedThreshold:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  double v14;
  double v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v19;
    *(_QWORD *)&v9 = 136315650;
    v17 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[ATXDefaultHomeScreenItemRanker _uniqueDaysLaunchedScoreForWidget:](self, "_uniqueDaysLaunchedScoreForWidget:", v13, v17);
        if (v14 < a4)
        {
          v15 = v14;
          __atxlog_handle_home_screen();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = "-[ATXDefaultHomeScreenItemRanker _filterOutWidgetsThatAreNotRegularlyUsed:regularlyUsedThreshold:]";
            v24 = 2048;
            v25 = v15;
            v26 = 2112;
            v27 = v13;
            _os_log_impl(&dword_1A49EF000, v16, OS_LOG_TYPE_DEFAULT, "%s: filtering out 3P widget because it is not regularly used (days launched: %f): %@", buf, 0x20u);
          }

          objc_msgSend(v6, "removeObject:", v13);
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v10);
  }

}

- (void)_filterOutWidgetsNotFromTopLaunchedApps:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __74__ATXDefaultHomeScreenItemRanker__filterOutWidgetsNotFromTopLaunchedApps___block_invoke;
  v11 = &unk_1E4D5C450;
  v5 = v4;
  v12 = v5;
  v13 = &v14;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v8);
  v6 = v15[3];
  if (v6)
  {
    v7 = objc_msgSend(v3, "count", v8, v9, v10, v11);
    objc_msgSend(v3, "removeObjectsInRange:", v6, v7 - v15[3]);
  }

  _Block_object_dispose(&v14, 8);
}

void __74__ATXDefaultHomeScreenItemRanker__filterOutWidgetsNotFromTopLaunchedApps___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "appBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v10, "appBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 0x15)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }

}

+ (void)filterOutDuplicateWidgetsFromSameAppBundleId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_msgSend(v3, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "appBundleId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "appBundleId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v4, "containsObject:", v12);

          if (v13)
          {
            objc_msgSend(v3, "removeObject:", v10);
          }
          else
          {
            objc_msgSend(v10, "appBundleId");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v14);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (id)_widgetsBySortingAndFilteringWidgets:(id)a3 byAppLaunchAndRankerPlist:(int)a4 regularlyUsedThreshold:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v16);
        v18 = objc_msgSend((id)objc_opt_class(), "_shouldDownrankWidget:", v17);
        v19 = v11;
        if ((v18 & 1) != 0)
          goto LABEL_7;
        v20 = -[ATXDefaultHomeScreenItemRanker _appUsageFrequencyForWidget:regularlyUsedThreshold:](self, "_appUsageFrequencyForWidget:regularlyUsedThreshold:", v17, a5);
        if (!v20)
        {
          v19 = v10;
LABEL_7:
          objc_msgSend(v19, "addObject:", v17);
          goto LABEL_8;
        }
        v21 = v20;
        v19 = v8;
        if (v21 == 2)
          goto LABEL_7;
        v19 = v9;
        if (v21 == 1)
          goto LABEL_7;
LABEL_8:
        ++v16;
      }
      while (v14 != v16);
      v22 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      v14 = v22;
    }
    while (v22);
  }

  -[ATXDefaultHomeScreenItemRanker _sortWidgets:byRankerPlist:shouldDownRankAlreadyInstalledWidgets:](self, "_sortWidgets:byRankerPlist:shouldDownRankAlreadyInstalledWidgets:", v8, a4, 1);
  -[ATXDefaultHomeScreenItemRanker _sortWidgets:byRankerPlist:shouldDownRankAlreadyInstalledWidgets:](self, "_sortWidgets:byRankerPlist:shouldDownRankAlreadyInstalledWidgets:", v9, a4, 1);
  -[ATXDefaultHomeScreenItemRanker _sortWidgets:byRankerPlist:shouldDownRankAlreadyInstalledWidgets:](self, "_sortWidgets:byRankerPlist:shouldDownRankAlreadyInstalledWidgets:", v10, a4, 1);
  -[ATXDefaultHomeScreenItemRanker _sortWidgets:byRankerPlist:shouldDownRankAlreadyInstalledWidgets:](self, "_sortWidgets:byRankerPlist:shouldDownRankAlreadyInstalledWidgets:", v11, a4, 1);
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "arrayByAddingObjectsFromArray:", v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "filterOutDuplicateWidgetsFromSameAppBundleId:", v26);
  -[ATXDefaultHomeScreenItemRanker _filterOutWidgetsFromProtectedApps:](self, "_filterOutWidgetsFromProtectedApps:", v26);

  return v26;
}

- (unint64_t)_appUsageFrequencyForWidget:(id)a3 regularlyUsedThreshold:(double)a4
{
  double v5;

  -[ATXDefaultHomeScreenItemRanker _uniqueDaysLaunchedScoreForWidget:](self, "_uniqueDaysLaunchedScoreForWidget:", a3);
  if (v5 >= a4)
    return 2;
  else
    return v5 >= 1.0;
}

- (id)_globalPopularityPlistStringKey:(int)a3
{
  if (a3 > 5)
    return 0;
  else
    return off_1E4D5C470[a3];
}

+ (id)stringForAlgorithmType:(int)a3
{
  if (a3 > 3)
    return CFSTR("unknown");
  else
    return off_1E4D5C4A0[a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchCounts, 0);
  objc_storeStrong((id *)&self->_spotlightAppLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_cachedRankerDictionary, 0);
  objc_storeStrong((id *)&self->_cachedWidgetPersonalityToAppScore, 0);
}

- (void)_rankerDictionaryComparator:(os_log_t)log timelineRelevanceAdoptionHelper:widget1:widget2:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[ATXDefaultHomeScreenItemRanker _rankerDictionaryComparator:timelineRelevanceAdoptionHelper:widget1:widget2:]";
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "%s: please pass in either a non-nil ranker dictionary or non-nil timeline relevance adoption helper", (uint8_t *)&v1, 0xCu);
}

@end
