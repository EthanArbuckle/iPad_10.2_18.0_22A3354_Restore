@implementation ATXInformationFeaturizer

- (id)featurizeInfoSuggestions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  ATXFeaturizedInfoSuggestion *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[ATXInformationFeaturizer _featureSetForSuggestion:](self, "_featureSetForSuggestion:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[ATXFeaturizedInfoSuggestion initWithSuggestion:featureSet:]([ATXFeaturizedInfoSuggestion alloc], "initWithSuggestion:featureSet:", v11, v12);
        objc_msgSend(v5, "addObject:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_featureSetForSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "widgetBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInformationFeaturizer populateFeatureSetForWidgetBundleId:widgetKind:appBundleIdentifier:](self, "populateFeatureSetForWidgetBundleId:widgetKind:appBundleIdentifier:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v4, "confidenceLevel");
  objc_msgSend(v8, "appendFeature:value:", 4, (double)v9);
  objc_msgSend(v8, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)populateFeatureSetForWidgetBundleId:(id)a3 widgetKind:(id)a4 appBundleIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  -[ATXInformationFeaturizer _fetchAppLaunchPopularityForBundleIdentifier:](self, "_fetchAppLaunchPopularityForBundleIdentifier:", v7);
  v11 = v10;
  -[ATXInformationFeaturizer _fetchAppLaunchCountForBundleIdentifier:](self, "_fetchAppLaunchCountForBundleIdentifier:", v7);
  v13 = v12;

  objc_msgSend(v9, "appendFeature:value:", 2, v11);
  objc_msgSend(v9, "appendFeature:value:", 3, v13);
  -[ATXInformationFeaturizer _fetchFeedbackForWidgetBundleId:type:](self, "_fetchFeedbackForWidgetBundleId:type:", v8, 2);
  objc_msgSend(v9, "appendFeature:value:", 1);
  -[ATXInformationFeaturizer _fetchFeedbackForWidgetBundleId:type:](self, "_fetchFeedbackForWidgetBundleId:type:", v8, 0);
  objc_msgSend(v9, "appendFeature:value:", 5);
  -[ATXInformationFeaturizer _fetchFeedbackForWidgetBundleId:type:](self, "_fetchFeedbackForWidgetBundleId:type:", v8, 3);
  objc_msgSend(v9, "appendFeature:value:", 6);
  -[ATXInformationFeaturizer _fetchFeedbackForWidgetBundleId:type:](self, "_fetchFeedbackForWidgetBundleId:type:", v8, 4);
  objc_msgSend(v9, "appendFeature:value:", 7);
  -[ATXInformationFeaturizer _fetchFeedbackForWidgetBundleId:type:](self, "_fetchFeedbackForWidgetBundleId:type:", v8, 7);
  objc_msgSend(v9, "appendFeature:value:", 9);
  -[ATXInformationFeaturizer _fetchFeedbackForWidgetBundleId:type:](self, "_fetchFeedbackForWidgetBundleId:type:", v8, 1);
  v15 = v14;

  objc_msgSend(v9, "appendFeature:value:", 8, v15);
  return v9;
}

- (id)featurizeTimelineWithWidgetBundleId:(id)a3 widgetKind:(id)a4 appBundleIdentifier:(id)a5
{
  void *v5;
  void *v6;

  -[ATXInformationFeaturizer populateFeatureSetForWidgetBundleId:widgetKind:appBundleIdentifier:](self, "populateFeatureSetForWidgetBundleId:widgetKind:appBundleIdentifier:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_lazyLoadAppLaunchHistogram
{
  _ATXAppLaunchHistogram *v3;
  _ATXAppLaunchHistogram *appLaunchHistory;
  id v5;

  if (!self->_appLaunchHistory)
  {
    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "histogramForLaunchType:", 0);
    v3 = (_ATXAppLaunchHistogram *)objc_claimAutoreleasedReturnValue();
    appLaunchHistory = self->_appLaunchHistory;
    self->_appLaunchHistory = v3;

  }
}

- (void)_lazyLoadWidgetFeedbackHistogram
{
  ATXHomeScreenWidgetFeedback *v3;
  ATXHomeScreenWidgetFeedback *widgetFeedback;

  if (!self->_widgetFeedback)
  {
    v3 = (ATXHomeScreenWidgetFeedback *)objc_opt_new();
    widgetFeedback = self->_widgetFeedback;
    self->_widgetFeedback = v3;

  }
}

- (double)_fetchAppLaunchPopularityForBundleIdentifier:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[ATXInformationFeaturizer _lazyLoadAppLaunchHistogram](self, "_lazyLoadAppLaunchHistogram");
    -[_ATXAppLaunchHistogram overallLaunchPopularityForBundleId:](self->_appLaunchHistory, "overallLaunchPopularityForBundleId:", v4);
    v6 = v5;
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (double)_fetchAppLaunchCountForBundleIdentifier:(id)a3
{
  id v4;
  _ATXAppLaunchHistogram *appLaunchHistory;
  void *v6;
  double v7;
  double v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[ATXInformationFeaturizer _lazyLoadAppLaunchHistogram](self, "_lazyLoadAppLaunchHistogram");
    appLaunchHistory = self->_appLaunchHistory;
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ATXAppLaunchHistogram totalLaunchesForBundleIds:](appLaunchHistory, "totalLaunchesForBundleIds:", v6);
    v8 = v7;

  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (double)_fetchFeedbackForWidgetBundleId:(id)a3 type:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    -[ATXInformationFeaturizer _lazyLoadWidgetFeedbackHistogram](self, "_lazyLoadWidgetFeedbackHistogram");
    -[ATXHomeScreenWidgetFeedback eventCountForWidgetBundleId:type:](self->_widgetFeedback, "eventCountForWidgetBundleId:type:", v6, a4);
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetFeedback, 0);
  objc_storeStrong((id *)&self->_appLaunchHistory, 0);
}

@end
