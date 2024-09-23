@implementation FCAppReviewRequestConfig

- (FCAppReviewRequestConfig)initWithDictionary:(id)a3
{
  id v4;
  FCAppReviewRequestConfig *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCAppReviewRequestConfig;
  v5 = -[FCAppReviewRequestConfig init](&v7, sel_init);
  if (v5)
  {
    v5->_quiescenceInterval = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("quiescenceInterval"), 0x7FFFFFFFFFFFFFFFLL);
    v5->_minNumberOfLikedArticles = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("minNumberOfLikedArticles"), 0x7FFFFFFFFFFFFFFFLL);
    v5->_minNumberOfSavedArticles = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("minNumberOfSavedArticles"), 0x7FFFFFFFFFFFFFFFLL);
    v5->_minNumberOfSharedArticles = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("minNumberOfSharedArticles"), 0x7FFFFFFFFFFFFFFFLL);
    v5->_minNumberOfEndOfArticleReads = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("minNumberOfEndOfArticleReads"), 0x7FFFFFFFFFFFFFFFLL);
    v5->_minNumberOfCombinedActions = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("minNumberOfCombinedActions"), 0x7FFFFFFFFFFFFFFFLL);
  }

  return v5;
}

- (int64_t)quiescenceInterval
{
  return self->_quiescenceInterval;
}

- (int64_t)minNumberOfLikedArticles
{
  return self->_minNumberOfLikedArticles;
}

- (int64_t)minNumberOfSavedArticles
{
  return self->_minNumberOfSavedArticles;
}

- (int64_t)minNumberOfSharedArticles
{
  return self->_minNumberOfSharedArticles;
}

- (int64_t)minNumberOfEndOfArticleReads
{
  return self->_minNumberOfEndOfArticleReads;
}

- (int64_t)minNumberOfCombinedActions
{
  return self->_minNumberOfCombinedActions;
}

@end
