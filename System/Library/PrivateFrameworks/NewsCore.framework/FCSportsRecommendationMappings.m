@implementation FCSportsRecommendationMappings

- (FCSportsRecommendationMappings)initWithDictionary:(id)a3
{
  id v4;
  FCSportsRecommendationMappings *v5;
  void *v6;
  FCSportsRecommendationsProvider *v7;
  FCSportsRecommendationsProvider *defaultRecommendations;
  void *v9;
  FCSportsRecommendationsProvider *v10;
  FCSportsRecommendationsProvider *alternativeRecommendations;
  FCSportsRecommendationMappings *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCSportsRecommendationMappings;
  v5 = -[FCSportsRecommendationMappings init](&v14, sel_init);
  if (v5)
  {
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("defaultRecommendations"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FCSportsRecommendationsProvider initWithDictionary:]([FCSportsRecommendationsProvider alloc], "initWithDictionary:", v6);
    defaultRecommendations = v5->_defaultRecommendations;
    v5->_defaultRecommendations = v7;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("alternativeRecommendations"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FCSportsRecommendationsProvider initWithDictionary:]([FCSportsRecommendationsProvider alloc], "initWithDictionary:", v9);
    alternativeRecommendations = v5->_alternativeRecommendations;
    v5->_alternativeRecommendations = v10;

    if (!v5->_defaultRecommendations && !v5->_alternativeRecommendations)
    {

      v12 = 0;
      goto LABEL_6;
    }

  }
  v12 = v5;
LABEL_6:

  return v12;
}

- (FCSportsRecommendationsProvider)defaultRecommendations
{
  return self->_defaultRecommendations;
}

- (void)setDefaultRecommendations:(id)a3
{
  objc_storeStrong((id *)&self->_defaultRecommendations, a3);
}

- (FCSportsRecommendationsProvider)alternativeRecommendations
{
  return self->_alternativeRecommendations;
}

- (void)setAlternativeRecommendations:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeRecommendations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeRecommendations, 0);
  objc_storeStrong((id *)&self->_defaultRecommendations, 0);
}

@end
