@implementation FCSportsRecommendationsProvider

- (FCSportsRecommendationsProvider)initWithDictionary:(id)a3
{
  id v4;
  FCSportsRecommendationsProvider *v5;
  uint64_t v6;
  NSDictionary *scoredTagIDs;
  FCSportsRecommendationsProvider *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCSportsRecommendationsProvider;
  v5 = -[FCSportsRecommendationsProvider init](&v10, sel_init);
  if (v5
    && (FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("scoredTagIDs"), 0),
        v6 = objc_claimAutoreleasedReturnValue(),
        scoredTagIDs = v5->_scoredTagIDs,
        v5->_scoredTagIDs = (NSDictionary *)v6,
        scoredTagIDs,
        !v5->_scoredTagIDs))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (NSDictionary)scoredTagIDs
{
  return self->_scoredTagIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoredTagIDs, 0);
}

@end
