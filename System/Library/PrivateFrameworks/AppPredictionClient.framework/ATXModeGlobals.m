@implementation ATXModeGlobals

- (ATXModeGlobals)initWithAssetClass:(Class)a3
{
  ATXModeGlobals *v4;
  ATXAssetsABHelper *v5;
  __CFString *v6;
  void *v7;
  ATXAssetsABHelper *v8;
  uint64_t v9;
  NSDictionary *parameters;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ATXModeGlobals;
  v4 = -[ATXModeGlobals init](&v12, sel_init);
  if (v4)
  {
    v5 = [ATXAssetsABHelper alloc];
    if (a3)
    {
      NSStringFromClass(a3);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = CFSTR("_ATXGlobals");
    }
    +[ATXABHelper abGroupOverride](ATXABHelper, "abGroupOverride");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ATXAssetsABHelper initWithAssetsForResource:ofType:specifiedABGroup:](v5, "initWithAssetsForResource:ofType:specifiedABGroup:", v6, CFSTR("plplist"), v7);

    if (a3)
    -[ATXAssetsABHelper abGroupContents](v8, "abGroupContents");
    v9 = objc_claimAutoreleasedReturnValue();
    parameters = v4->_parameters;
    v4->_parameters = (NSDictionary *)v9;

  }
  return v4;
}

- (ATXModeGlobals)init
{
  return -[ATXModeGlobals initWithAssetClass:](self, "initWithAssetClass:", 0);
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_1 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_1, &__block_literal_global_6);
  return (id)sharedInstance__pasExprOnceResult_2;
}

void __32__ATXModeGlobals_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_2;
  sharedInstance__pasExprOnceResult_2 = v1;

  objc_autoreleasePoolPop(v0);
}

- (int)locationOfInterestSearchRadius
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("LocationOfInterestSearchRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 400;

  return v4;
}

- (int)homeLOISearchRadius
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("HomeLOISearchRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 400;

  return v4;
}

- (int)workLOISearchRadius
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("WorkLOISearchRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 800;

  return v4;
}

- (int)previousLOIExpirationTime
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("PreviousLOIExpirationTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 7200;

  return v4;
}

- (int)frequentLOIMinimumVisits
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("FrequentLOIMinimumVisits"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 25;

  return v4;
}

- (int)currentLocationUpdateInterval
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("CurrentLocationUpdateInterval"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 900;

  return v4;
}

- (int)locationOfInterestUpdateInterval
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("LocationOfInterestUpdateInterval"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 30;

  return v4;
}

- (int)predictedLocationsOfInterestUpdateInterval
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("PredictedLocationsOfInterestUpdateInterval"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 300;

  return v4;
}

- (int)predictedExitTimesUpdateInterval
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("PredictedExitTimesUpdateInterval"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 300;

  return v4;
}

- (BOOL)isAutomationTriggerSuggestionsForFocusEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("IsAutomationTriggerSuggestionsForFocusEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)isSetupSuggestionsForFocusEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("IsSetupSuggestionsForFocusEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
