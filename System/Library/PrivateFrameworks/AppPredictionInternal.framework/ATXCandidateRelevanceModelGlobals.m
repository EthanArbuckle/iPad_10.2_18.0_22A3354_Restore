@implementation ATXCandidateRelevanceModelGlobals

- (ATXCandidateRelevanceModelGlobals)init
{
  ATXCandidateRelevanceModelGlobals *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSDictionary *parameters;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXCandidateRelevanceModelGlobals;
  v2 = -[ATXCandidateRelevanceModelGlobals init](&v8, sel_init);
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
  if (sharedInstance__pasOnceToken6_30 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_30, &__block_literal_global_169);
  return (id)sharedInstance__pasExprOnceResult_39;
}

void __51__ATXCandidateRelevanceModelGlobals_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_39;
  sharedInstance__pasExprOnceResult_39 = v1;

  objc_autoreleasePoolPop(v0);
}

- (BOOL)isPipelineEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("IsPipelineEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (int)maxCategoricalFeaturesCount
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("MaxCategoricalFeaturesCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 100;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
