@implementation ATXComplicationSuggestionParameters

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_10 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_10, &__block_literal_global_75);
  return (id)sharedInstance__pasExprOnceResult_12;
}

void __53__ATXComplicationSuggestionParameters_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_12;
  sharedInstance__pasExprOnceResult_12 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXComplicationSuggestionParameters)init
{
  ATXComplicationSuggestionParameters *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  NSDictionary *parameters;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXComplicationSuggestionParameters;
  v2 = -[ATXComplicationSuggestionParameters init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CF8CF0];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryForResource:ofType:specifiedABGroup:", v5, CFSTR("plplist"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v6;

  }
  return v2;
}

- (id)appsToPriorsMapping
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("AppsToPriors"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;

  return v5;
}

- (id)modularComplicationsToPriorsMapping
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("ModularComplicationsToPriors"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;

  return v5;
}

- (id)inlineComplicationsToPriorsMapping
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("InlineComplicationsToPriorsMapping"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;

  return v5;
}

- (id)fallbackSetsForSet1
{
  return -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("FallbackSetsForSet1"));
}

- (id)fallbackSetsForSet2
{
  return -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("FallbackSetsForSet2"));
}

- (id)fallbackSetsForSet3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("FallbackSetsForSet3"));
}

- (id)fallbackSetForLandscape
{
  return -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("FallbackSetForLandscape"));
}

- (BOOL)alwaysUseFallbackSets
{
  void *v2;
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("AlwaysUseFallbackSets"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)showPreviewsInPosterGallery
{
  void *v2;
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("ShowPreviewsInPosterGallery"));
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
