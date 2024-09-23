@implementation ATXDefaultWidgetSuggester

- (ATXDefaultWidgetSuggester)initWithHistogramManager:(id)a3
{
  id v5;
  ATXDefaultWidgetSuggester *v6;
  ATXDefaultWidgetSuggester *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXDefaultWidgetSuggester;
  v6 = -[ATXDefaultWidgetSuggester init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_histogramManager, a3);

  return v7;
}

- (BOOL)shouldSuggestTV
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = (void *)MEMORY[0x1E0CF8D90];
  -[ATXDefaultWidgetSuggester appLaunchCountForTVApp](self, "appLaunchCountForTVApp");
  v5 = v4;
  -[ATXDefaultWidgetSuggester intentDonationCountForTVApp](self, "intentDonationCountForTVApp");
  v7 = v6;
  -[ATXDefaultWidgetSuggester upcomingMediaCountForTVApp](self, "upcomingMediaCountForTVApp");
  return objc_msgSend(v3, "shouldSuggestTVWithAppLaunchCount:intentDonationCount:upcomingMediaCount:", v5, v7, v8);
}

- (double)appLaunchCountForTVApp
{
  double result;

  -[ATXDefaultWidgetSuggester _appLaunchCountForAppBudleId:](self, "_appLaunchCountForAppBudleId:", CFSTR("com.apple.tv"));
  return result;
}

- (double)intentDonationCountForTVApp
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0CF8C20], "getActionKeyForBundleId:actionType:", CFSTR("com.apple.tv"), CFSTR("INPlayMediaIntent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultWidgetSuggester _intentDonationCountForActionKey:](self, "_intentDonationCountForActionKey:", v3);
  v5 = v4;

  return v5;
}

- (double)upcomingMediaCountForTVApp
{
  double result;

  -[ATXDefaultWidgetSuggester _upcomingMediaCountForAppBundleId:isInternalApplication:](self, "_upcomingMediaCountForAppBundleId:isInternalApplication:", CFSTR("com.apple.tv"), 1);
  return result;
}

- (double)_appLaunchCountForAppBudleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:](self->_histogramManager, "categoricalHistogramForLaunchType:", 43);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "totalLaunchesForBundleId:", v4);
  v8 = v7;
  __atxlog_handle_home_screen();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ATXDefaultWidgetSuggester _appLaunchCountForAppBudleId:].cold.1();

  objc_autoreleasePoolPop(v5);
  return v8;
}

- (double)_intentDonationCountForActionKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_histogramManager, "histogramForLaunchType:", 17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "totalLaunchesForBundleIds:", v7);
  v9 = v8;

  __atxlog_handle_home_screen();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ATXDefaultWidgetSuggester _intentDonationCountForActionKey:].cold.1();

  objc_autoreleasePoolPop(v5);
  return v9;
}

- (double)_upcomingMediaCountForAppBundleId:(id)a3 isInternalApplication:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  double v12;

  v4 = a4;
  v5 = a3;
  v6 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(MEMORY[0x1E0CF9170], "getUpcomingMediaForBundle:isInternalApplication:", v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedUpcomingMedia");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  __atxlog_handle_home_screen();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ATXDefaultWidgetSuggester _upcomingMediaCountForAppBundleId:isInternalApplication:].cold.1((uint64_t)v5, v9, v10);

  objc_msgSend(v7, "sortedUpcomingMedia");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (double)(unint64_t)objc_msgSend(v11, "count");

  objc_autoreleasePoolPop(v6);
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogramManager, 0);
}

- (void)_appLaunchCountForAppBudleId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_9(&dword_1C9A3B000, v0, v1, "ATXDefaultWidgetSuggester: fetched app launches: %f for bundle: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_intentDonationCountForActionKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_9(&dword_1C9A3B000, v0, v1, "ATXDefaultWidgetSuggester: fetched intent donations: %f for bundle: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_upcomingMediaCountForAppBundleId:(NSObject *)a3 isInternalApplication:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_3_9(&dword_1C9A3B000, a3, (uint64_t)a3, "ATXDefaultWidgetSuggester: fetched upcoming media: %ld for bundle: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

@end
