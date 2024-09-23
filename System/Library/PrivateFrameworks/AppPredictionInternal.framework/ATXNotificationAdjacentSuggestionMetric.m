@implementation ATXNotificationAdjacentSuggestionMetric

- (id)metricName
{
  return CFSTR("com.apple.NotificationAdjacentSuggestions.Suggestion");
}

- (id)coreAnalyticsDictionary
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[8];
  _QWORD v25[10];

  v25[8] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("bundleId");
  -[ATXNotificationAdjacentSuggestionMetric bundleId](self, "bundleId");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v3;
  v25[0] = v3;
  v24[1] = CFSTR("isAddToMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXNotificationAdjacentSuggestionMetric isAddToMode](self, "isAddToMode"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v23;
  v24[2] = CFSTR("secureBundleId");
  -[ATXNotificationAdjacentSuggestionMetric bundleId](self, "bundleId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[ATXNotificationAdjacentSuggestionMetric bundleId](self, "bundleId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXCoreAnalyticsFieldUtilities hashBoundString:](ATXCoreAnalyticsFieldUtilities, "hashBoundString:");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v5;
  }
  v20 = (void *)v5;
  v25[2] = v5;
  v24[3] = CFSTR("suggestionOutcome");
  -[ATXNotificationAdjacentSuggestionMetric suggestionOutcome](self, "suggestionOutcome");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v6;
  v24[4] = CFSTR("suggestionScope");
  -[ATXNotificationAdjacentSuggestionMetric suggestionScope](self, "suggestionScope", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v9;
  v24[5] = CFSTR("suggestionType");
  -[ATXNotificationAdjacentSuggestionMetric suggestionType](self, "suggestionType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[5] = v11;
  v24[6] = CFSTR("targetMode");
  -[ATXNotificationAdjacentSuggestionMetric targetMode](self, "targetMode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[6] = v13;
  v24[7] = CFSTR("timeToOutcome");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXNotificationAdjacentSuggestionMetric timeToOutcome](self, "timeToOutcome");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  if (!v10)

  if (!v8)
  if (!v7)

  if (v22)
  if (!v4)

  return v16;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (BOOL)isAddToMode
{
  return self->_isAddToMode;
}

- (void)setIsAddToMode:(BOOL)a3
{
  self->_isAddToMode = a3;
}

- (NSString)suggestionOutcome
{
  return self->_suggestionOutcome;
}

- (void)setSuggestionOutcome:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionOutcome, a3);
}

- (NSString)suggestionScope
{
  return self->_suggestionScope;
}

- (void)setSuggestionScope:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionScope, a3);
}

- (NSString)suggestionType
{
  return self->_suggestionType;
}

- (void)setSuggestionType:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionType, a3);
}

- (NSString)targetMode
{
  return self->_targetMode;
}

- (void)setTargetMode:(id)a3
{
  objc_storeStrong((id *)&self->_targetMode, a3);
}

- (double)timeToOutcome
{
  return self->_timeToOutcome;
}

- (void)setTimeToOutcome:(double)a3
{
  self->_timeToOutcome = a3;
}

- (double)suggestionCompletionTimestamp
{
  return self->_suggestionCompletionTimestamp;
}

- (void)setSuggestionCompletionTimestamp:(double)a3
{
  self->_suggestionCompletionTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetMode, 0);
  objc_storeStrong((id *)&self->_suggestionType, 0);
  objc_storeStrong((id *)&self->_suggestionScope, 0);
  objc_storeStrong((id *)&self->_suggestionOutcome, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
