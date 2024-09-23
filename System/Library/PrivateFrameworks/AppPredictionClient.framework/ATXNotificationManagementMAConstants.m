@implementation ATXNotificationManagementMAConstants

- (ATXNotificationManagementMAConstants)init
{
  ATXNotificationManagementMAConstants *v2;
  void *v3;
  ATXAssetsABHelper *v4;
  uint64_t v5;
  NSDictionary *parameters;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXNotificationManagementMAConstants;
  v2 = -[ATXNotificationManagementMAConstants init](&v8, sel_init);
  if (v2)
  {
    +[ATXAssets2 dictionaryWithLegacyPathForClass:](ATXAssets2, "dictionaryWithLegacyPathForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[ATXAssetsABHelper initWithAssetContents:]([ATXAssetsABHelper alloc], "initWithAssetContents:", v3);
    -[ATXAssetsABHelper abGroupContents](v4, "abGroupContents");
    v5 = objc_claimAutoreleasedReturnValue();
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v5;

  }
  return v2;
}

+ (ATXNotificationManagementMAConstants)sharedInstance
{
  if (sharedInstance__pasOnceToken2_0 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_0, &__block_literal_global_55);
  return (ATXNotificationManagementMAConstants *)(id)sharedInstance__pasExprOnceResult_10;
}

void __54__ATXNotificationManagementMAConstants_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_10;
  sharedInstance__pasExprOnceResult_10 = v1;

  objc_autoreleasePoolPop(v0);
}

- (double)interruptionManagerRecommendationThresholdForContacts
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerRecommendationThresholdForContacts"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.35;
  }

  return v5;
}

- (double)interruptionManagerRecommendationThresholdForApps
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerRecommendationThresholdForApps"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.4;
  }

  return v5;
}

- (double)interruptionManagerRecommendationDenyListThresholdForApps
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerRecommendationDenyListThresholdForApps"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.4;
  }

  return v5;
}

- (double)interruptionManagerRecommendationDenyListThresholdForContacts
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerRecommendationDenyListThresholdForContacts"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.35;
  }

  return v5;
}

- (int64_t)interruptionManagerMaxSuggestions
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerMaxSuggestions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 10;

  return v4;
}

- (int64_t)interruptionManagerMaxAppSuggestionsForDenyList
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerMaxAppSuggestionsForDenyList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 12;

  return v4;
}

- (int64_t)interruptionManagerMaxContactSuggestionsForDenyList
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerMaxContactSuggestionsForDenyList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 10;

  return v4;
}

- (double)interruptionManagerPromptAllowScoreThreshold
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerPromptAllowScoreThreshold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.7;
  }

  return v5;
}

- (double)interruptionManagerPromptBlockScoreThreshold
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerPromptBlockScoreThreshold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = -0.01;
  }

  return v5;
}

- (double)thresholdForShowingDigestOnboardingSuggestion
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("thresholdForShowingDigestOnboardingSuggestion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (int64_t)numPreviousDaysToCheckForNotificationProblemForDigestOnboardingSuggestion
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("numPreviousDaysToCheckForNotificationProblemForDigestOnboardingSuggestion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 3;

  return v4;
}

- (int64_t)digestOnboardingSuggestionHour
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("digestOnboardingSuggestionHour"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 18;

  return v4;
}

- (int64_t)digestOnboardingSuggestionMinute
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("digestOnboardingSuggestionMinute"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (double)smartPauseManagerPauseDurationSeconds
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("smartPauseManagerPauseDurationSeconds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 1800.0;
  }

  return v5;
}

- (double)smartPauseManagerExpirationSeconds
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("smartPauseManagerExpirationSeconds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 600.0;
  }

  return v5;
}

- (double)smartPauseManagerRefreshIntervalSeconds
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("smartPauseManagerRefreshIntervalSeconds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 5.0;
  }

  return v5;
}

- (int64_t)urgencyTuningManagerMaxNumNonEngagementsAllowedForUrgentNotifications
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("urgencyTuningManagerMaxNumNonEngagementsAllowedForUrgentNotifications"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 3;

  return v4;
}

- (int64_t)sendMessagesToDigestManagerMaxNumNonEngagementsAllowedForMessageNotifications
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("sendMessagesToDigestManagerMaxNumNonEngagementsAllowedForMessageNotifications"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 3;

  return v4;
}

- (double)thresholdForShowingDigestOnboardingSuggestionToSeedUsers
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("thresholdForShowingDigestOnboardingSuggestionToSeedUsers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.5;
  }

  return v5;
}

- (int64_t)smartPauseManagerThresholdForNumNotificationsReceivedInLastFiveMinutesForThread
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("smartPauseManagerThresholdForNumNotificationsReceivedInLastFiveMinutesForThread"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 15;

  return v4;
}

- (int64_t)smartPauseManagerThresholdForNumNotificationsReceivedInLastFiveMinutesForApp
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("smartPauseManagerThresholdForNumNotificationsReceivedInLastFiveMinutesForApp"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 10;

  return v4;
}

- (double)smartPauseManagerEngagementRateThresholdForThread
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("smartPauseManagerEngagementRateThresholdForThread"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)smartPauseManagerEngagementRateThresholdForApp
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("smartPauseManagerEngagementRateThresholdForApp"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)sendToDigestEngagementRateThreshold
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("sendToDigestEngagementRateThreshold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.15;
  }

  return v5;
}

- (int64_t)sendToDigestThresholdForNumNonEngagements
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("sendToDigestThresholdForNumNonEngagements"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 10;

  return v4;
}

- (double)urgencyTuningStartTimeoutSeconds
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("urgencyTuningStartTimeoutSeconds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 604800.0;
  }

  return v5;
}

- (double)urgencyTuningTimeoutScaleFactor
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("urgencyTuningTimeoutScaleFactor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 2.0;
  }

  return v5;
}

- (double)smartPauseStartTimeoutSeconds
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("smartPauseStartTimeoutSeconds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 86400.0;
  }

  return v5;
}

- (double)smartPauseTimeoutScaleFactor
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("smartPauseTimeoutScaleFactor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 1.5;
  }

  return v5;
}

- (double)interruptionManagementStartTimeoutSeconds
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagementStartTimeoutSeconds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 604800.0;
  }

  return v5;
}

- (double)interruptionManagementTimeoutScaleFactor
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagementTimeoutScaleFactor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 2.0;
  }

  return v5;
}

- (double)sendToDigestStartTimeoutSeconds
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("sendToDigestStartTimeoutSeconds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 604800.0;
  }

  return v5;
}

- (double)sendToDigestTimeoutScaleFactor
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("sendToDigestTimeoutScaleFactor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 2.0;
  }

  return v5;
}

- (double)backupStartTimeoutSeconds
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("backupStartTimeoutSeconds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 604800.0;
  }

  return v5;
}

- (double)backupTimeoutScaleFactor
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("backupTimeoutScaleFactor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 2.0;
  }

  return v5;
}

- (int64_t)numIgnoresToReject
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("numIgnoresToReject"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 3;

  return v4;
}

- (int64_t)chinSuggestionsAreDisabled
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("chinSuggestionsAreDisabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (unint64_t)digestOnboardingSuggestionMinimumActiveNotifications
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("digestOnboardingSuggestionMinimumActiveNotifications"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 5;

  return v4;
}

- (unint64_t)digestOnboardingSuggestionMinimumUniqueBundleIds
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("digestOnboardingSuggestionMinimumUniqueBundleIds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 3;

  return v4;
}

- (int64_t)interruptionManagerMaxRecommendedAndCandidateContactSuggestionsForDenyList
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerMaxRecommendedAndCandidateContactSuggestionsForDenyList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 11;

  return v4;
}

- (int64_t)interruptionManagerMaxRecommendedAndCandidateContactSuggestionsForAllowList
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerMaxRecommendedAndCandidateContactSuggestionsForAllowList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 11;

  return v4;
}

- (int64_t)interruptionManagerMaxRecommendedAndCandidateAppSuggestionsForDenyList
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerMaxRecommendedAndCandidateAppSuggestionsForDenyList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 11;

  return v4;
}

- (int64_t)interruptionManagerMaxRecommendedAndCandidateAppSuggestionsForAllowList
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerMaxRecommendedAndCandidateAppSuggestionsForAllowList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 11;

  return v4;
}

- (double)interruptionManagerThresholdForRecommendedContactSuggestionForAllowList
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerThresholdForRecommendedContactSuggestionForAllowList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.35;
  }

  return v5;
}

- (double)interruptionManagerThresholdForRecommendedContactSuggestionForDenyList
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerThresholdForRecommendedContactSuggestionForDenyList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.35;
  }

  return v5;
}

- (double)interruptionManagerThresholdForCandidateContactSuggestionForAllowList
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerThresholdForCandidateContactSuggestionForAllowList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.1;
  }

  return v5;
}

- (double)interruptionManagerThresholdForCandidateContactSuggestionForDenyList
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerThresholdForCandidateContactSuggestionForDenyList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.1;
  }

  return v5;
}

- (double)interruptionManagerThresholdForRecommendedAppSuggestionForAllowList
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerThresholdForRecommendedAppSuggestionForAllowList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.4;
  }

  return v5;
}

- (double)interruptionManagerThresholdForRecommendedAppSuggestionForDenyList
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerThresholdForRecommendedAppSuggestionForDenyList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.4;
  }

  return v5;
}

- (double)interruptionManagerThresholdForCandidateAppSuggestionForAllowList
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerThresholdForCandidateAppSuggestionForAllowList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.15;
  }

  return v5;
}

- (double)interruptionManagerThresholdForCandidateAppSuggestionForDenyList
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("interruptionManagerThresholdForCandidateAppSuggestionForDenyList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.15;
  }

  return v5;
}

- (int64_t)ATXUserEducationSuggestionExploreFacesServer_minHour
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("ATXUserEducationSuggestionExploreFacesServer_minHour"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 18;

  return v4;
}

- (int64_t)ATXUserEducationSuggestionExploreFacesServer_maxHour
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("ATXUserEducationSuggestionExploreFacesServer_maxHour"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 22;

  return v4;
}

- (int64_t)ATXUserEducationSuggestionExploreFacesServer_tryAgainIntervalSeconds
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("ATXUserEducationSuggestionExploreFacesServer_tryAgainIntervalSeconds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 3600;

  return v4;
}

- (int64_t)ATXUserEducationSuggestionExploreFacesServer_gracePeriod
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("ATXUserEducationSuggestionExploreFacesServer_gracePeriod"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 1800;

  return v4;
}

- (int64_t)ATXUserEducationSuggestionExploreFacesServer_numBacklightOffEventsBeforeDismissSuggestion
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("ATXUserEducationSuggestionExploreFacesServer_numBacklightOffEventsBeforeDismissSuggestion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 3;

  return v4;
}

- (int64_t)ATXNotificationAndSuggestionDatabase_maxNumberOfNotificationsPerApp
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("ATXNotificationAndSuggestionDatabase_maxNumberOfNotificationsPerApp"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 10000;

  return v4;
}

- (int64_t)ATXNotificationAndSuggestionDatabase_maxNumberOfNotifications
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("ATXNotificationAndSuggestionDatabase_maxNumberOfNotifications"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 100000;

  return v4;
}

- (int64_t)ATXNotificationAndSuggestionDatabase_maxNumberOfSuggestions
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("ATXNotificationAndSuggestionDatabase_maxNumberOfSuggestions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 100000;

  return v4;
}

- (int64_t)ATXNotificationAndSuggestionDatabase_pruningBatchSize
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("ATXNotificationAndSuggestionDatabase_pruningBatchSize"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 5000;

  return v4;
}

- (id)numberForKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
