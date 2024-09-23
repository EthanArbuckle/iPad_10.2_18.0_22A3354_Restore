@implementation ATXHeroAppFeedback

- (ATXHeroAppFeedback)init
{
  void *v3;
  void *v4;
  ATXHeroAppFeedback *v5;

  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categoricalHistogramForLaunchType:", 49);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXHeroAppFeedback initWithHistogram:](self, "initWithHistogram:", v4);

  return v5;
}

- (ATXHeroAppFeedback)initWithHistogram:(id)a3
{
  id v5;
  ATXHeroAppFeedback *v6;
  ATXHeroAppFeedback *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeroAppFeedback;
  v6 = -[ATXHeroAppFeedback init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_heroAppHistogram, a3);

  return v7;
}

- (void)addConfirmForHeroAppPredictionWithBundleId:(id)a3 weight:(float)a4
{
  _ATXAppLaunchCategoricalHistogram *heroAppHistogram;
  void *v6;
  id v7;
  double v8;
  id v9;

  heroAppHistogram = self->_heroAppHistogram;
  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a3;
  objc_msgSend(v6, "now");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a4;
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](heroAppHistogram, "addLaunchWithBundleId:date:category:weight:", v7, v9, CFSTR("confirms_hero"), v8);

}

- (void)addRejectForHeroAppPredictionWithBundleId:(id)a3 weight:(float)a4
{
  _ATXAppLaunchCategoricalHistogram *heroAppHistogram;
  void *v6;
  id v7;
  double v8;
  id v9;

  heroAppHistogram = self->_heroAppHistogram;
  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a3;
  objc_msgSend(v6, "now");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a4;
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](heroAppHistogram, "addLaunchWithBundleId:date:category:weight:", v7, v9, CFSTR("rejects_hero"), v8);

}

- (BOOL)shouldShowHeroAppPrediction:(id)a3
{
  id v4;
  const __CFString *v5;
  NSObject *v6;
  BOOL v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  uint64_t v22;
  int v24;
  id v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild")
    || (v5 = (const __CFString *)*MEMORY[0x1E0CF95E0],
        LOBYTE(v24) = 0,
        !CFPreferencesGetAppBooleanValue(v5, (CFStringRef)*MEMORY[0x1E0CF9510], (Boolean *)&v24)))
  {
    +[ATXHeroAndClipConstants sharedInstance](ATXHeroAndClipConstants, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    -[ATXHeroAppFeedback _rejectsForHeroAppPrediction:](self, "_rejectsForHeroAppPrediction:", v4);
    v9 = v8;
    -[ATXHeroAppFeedback _confirmsForHeroAppPrediction:](self, "_confirmsForHeroAppPrediction:", v4);
    v11 = v10;
    -[NSObject heroAppMinimumRejects](v6, "heroAppMinimumRejects");
    if (v9 >= v12)
    {
      -[ATXHeroAppFeedback _engagementForHeroAppPrediction:](self, "_engagementForHeroAppPrediction:", v4);
      v18 = v17;
      -[NSObject heroAppEngagementThreshold](v6, "heroAppEngagementThreshold");
      v20 = v19;
      __atxlog_handle_hero();
      v13 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v18 < v20)
      {
        if (v21)
        {
          -[NSObject heroAppEngagementThreshold](v6, "heroAppEngagementThreshold");
          v24 = 138413058;
          v25 = v4;
          v26 = 2048;
          v27 = v9;
          v28 = 2048;
          v29 = v18;
          v30 = 2048;
          v31 = v22;
          _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "%@ has enough rejects: %f, and engagement is: %f which is less than the threshold: %f. Hence, not showing this suggestion.", (uint8_t *)&v24, 0x2Au);
        }
        v7 = 0;
        goto LABEL_17;
      }
      if (v21)
      {
        v24 = 134218496;
        v25 = v11;
        v26 = 2048;
        v27 = v9;
        v28 = 2048;
        v29 = v18;
        v14 = "All app clip specific thresholds passed. Confirms: %f, Rejects: %f,  engagement: %f";
        v15 = v13;
        v16 = 32;
        goto LABEL_15;
      }
    }
    else
    {
      __atxlog_handle_hero();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 134218240;
        v25 = v11;
        v26 = 2048;
        v27 = v9;
        v14 = "Not enough rejects to consider engagement. Allowing hero app. Confirms: %f Rejects: %f";
        v15 = v13;
        v16 = 22;
LABEL_15:
        _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v24, v16);
      }
    }
    v7 = 1;
LABEL_17:

    goto LABEL_18;
  }
  __atxlog_handle_hero();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Defaults for OverrideHeroAppPredictionEligibility set to True: Overriding hero app user engagement feedback", (uint8_t *)&v24, 2u);
  }
  v7 = 1;
LABEL_18:

  return v7;
}

- (double)_engagementForHeroAppPrediction:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[ATXHeroAppFeedback _confirmsForHeroAppPrediction:](self, "_confirmsForHeroAppPrediction:", v4);
  v6 = v5;
  -[ATXHeroAppFeedback _rejectsForHeroAppPrediction:](self, "_rejectsForHeroAppPrediction:", v4);
  v8 = v7;

  if (v8 == 0.0)
    return 1.0;
  else
    return v6 / (v6 + v8);
}

- (double)_confirmsForHeroAppPrediction:(id)a3
{
  _ATXAppLaunchCategoricalHistogram *heroAppHistogram;
  void *v4;
  double v5;
  double v6;

  heroAppHistogram = self->_heroAppHistogram;
  objc_msgSend(a3, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](heroAppHistogram, "totalLaunchesForBundleId:category:", v4, CFSTR("confirms_hero"));
  v6 = v5;

  return v6;
}

- (double)_rejectsForHeroAppPrediction:(id)a3
{
  _ATXAppLaunchCategoricalHistogram *heroAppHistogram;
  void *v4;
  double v5;
  double v6;

  heroAppHistogram = self->_heroAppHistogram;
  objc_msgSend(a3, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](heroAppHistogram, "totalLaunchesForBundleId:category:", v4, CFSTR("rejects_hero"));
  v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroAppHistogram, 0);
}

@end
