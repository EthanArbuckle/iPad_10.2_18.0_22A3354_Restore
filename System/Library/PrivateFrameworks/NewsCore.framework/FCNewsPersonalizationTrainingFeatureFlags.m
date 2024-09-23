@implementation FCNewsPersonalizationTrainingFeatureFlags

- (FCNewsPersonalizationTrainingFeatureFlags)initWithDictionary:(id)a3
{
  id v4;
  FCNewsPersonalizationTrainingFeatureFlags *v5;
  uint64_t v6;
  NSNumber *uniqueAggregateLimit;
  uint64_t v8;
  NSNumber *eventLimit;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCNewsPersonalizationTrainingFeatureFlags;
  v5 = -[FCNewsPersonalizationTrainingFeatureFlags init](&v11, sel_init);
  if (v5)
  {
    v5->_enableSingleLifetimeSeenEventPerArticle = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("enableSingleLifetimeSeenEventPerArticle"), 0);
    v5->_enableSyntheticTagFollowEvents = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("enableSyntheticTagFollowEvents"), 0);
    v5->_readingHistoryItemCountToProcess = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("readingHistoryItemCountToProcess"), 0);
    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("uniqueAggregateLimit"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueAggregateLimit = v5->_uniqueAggregateLimit;
    v5->_uniqueAggregateLimit = (NSNumber *)v6;

    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("eventLimit"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    eventLimit = v5->_eventLimit;
    v5->_eventLimit = (NSNumber *)v8;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventLimit, 0);
  objc_storeStrong((id *)&self->_uniqueAggregateLimit, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; enableSingleLifetimeSeenEventPerArticle: %d"),
    -[FCNewsPersonalizationTrainingFeatureFlags enableSingleLifetimeSeenEventPerArticle](self, "enableSingleLifetimeSeenEventPerArticle"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; enableSyntheticTagFollowEvents: %d"),
    -[FCNewsPersonalizationTrainingFeatureFlags enableSyntheticTagFollowEvents](self, "enableSyntheticTagFollowEvents"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; readingHistoryItemCountToProcess: %llu"),
    -[FCNewsPersonalizationTrainingFeatureFlags readingHistoryItemCountToProcess](self, "readingHistoryItemCountToProcess"));
  -[FCNewsPersonalizationTrainingFeatureFlags uniqueAggregateLimit](self, "uniqueAggregateLimit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; uniqueAggregateLimit: %@"), v4);

  -[FCNewsPersonalizationTrainingFeatureFlags eventLimit](self, "eventLimit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; eventLimit: %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)enableSingleLifetimeSeenEventPerArticle
{
  return self->_enableSingleLifetimeSeenEventPerArticle;
}

- (void)setEnableSingleLifetimeSeenEventPerArticle:(BOOL)a3
{
  self->_enableSingleLifetimeSeenEventPerArticle = a3;
}

- (BOOL)enableSyntheticTagFollowEvents
{
  return self->_enableSyntheticTagFollowEvents;
}

- (void)setEnableSyntheticTagFollowEvents:(BOOL)a3
{
  self->_enableSyntheticTagFollowEvents = a3;
}

- (int64_t)readingHistoryItemCountToProcess
{
  return self->_readingHistoryItemCountToProcess;
}

- (void)setReadingHistoryItemCountToProcess:(int64_t)a3
{
  self->_readingHistoryItemCountToProcess = a3;
}

- (NSNumber)uniqueAggregateLimit
{
  return self->_uniqueAggregateLimit;
}

- (void)setUniqueAggregateLimit:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueAggregateLimit, a3);
}

- (NSNumber)eventLimit
{
  return self->_eventLimit;
}

- (void)setEventLimit:(id)a3
{
  objc_storeStrong((id *)&self->_eventLimit, a3);
}

@end
