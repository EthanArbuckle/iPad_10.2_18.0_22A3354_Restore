@implementation ATXDigestOnboardingSuggestionLogging

- (ATXDigestOnboardingSuggestionLogging)initWithDigestOnboardingSuggestionLoggingBiomeStream:(id)a3
{
  id v5;
  ATXDigestOnboardingSuggestionLogging *v6;
  ATXDigestOnboardingSuggestionLogging *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXDigestOnboardingSuggestionLogging;
  v6 = -[ATXDigestOnboardingSuggestionLogging init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_digestOnboardingSuggestionLoggingBiomeStream, a3);

  return v7;
}

- (ATXDigestOnboardingSuggestionLogging)init
{
  void *v3;
  ATXDigestOnboardingSuggestionLogging *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXDigestOnboardingSuggestionLogging initWithDigestOnboardingSuggestionLoggingBiomeStream:](self, "initWithDigestOnboardingSuggestionLoggingBiomeStream:", v3);

  return v4;
}

- (void)logDigestOnboardingSuggestionWithOutcome:(int)a3 timeToResolution:(double)a4
{
  uint64_t v5;
  ATXDigestOnboardingSuggestionLoggingEvent *v7;
  void *v8;
  id v9;

  v5 = *(_QWORD *)&a3;
  v9 = (id)objc_opt_new();
  v7 = -[ATXDigestOnboardingSuggestionLoggingEvent initWithSessionUUID:outcome:timeToResolution:]([ATXDigestOnboardingSuggestionLoggingEvent alloc], "initWithSessionUUID:outcome:timeToResolution:", v9, v5, a4);
  -[ATXDigestOnboardingSuggestionLoggingBiomeStream source](self->_digestOnboardingSuggestionLoggingBiomeStream, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendEvent:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestOnboardingSuggestionLoggingBiomeStream, 0);
}

@end
