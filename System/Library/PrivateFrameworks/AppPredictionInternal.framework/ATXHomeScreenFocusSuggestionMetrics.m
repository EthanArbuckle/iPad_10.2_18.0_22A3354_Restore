@implementation ATXHomeScreenFocusSuggestionMetrics

- (id)metricName
{
  return CFSTR("com.apple.ModeConfiguration.HomeScreenSuggestion");
}

- (id)coreAnalyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("modeSemanticType");
  -[ATXHomeScreenFocusSuggestionMetrics modeSemanticType](self, "modeSemanticType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("outcome");
  v10[0] = v4;
  -[ATXHomeScreenFocusSuggestionMetrics outcomeToString:](self, "outcomeToString:", -[ATXHomeScreenFocusSuggestionMetrics outcome](self, "outcome"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)

  if (!v3)
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ATXHomeScreenFocusSuggestionMetrics modeSemanticType](self, "modeSemanticType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenFocusSuggestionMetrics outcomeToString:](self, "outcomeToString:", -[ATXHomeScreenFocusSuggestionMetrics outcome](self, "outcome"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ATXHomeScreenFocusSuggestionMetrics modeSemanticType:%@\noutcome:%@\n"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)outcomeToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("AbandonedAfter24h");
  else
    return off_1E82DB5B8[a3 - 1];
}

- (unint64_t)cappedForPrivacyWithValue:(int64_t)a3
{
  if ((unint64_t)a3 >= 0x14)
    return 20;
  else
    return a3;
}

- (NSString)modeSemanticType
{
  return self->_modeSemanticType;
}

- (void)setModeSemanticType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(int64_t)a3
{
  self->_outcome = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeSemanticType, 0);
}

@end
