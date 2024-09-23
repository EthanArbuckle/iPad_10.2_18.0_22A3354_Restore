@implementation ATXActivitySuggestionsFeedbackHistogramHelper

- (ATXActivitySuggestionsFeedbackHistogramHelper)init
{
  void *v3;
  void *v4;
  ATXActivitySuggestionsFeedbackHistogramHelper *v5;

  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categoricalHistogramForLaunchType:", 96);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[ATXActivitySuggestionsFeedbackHistogramHelper initWithFeedbackCategoricalHistogram:](self, "initWithFeedbackCategoricalHistogram:", v4);
  return v5;
}

- (ATXActivitySuggestionsFeedbackHistogramHelper)initWithFeedbackCategoricalHistogram:(id)a3
{
  id v5;
  ATXActivitySuggestionsFeedbackHistogramHelper *v6;
  ATXActivitySuggestionsFeedbackHistogramHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXActivitySuggestionsFeedbackHistogramHelper;
  v6 = -[ATXActivitySuggestionsFeedbackHistogramHelper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_feedbackCategoricalHistogram, a3);

  return v7;
}

- (void)updateFeedbackHistogramWithEvent:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  _ATXAppLaunchCategoricalHistogram *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  _ATXAppLaunchCategoricalHistogram *feedbackCategoricalHistogram;
  void *v21;
  _ATXAppLaunchCategoricalHistogram *v22;
  void *v23;
  ATXActivitySuggestionsFeedbackHistogramHelper *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSObject location](v4, "location") == 1)
  {
    v24 = self;
    v5 = (void *)objc_opt_class();
    -[NSObject activity](v4, "activity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modeUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject activity](v4, "activity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activityType");
    v9 = ATXActivityTypeToBMUserFocusInferredModeType();
    -[NSObject activity](v4, "activity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "origin");
    v11 = BMUserFocusInferredModeOriginFromLegacy();
    -[NSObject activity](v4, "activity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "originAnchorType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "histogramBundleIdForModeWithUUID:modeType:origin:originAnchorType:", v7, v9, v11, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = -[NSObject eventType](v4, "eventType");
    switch(v15)
    {
      case 3:
        feedbackCategoricalHistogram = v24->_feedbackCategoricalHistogram;
        -[NSObject eventDate](v4, "eventDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:](feedbackCategoricalHistogram, "addLaunchWithBundleId:date:category:", v14, v21, CFSTR("rejected"));

        __atxlog_handle_modes();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v26 = "-[ATXActivitySuggestionsFeedbackHistogramHelper updateFeedbackHistogramWithEvent:]";
          v27 = 2112;
          v28 = v14;
          v19 = "%s: adding rejected count to feedback event of id: %@";
          goto LABEL_13;
        }
LABEL_14:

        break;
      case 2:
        v22 = v24->_feedbackCategoricalHistogram;
        -[NSObject eventDate](v4, "eventDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:](v22, "addLaunchWithBundleId:date:category:", v14, v23, CFSTR("accepted"));

        __atxlog_handle_modes();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v26 = "-[ATXActivitySuggestionsFeedbackHistogramHelper updateFeedbackHistogramWithEvent:]";
          v27 = 2112;
          v28 = v14;
          v19 = "%s: adding accepted count to feedback event of id: %@";
          goto LABEL_13;
        }
        goto LABEL_14;
      case 0:
        v16 = v24->_feedbackCategoricalHistogram;
        -[NSObject eventDate](v4, "eventDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:](v16, "addLaunchWithBundleId:date:category:", v14, v17, CFSTR("suggested"));

        __atxlog_handle_modes();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v26 = "-[ATXActivitySuggestionsFeedbackHistogramHelper updateFeedbackHistogramWithEvent:]";
          v27 = 2112;
          v28 = v14;
          v19 = "%s: adding suggested count to feedback event of id: %@";
LABEL_13:
          _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);
          goto LABEL_14;
        }
        goto LABEL_14;
    }
  }
  else
  {
    __atxlog_handle_modes();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[ATXActivitySuggestionsFeedbackHistogramHelper updateFeedbackHistogramWithEvent:]";
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "%s: skipping feedback event since it does not pertain to lock screen: %@", buf, 0x16u);
    }
  }

}

+ (id)histogramBundleIdForModeWithUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originAnchorType:(id)a6
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v7 = (objc_class *)MEMORY[0x1E0CB3940];
  v8 = a6;
  v9 = a3;
  v10 = [v7 alloc];
  v11 = BMUserFocusInferredModeTypeToLegacy();
  v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@:%lu:%lu:%@"), v9, v11, BMUserFocusInferredModeOriginToLegacy(), v8);

  return v12;
}

- (double)suggestionsGivenForLockScreenSuggestionWithModeUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originAnchorType:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "histogramBundleIdForModeWithUUID:modeType:origin:originAnchorType:", v11, v7, v6, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](self->_feedbackCategoricalHistogram, "totalLaunchesForBundleId:category:", v12, CFSTR("suggested"));
  v14 = v13;

  return v14;
}

- (double)acceptancesForLockScreenSuggestionWithModeUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originAnchorType:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "histogramBundleIdForModeWithUUID:modeType:origin:originAnchorType:", v11, v7, v6, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](self->_feedbackCategoricalHistogram, "totalLaunchesForBundleId:category:", v12, CFSTR("accepted"));
  v14 = v13;

  return v14;
}

- (double)rejectionsForLockScreenSuggestionWithModeUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originAnchorType:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "histogramBundleIdForModeWithUUID:modeType:origin:originAnchorType:", v11, v7, v6, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](self->_feedbackCategoricalHistogram, "totalLaunchesForBundleId:category:", v12, CFSTR("rejected"));
  v14 = v13;

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackCategoricalHistogram, 0);
}

@end
