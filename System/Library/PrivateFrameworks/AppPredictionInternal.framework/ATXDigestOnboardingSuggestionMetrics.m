@implementation ATXDigestOnboardingSuggestionMetrics

- (id)metricName
{
  return CFSTR("com.apple.digestOnboarding.digestOnboardingSuggestion.event");
}

- (id)coreAnalyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("sessionUUID");
  -[ATXDigestOnboardingSuggestionMetrics sessionUUID](self, "sessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("suggestionOutcome");
  -[ATXDigestOnboardingSuggestionMetrics outcome](self, "outcome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("timeToResolution");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXDigestOnboardingSuggestionMetrics timeToResolution](self, "timeToResolution");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  if (!v3)

  return v9;
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (NSString)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(id)a3
{
  objc_storeStrong((id *)&self->_outcome, a3);
}

- (double)timeToResolution
{
  return self->_timeToResolution;
}

- (void)setTimeToResolution:(double)a3
{
  self->_timeToResolution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
