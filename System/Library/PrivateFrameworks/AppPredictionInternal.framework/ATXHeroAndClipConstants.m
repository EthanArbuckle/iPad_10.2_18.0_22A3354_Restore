@implementation ATXHeroAndClipConstants

- (ATXHeroAndClipConstants)init
{
  ATXHeroAndClipConstants *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSDictionary *parameters;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXHeroAndClipConstants;
  v2 = -[ATXHeroAndClipConstants init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryWithLegacyPathForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8CF8]), "initWithAssetContents:", v3);
    objc_msgSend(v4, "abGroupContents");
    v5 = objc_claimAutoreleasedReturnValue();
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v5;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_26 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_26, &__block_literal_global_145);
  return (id)sharedInstance__pasExprOnceResult_34;
}

void __41__ATXHeroAndClipConstants_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_34;
  sharedInstance__pasExprOnceResult_34 = v1;

  objc_autoreleasePoolPop(v0);
}

- (double)appClipsOverallEngagementThreshold
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("AppClipsOverallEngagementThreshold"));
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

- (double)appClipsOverallMinRejects
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("AppClipsOverallMinRejects"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 9.9;
  }

  return v5;
}

- (double)appClipsPerAppClipEngagementThreshold
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("AppClipsPerAppClipEngagementThreshold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.3;
  }

  return v5;
}

- (double)appClipsPerAppClipMinRejects
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("AppClipsPerAppClipMinRejects"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.9;
  }

  return v5;
}

- (double)appClipsMediumConfidenceScoreThreshold
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("AppClipsMediumConfidenceScoreThreshold"));
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

- (double)appClipsHighConfidenceScoreThreshold
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("AppClipsHighConfidenceScoreThreshold"));
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

- (double)appClipsFeedbackHistogramHalfLifeInDays
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("AppClipsFeedbackHistogramHalfLifeInDays"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 14.0;
  }

  return v5;
}

- (id)appClipsModelVersion
{
  void *v2;
  Class v3;
  id v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("AppClipsModelVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = NSClassFromString(CFSTR("NSString"));
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("1.0");
  v8 = v7;

  return v8;
}

- (id)appClipsErrorDomain
{
  return CFSTR("com.apple.proactive.clips");
}

- (id)appClipsNotificationId
{
  return CFSTR("com.apple.proactive.notification.appClips");
}

- (id)appClipsNotificationCategoryIdentifier
{
  return CFSTR("appClipsCategory");
}

- (id)appClipsNotificationLockscreenIdentifier
{
  return CFSTR("appClipsLockscreen");
}

- (int64_t)appClipsDecodeErrorCode
{
  return -1;
}

- (int64_t)appClipsLaunchErrorCode
{
  return 0;
}

- (double)appClipsPerAppClipMinRejectsNoDecay
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("AppClipsPerAppClipMinRejectsNoDecay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 4.99;
  }

  return v5;
}

- (double)appClipsPerAppClipEngagementThresholdNoDecay
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("AppClipsPerAppClipEngagementThresholdNoDecay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.011;
  }

  return v5;
}

- (double)heroAppEngagementThreshold
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("HeroAppEngagementThreshold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.2;
  }

  return v5;
}

- (double)heroAppMinimumRejects
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("HeroAppMinimumRejects"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 1.6;
  }

  return v5;
}

- (double)heroAppWorstCaseLocationAccuracy
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("HeroAppWorstCaseLocationAccuracy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 45.0;
  }

  return v5;
}

- (double)heroAppTileMaxErrorDistance
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("HeroAppTileMaxErrorDistance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 25.0;
  }

  return v5;
}

- (double)heroAppMinRefreshInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("HeroAppMinRefreshInterval"));
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

- (double)heroAppPredictionExpirationInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("HeroAppPredictionExpirationInterval"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 1500.0;
  }

  return v5;
}

- (id)heroAppPredictionsKey
{
  return CFSTR("ATXHeroAppPredictionsKey");
}

- (int)heroAppIndexNotSet
{
  return 0x7FFF;
}

- (unint64_t)heroAppSessionLogPositiveSamplesPerDay
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("HeroAppSessionLogPositiveSamplesPerDay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 3;

  return v4;
}

- (unint64_t)heroAppSessionLogNegativeSamplesPerDay
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("HeroAppSessionLogNegativeSamplesPerDay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 3;

  return v4;
}

- (unint64_t)appClipSessionLogPositiveSamplesPerDay
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("AppClipSessionLogPositiveSamplesPerDay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 3;

  return v4;
}

- (unint64_t)appClipSessionLogNegativeSamplesPerDay
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("AppClipSessionLogNegativeSamplesPerDay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 3;

  return v4;
}

- (unint64_t)appShadowLogSamplesPerDay
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("AppShadowLogSamplesPerDay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 4;

  return v4;
}

- (unint64_t)appClipShadowLogSamplesPerDay
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("AppClipShadowLogSamplesPerDay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 3;

  return v4;
}

- (id)defaultHeroPOICategory
{
  return CFSTR("ATXDefaultHeroPOICategory");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
