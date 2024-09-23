@implementation ATXNotificationDigestRankingConstants

- (double)weightForMarqueeAppearance
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("weightForMarqueeAppearance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = -0.2;
  }

  return v5;
}

- (double)weightForMarqueeEngagement
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("weightForMarqueeEngagement"));
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

- (double)weightForNonMarqueeAppearance
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("weightForNonMarqueeAppearance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = -0.15;
  }

  return v5;
}

- (double)weightForNonMarqueeEngagement
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("weightForNonMarqueeEngagement"));
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

- (double)weightForBasicNotificationsSent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("weightForBasicNotificationsSent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = -0.002;
  }

  return v5;
}

- (double)weightForTimeSensitiveNotificationsSent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("weightForTimeSensitiveNotificationsSent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = -0.005;
  }

  return v5;
}

- (double)logisticCenterXVal
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("logisticCenterXVal"));
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

- (double)logisticGrowthRate
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("logisticGrowthRate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 1.0;
  }

  return v5;
}

- (double)minMarqueeAppearancesPerApp
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("minMarqueeAppearancesPerApp"));
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

- (double)giveMarqueeToNonAppearingAppProbability
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("giveMarqueeToNonAppearingAppProbability"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 1.0;
  }

  return v5;
}

- (unint64_t)numMarqueeSpots
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("numMarqueeSpots"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 2;

  return v4;
}

- (double)dailyDecayFactor
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("dailyDecayFactor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.98;
  }

  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_3 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_3, &__block_literal_global_29);
  return (id)sharedInstance__pasExprOnceResult_4;
}

void __55__ATXNotificationDigestRankingConstants_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_4;
  sharedInstance__pasExprOnceResult_4 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXNotificationDigestRankingConstants)init
{
  ATXNotificationDigestRankingConstants *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSDictionary *parameters;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXNotificationDigestRankingConstants;
  v2 = -[ATXNotificationDigestRankingConstants init](&v8, sel_init);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
