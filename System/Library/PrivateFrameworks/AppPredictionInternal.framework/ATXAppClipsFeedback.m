@implementation ATXAppClipsFeedback

- (ATXAppClipsFeedback)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXAppClipsFeedback *v7;

  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categoricalHistogramForLaunchType:", 49);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoricalHistogramForLaunchType:", 94);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXAppClipsFeedback initWithAppClipsHistogram:appClipsHistogramNoDecay:](self, "initWithAppClipsHistogram:appClipsHistogramNoDecay:", v4, v6);

  return v7;
}

- (ATXAppClipsFeedback)initWithAppClipsHistogram:(id)a3 appClipsHistogramNoDecay:(id)a4
{
  id v7;
  id v8;
  ATXAppClipsFeedback *v9;
  ATXAppClipsFeedback *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXAppClipsFeedback;
  v9 = -[ATXAppClipsFeedback init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appClipsAndHeroAppHistogram, a3);
    objc_storeStrong((id *)&v10->_appClipsAndHeroAppHistogramNoDecay, a4);
  }

  return v10;
}

- (void)addConfirmForAppClipWithHeroAppPrediction:(id)a3 weight:(float)a4
{
  _ATXAppLaunchCategoricalHistogram *appClipsAndHeroAppHistogram;
  id v7;
  void *v8;
  void *v9;
  double v10;
  _ATXAppLaunchCategoricalHistogram *appClipsAndHeroAppHistogramNoDecay;
  void *v12;
  double v13;
  id v14;

  appClipsAndHeroAppHistogram = self->_appClipsAndHeroAppHistogram;
  v7 = a3;
  objc_msgSend(v7, "urlHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a4;
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](appClipsAndHeroAppHistogram, "addLaunchWithBundleId:date:category:weight:", v8, v9, CFSTR("confirms_clips"), v10);

  appClipsAndHeroAppHistogramNoDecay = self->_appClipsAndHeroAppHistogramNoDecay;
  objc_msgSend(v7, "urlHash");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = a4;
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](appClipsAndHeroAppHistogramNoDecay, "addLaunchWithBundleId:date:category:weight:", v14, v12, CFSTR("confirms_clips"), v13);

}

- (void)addRejectForAppClipWithHeroAppPrediction:(id)a3 weight:(float)a4
{
  _ATXAppLaunchCategoricalHistogram *appClipsAndHeroAppHistogram;
  id v7;
  void *v8;
  void *v9;
  double v10;
  _ATXAppLaunchCategoricalHistogram *appClipsAndHeroAppHistogramNoDecay;
  void *v12;
  double v13;
  id v14;

  appClipsAndHeroAppHistogram = self->_appClipsAndHeroAppHistogram;
  v7 = a3;
  objc_msgSend(v7, "urlHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a4;
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](appClipsAndHeroAppHistogram, "addLaunchWithBundleId:date:category:weight:", v8, v9, CFSTR("rejects_clips"), v10);

  appClipsAndHeroAppHistogramNoDecay = self->_appClipsAndHeroAppHistogramNoDecay;
  objc_msgSend(v7, "urlHash");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = a4;
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](appClipsAndHeroAppHistogramNoDecay, "addLaunchWithBundleId:date:category:weight:", v14, v12, CFSTR("rejects_clips"), v13);

}

- (BOOL)shouldShowAppClipWithHeroAppPrediction:(id)a3
{
  id v4;
  const __CFString *v5;
  NSObject *v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _BOOL4 v29;
  uint64_t v30;
  int v32;
  id v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild")
    || (v5 = (const __CFString *)*MEMORY[0x1E0CF95E0],
        LOBYTE(v32) = 0,
        !CFPreferencesGetAppBooleanValue(v5, (CFStringRef)*MEMORY[0x1E0CF9510], (Boolean *)&v32)))
  {
    +[ATXHeroAndClipConstants sharedInstance](ATXHeroAndClipConstants, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    if (-[ATXAppClipsFeedback _shouldHideAppClipForLowEngagementNoDecay:](self, "_shouldHideAppClipForLowEngagementNoDecay:", v4))
    {
      -[ATXAppClipsFeedback _rejectsForAppClipWithHeroAppPredictionNoDecay:](self, "_rejectsForAppClipWithHeroAppPredictionNoDecay:", v4);
      v9 = v8;
      -[ATXAppClipsFeedback _engagementForAppClipWithHeroAppPredictionNoDecay:](self, "_engagementForAppClipWithHeroAppPredictionNoDecay:", v4);
      v11 = v10;
      -[ATXAppClipsFeedback _confirmsForAppClipWithHeroAppPredictionNoDecay:](self, "_confirmsForAppClipWithHeroAppPredictionNoDecay:", v4);
      v13 = v12;
      __atxlog_handle_hero();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject appClipsPerAppClipEngagementThresholdNoDecay](v6, "appClipsPerAppClipEngagementThresholdNoDecay");
        v32 = 138413314;
        v33 = v4;
        v34 = 2048;
        v35 = v9;
        v36 = 2048;
        v37 = v11;
        v38 = 2048;
        v39 = v15;
        v40 = 2048;
        v41 = v13;
        v16 = "%@ has enough non-decaying rejects: %f, and engagement is: %f which is less than the threshold: %f. Hence,"
              " not showing this suggestion. Confirms: %f.";
LABEL_15:
        _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v32, 0x34u);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    -[ATXAppClipsFeedback _rejectsForAppClipWithHeroAppPrediction:](self, "_rejectsForAppClipWithHeroAppPrediction:", v4);
    v18 = v17;
    -[ATXAppClipsFeedback _confirmsForAppClipWithHeroAppPrediction:](self, "_confirmsForAppClipWithHeroAppPrediction:", v4);
    v20 = v19;
    -[NSObject appClipsPerAppClipMinRejects](v6, "appClipsPerAppClipMinRejects");
    if (v18 >= v21)
    {
      -[ATXAppClipsFeedback _engagementForAppClipWithHeroAppPrediction:](self, "_engagementForAppClipWithHeroAppPrediction:", v4);
      v26 = v25;
      -[NSObject appClipsPerAppClipEngagementThreshold](v6, "appClipsPerAppClipEngagementThreshold");
      v28 = v27;
      __atxlog_handle_hero();
      v14 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v26 < v28)
      {
        if (v29)
        {
          -[NSObject appClipsPerAppClipEngagementThreshold](v6, "appClipsPerAppClipEngagementThreshold");
          v32 = 138413314;
          v33 = v4;
          v34 = 2048;
          v35 = v18;
          v36 = 2048;
          v37 = v26;
          v38 = 2048;
          v39 = v30;
          v40 = 2048;
          v41 = v20;
          v16 = "%@ has enough rejects: %f, and engagement is: %f which is less than the threshold: %f. Hence, not showin"
                "g this suggestion. Confirms: %f.";
          goto LABEL_15;
        }
LABEL_16:
        v7 = 0;
LABEL_21:

        goto LABEL_22;
      }
      if (v29)
      {
        v32 = 134218496;
        v33 = v20;
        v34 = 2048;
        v35 = v18;
        v36 = 2048;
        v37 = v26;
        v22 = "All app clip specific thresholds passed. Confirms: %f, Rejects: %f, Engagement: %f";
        v23 = v14;
        v24 = 32;
        goto LABEL_19;
      }
    }
    else
    {
      __atxlog_handle_hero();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v32 = 134218240;
        v33 = v20;
        v34 = 2048;
        v35 = v18;
        v22 = "Not enough app clip specific rejects to consider engagement.  Confirms: %f, Rejects: %f ";
        v23 = v14;
        v24 = 22;
LABEL_19:
        _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v32, v24);
      }
    }
    v7 = 1;
    goto LABEL_21;
  }
  __atxlog_handle_hero();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v32) = 0;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Defaults for OverrideHeroAppPredictionEligibility set to True: Overriding app clip user engagement feedback", (uint8_t *)&v32, 2u);
  }
  v7 = 1;
LABEL_22:

  return v7;
}

- (double)feedbackScoreForAppClipWithHeroAppPrediction:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  +[ATXHeroAndClipConstants sharedInstance](ATXHeroAndClipConstants, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppClipsFeedback _rejectsForAppClipWithHeroAppPrediction:](self, "_rejectsForAppClipWithHeroAppPrediction:", v4);
  v7 = v6;
  objc_msgSend(v5, "appClipsPerAppClipMinRejects");
  v8 = 1.0;
  if (v7 >= v9)
  {
    -[ATXAppClipsFeedback _engagementForAppClipWithHeroAppPrediction:](self, "_engagementForAppClipWithHeroAppPrediction:", v4);
    v8 = v10;
  }

  return v8;
}

- (BOOL)shouldShowAppClips
{
  const __CFString *v3;
  NSObject *v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v20;
  int v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild")
    || (v3 = (const __CFString *)*MEMORY[0x1E0CF95E0],
        LOBYTE(v22) = 0,
        !CFPreferencesGetAppBooleanValue(v3, (CFStringRef)*MEMORY[0x1E0CF9510], (Boolean *)&v22)))
  {
    +[ATXHeroAndClipConstants sharedInstance](ATXHeroAndClipConstants, "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    -[ATXAppClipsFeedback _overallConfirms](self, "_overallConfirms");
    v7 = v6;
    -[ATXAppClipsFeedback _overallRejects](self, "_overallRejects");
    v9 = v8;
    -[NSObject appClipsOverallMinRejects](v4, "appClipsOverallMinRejects");
    if (v9 >= v10)
    {
      -[ATXAppClipsFeedback _overallAppClipsengagement](self, "_overallAppClipsengagement");
      v16 = v15;
      -[NSObject appClipsOverallEngagementThreshold](v4, "appClipsOverallEngagementThreshold");
      v18 = v17;
      __atxlog_handle_hero();
      v11 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v16 < v18)
      {
        if (v19)
        {
          -[NSObject appClipsOverallEngagementThreshold](v4, "appClipsOverallEngagementThreshold");
          v22 = 134218752;
          v23 = v9;
          v24 = 2048;
          v25 = v16;
          v26 = 2048;
          v27 = v20;
          v28 = 2048;
          v29 = v7;
          _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "There are enough overall rejects: %f, and overall App Clips Engagement is: %f which is less than the threshold: %f. Hence, not showing app clip suggestions. Confirms: %f", (uint8_t *)&v22, 0x2Au);
        }
        v5 = 0;
        goto LABEL_17;
      }
      if (v19)
      {
        v22 = 134218496;
        v23 = v7;
        v24 = 2048;
        v25 = v9;
        v26 = 2048;
        v27 = v16;
        v12 = "All overall app clip thresholds passed. Confirms: %f, Rejects: %f, Engagement: %f";
        v13 = v11;
        v14 = 32;
        goto LABEL_15;
      }
    }
    else
    {
      __atxlog_handle_hero();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 134218240;
        v23 = v7;
        v24 = 2048;
        v25 = v9;
        v12 = "Not enough overall rejects to consider engagement. Confirms: %f, Rejects: %f";
        v13 = v11;
        v14 = 22;
LABEL_15:
        _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v22, v14);
      }
    }
    v5 = 1;
LABEL_17:

    goto LABEL_18;
  }
  __atxlog_handle_hero();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "Defaults for OverrideHeroAppPredictionEligibility set to True: Overriding app clip user engagement feedback", (uint8_t *)&v22, 2u);
  }
  v5 = 1;
LABEL_18:

  return v5;
}

- (double)_overallAppClipsengagement
{
  double v3;
  double v4;
  double v5;

  -[ATXAppClipsFeedback _overallConfirms](self, "_overallConfirms");
  v4 = v3;
  -[ATXAppClipsFeedback _overallRejects](self, "_overallRejects");
  if (v5 == 0.0)
    return 1.0;
  else
    return v4 / (v4 + v5);
}

- (double)_engagementForAppClipWithHeroAppPrediction:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[ATXAppClipsFeedback _confirmsForAppClipWithHeroAppPrediction:](self, "_confirmsForAppClipWithHeroAppPrediction:", v4);
  v6 = v5;
  -[ATXAppClipsFeedback _rejectsForAppClipWithHeroAppPrediction:](self, "_rejectsForAppClipWithHeroAppPrediction:", v4);
  v8 = v7;

  if (v8 == 0.0)
    return 1.0;
  else
    return v6 / (v6 + v8);
}

- (double)_confirmsForAppClipWithHeroAppPrediction:(id)a3
{
  _ATXAppLaunchCategoricalHistogram *appClipsAndHeroAppHistogram;
  void *v4;
  double v5;
  double v6;

  appClipsAndHeroAppHistogram = self->_appClipsAndHeroAppHistogram;
  objc_msgSend(a3, "urlHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](appClipsAndHeroAppHistogram, "totalLaunchesForBundleId:category:", v4, CFSTR("confirms_clips"));
  v6 = v5;

  return v6;
}

- (double)_rejectsForAppClipWithHeroAppPrediction:(id)a3
{
  _ATXAppLaunchCategoricalHistogram *appClipsAndHeroAppHistogram;
  void *v4;
  double v5;
  double v6;

  appClipsAndHeroAppHistogram = self->_appClipsAndHeroAppHistogram;
  objc_msgSend(a3, "urlHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](appClipsAndHeroAppHistogram, "totalLaunchesForBundleId:category:", v4, CFSTR("rejects_clips"));
  v6 = v5;

  return v6;
}

- (double)_overallConfirms
{
  double result;

  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForCategory:](self->_appClipsAndHeroAppHistogram, "totalLaunchesForCategory:", CFSTR("confirms_clips"));
  return result;
}

- (double)_overallRejects
{
  double result;

  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForCategory:](self->_appClipsAndHeroAppHistogram, "totalLaunchesForCategory:", CFSTR("rejects_clips"));
  return result;
}

- (BOOL)_shouldHideAppClipForLowEngagementNoDecay:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  +[ATXHeroAndClipConstants sharedInstance](ATXHeroAndClipConstants, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppClipsFeedback _rejectsForAppClipWithHeroAppPredictionNoDecay:](self, "_rejectsForAppClipWithHeroAppPredictionNoDecay:", v4);
  v7 = v6;
  objc_msgSend(v5, "appClipsPerAppClipMinRejectsNoDecay");
  if (v7 >= v8)
  {
    -[ATXAppClipsFeedback _engagementForAppClipWithHeroAppPredictionNoDecay:](self, "_engagementForAppClipWithHeroAppPredictionNoDecay:", v4);
    v11 = v10;
    objc_msgSend(v5, "appClipsPerAppClipEngagementThresholdNoDecay");
    v9 = v11 < v12;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)_engagementForAppClipWithHeroAppPredictionNoDecay:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[ATXAppClipsFeedback _confirmsForAppClipWithHeroAppPredictionNoDecay:](self, "_confirmsForAppClipWithHeroAppPredictionNoDecay:", v4);
  v6 = v5;
  -[ATXAppClipsFeedback _rejectsForAppClipWithHeroAppPredictionNoDecay:](self, "_rejectsForAppClipWithHeroAppPredictionNoDecay:", v4);
  v8 = v7;

  if (v8 == 0.0)
    return 1.0;
  else
    return v6 / (v6 + v8);
}

- (double)_confirmsForAppClipWithHeroAppPredictionNoDecay:(id)a3
{
  _ATXAppLaunchCategoricalHistogram *appClipsAndHeroAppHistogramNoDecay;
  void *v4;
  double v5;
  double v6;

  appClipsAndHeroAppHistogramNoDecay = self->_appClipsAndHeroAppHistogramNoDecay;
  objc_msgSend(a3, "urlHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](appClipsAndHeroAppHistogramNoDecay, "totalLaunchesForBundleId:category:", v4, CFSTR("confirms_clips"));
  v6 = v5;

  return v6;
}

- (double)_rejectsForAppClipWithHeroAppPredictionNoDecay:(id)a3
{
  _ATXAppLaunchCategoricalHistogram *appClipsAndHeroAppHistogramNoDecay;
  void *v4;
  double v5;
  double v6;

  appClipsAndHeroAppHistogramNoDecay = self->_appClipsAndHeroAppHistogramNoDecay;
  objc_msgSend(a3, "urlHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](appClipsAndHeroAppHistogramNoDecay, "totalLaunchesForBundleId:category:", v4, CFSTR("rejects_clips"));
  v6 = v5;

  return v6;
}

- (double)_overallConfirmsNoDecay
{
  double result;

  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForCategory:](self->_appClipsAndHeroAppHistogramNoDecay, "totalLaunchesForCategory:", CFSTR("confirms_clips"));
  return result;
}

- (double)_overallRejectsNoDecay
{
  double result;

  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForCategory:](self->_appClipsAndHeroAppHistogramNoDecay, "totalLaunchesForCategory:", CFSTR("rejects_clips"));
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appClipsAndHeroAppHistogramNoDecay, 0);
  objc_storeStrong((id *)&self->_appClipsAndHeroAppHistogram, 0);
}

@end
