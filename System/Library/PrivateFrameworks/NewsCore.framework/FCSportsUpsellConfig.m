@implementation FCSportsUpsellConfig

- (FCSportsUpsellConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCSportsUpsellConfig *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCSportsUpsellConfig;
  v5 = -[FCSportsUpsellConfig init](&v13, sel_init);
  if (v5)
  {
    v6 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("quiescenceInterval"), 0x7FFFFFFFFFFFFFFFLL);
    if (v6)
      v7 = v6;
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_quiescenceInterval = v7;
    v8 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("engagedUserQuiescenceInterval"), 0x7FFFFFFFFFFFFFFFLL);
    if (v8)
      v9 = v8;
    else
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_engagedUserQuiescenceInterval = v9;
    v10 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("minNumberOfArticlesRead"), 0x7FFFFFFFFFFFFFFFLL);
    if (v10)
      v11 = v10;
    else
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_minNumberOfArticlesRead = v11;
    v5->_maxNumberOfPresentations = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("maxNumberOfPresentations"), 0);
    v5->_landingPageArticleID = (NSString *)FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("landingPageArticleId"), 0);
    v5->_maxNumberOfTopics = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("maxNumberOfTopics"), 1);
  }

  return v5;
}

- (int64_t)quiescenceInterval
{
  return self->_quiescenceInterval;
}

- (void)setQuiescenceInterval:(int64_t)a3
{
  self->_quiescenceInterval = a3;
}

- (int64_t)engagedUserQuiescenceInterval
{
  return self->_engagedUserQuiescenceInterval;
}

- (void)setEngagedUserQuiescenceInterval:(int64_t)a3
{
  self->_engagedUserQuiescenceInterval = a3;
}

- (int64_t)minNumberOfArticlesRead
{
  return self->_minNumberOfArticlesRead;
}

- (void)setMinNumberOfArticlesRead:(int64_t)a3
{
  self->_minNumberOfArticlesRead = a3;
}

- (int64_t)maxNumberOfPresentations
{
  return self->_maxNumberOfPresentations;
}

- (void)setMaxNumberOfPresentations:(int64_t)a3
{
  self->_maxNumberOfPresentations = a3;
}

- (NSString)landingPageArticleID
{
  return self->_landingPageArticleID;
}

- (void)setLandingPageArticleID:(id)a3
{
  self->_landingPageArticleID = (NSString *)a3;
}

- (int64_t)maxNumberOfTopics
{
  return self->_maxNumberOfTopics;
}

- (void)setMaxNumberOfTopics:(int64_t)a3
{
  self->_maxNumberOfTopics = a3;
}

@end
