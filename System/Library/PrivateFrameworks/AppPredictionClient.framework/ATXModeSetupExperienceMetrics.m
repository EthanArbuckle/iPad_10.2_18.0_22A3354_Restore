@implementation ATXModeSetupExperienceMetrics

- (id)metricName
{
  return CFSTR("com.apple.ModeConfiguration.SetupExperience");
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
  -[ATXModeSetupExperienceMetrics modeSemanticType](self, "modeSemanticType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("onboardingOutcome");
  v10[0] = v4;
  -[ATXModeSetupExperienceMetrics outcomeToString:](self, "outcomeToString:", -[ATXModeSetupExperienceMetrics onboardingOutcome](self, "onboardingOutcome"));
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
  -[ATXModeSetupExperienceMetrics modeSemanticType](self, "modeSemanticType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupExperienceMetrics outcomeToString:](self, "outcomeToString:", -[ATXModeSetupExperienceMetrics onboardingOutcome](self, "onboardingOutcome"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ATXModeSetupExperienceMetrics modeSemanticType:%@\nonboardingOutcome:%@\n"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)sendToCoreAnalytics
{
  void *v3;
  id v4;

  -[ATXModeSetupExperienceMetrics metricName](self, "metricName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupExperienceMetrics coreAnalyticsDictionary](self, "coreAnalyticsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (id)outcomeToString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("ModifiedSuggestions");
  if (a3 == 1)
    v3 = CFSTR("AcceptedSuggestions");
  if (a3 == 2)
    return CFSTR("Dismissed");
  else
    return (id)v3;
}

- (NSString)modeSemanticType
{
  return self->_modeSemanticType;
}

- (void)setModeSemanticType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)onboardingOutcome
{
  return self->_onboardingOutcome;
}

- (void)setOnboardingOutcome:(int64_t)a3
{
  self->_onboardingOutcome = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeSemanticType, 0);
}

@end
