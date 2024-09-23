@implementation ATXModeAffinityModelsConstants

- (ATXModeAffinityModelsConstants)init
{
  ATXModeAffinityModelsConstants *v2;
  uint64_t v3;
  ATXModeEntityTrialClientWrapper *modeEntityTrialClientWrapper;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *modeAffinityModelsConstants;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATXModeAffinityModelsConstants;
  v2 = -[ATXModeAffinityModelsConstants init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8F60], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    modeEntityTrialClientWrapper = v2->_modeEntityTrialClientWrapper;
    v2->_modeEntityTrialClientWrapper = (ATXModeEntityTrialClientWrapper *)v3;

    -[ATXModeEntityTrialClientWrapper modeAffinityModelsConstants](v2->_modeEntityTrialClientWrapper, "modeAffinityModelsConstants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
      -[ATXModeEntityTrialClientWrapper modeAffinityModelsConstants](v2->_modeEntityTrialClientWrapper, "modeAffinityModelsConstants");
    else
      objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryForResource:ofType:specifiedABGroup:", CFSTR("ATXModeAffinityModelsConstants"), CFSTR("plist"), 0);
    v7 = objc_claimAutoreleasedReturnValue();
    modeAffinityModelsConstants = v2->_modeAffinityModelsConstants;
    v2->_modeAffinityModelsConstants = (NSDictionary *)v7;

  }
  return v2;
}

- (int)numOfDaysToComputeEntityOccurenceFeatures
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_modeAffinityModelsConstants, "objectForKeyedSubscript:", CFSTR("numOfDaysToComputeEntityOccurenceFeatures"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 14;

  return v4;
}

- (int)numOfDaysToComputeEntityOccurenceFeaturesForContacts
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_modeAffinityModelsConstants, "objectForKeyedSubscript:", CFSTR("numOfDaysToComputeEntityOccurenceFeaturesForContacts"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 28;

  return v4;
}

- (double)scalingFactorForModeGlobalPriors
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_modeAffinityModelsConstants, "objectForKeyedSubscript:", CFSTR("scalingFactorForModeGlobalPriors"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 10.0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeEntityTrialClientWrapper, 0);
  objc_storeStrong((id *)&self->_modeAffinityModelsConstants, 0);
}

@end
