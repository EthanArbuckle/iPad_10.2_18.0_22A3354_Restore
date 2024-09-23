@implementation ATXIntentGlobals

- (ATXIntentGlobals)init
{
  ATXIntentGlobals *v2;
  ATXAssetsABHelper *v3;
  void *v4;
  ATXAssetsABHelper *v5;
  uint64_t v6;
  NSDictionary *parameters;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXIntentGlobals;
  v2 = -[ATXIntentGlobals init](&v9, sel_init);
  if (v2)
  {
    v3 = [ATXAssetsABHelper alloc];
    +[ATXABHelper abGroupOverride](ATXABHelper, "abGroupOverride");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[ATXAssetsABHelper initWithAssetsForResource:ofType:specifiedABGroup:](v3, "initWithAssetsForResource:ofType:specifiedABGroup:", CFSTR("_ATXGlobals"), CFSTR("plplist"), v4);

    -[ATXAssetsABHelper abGroupContents](v5, "abGroupContents");
    v6 = objc_claimAutoreleasedReturnValue();
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v6;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_7 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_7, &__block_literal_global_42);
  return (id)sharedInstance__pasExprOnceResult_8;
}

void __34__ATXIntentGlobals_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_8;
  sharedInstance__pasExprOnceResult_8 = v1;

  objc_autoreleasePoolPop(v0);
}

- (id)approvedSiriKitIntents
{
  void *v2;
  void *v3;
  id v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("ApprovedSiriKitIntents"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (BOOL)onlyAcceptBecomeCurrentNSUAs
{
  void *v2;
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("OnlyAcceptBecomeCurrentNSUAs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (BOOL)onlyUseEligibleForPrediction
{
  void *v2;
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("OnlyUseEligibleForPrediction"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
