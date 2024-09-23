@implementation ATXLockscreenPosterSuggestionMetric

- (id)metricName
{
  return CFSTR("com.apple.Proactive.Lockscreen.PosterSuggestion");
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
  void *v10;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("extensionBundleId");
  -[ATXLockscreenPosterSuggestionMetric extensionBundleId](self, "extensionBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v4;
  v12[1] = CFSTR("section");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXLockscreenPosterSuggestionMetric section](self, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  v12[2] = CFSTR("outcome");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXLockscreenPosterSuggestionMetric outcome](self, "outcome"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v6;
  v12[3] = CFSTR("sessionId");
  -[ATXLockscreenPosterSuggestionMetric sessionId](self, "sessionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[3] = v8;
  v12[4] = CFSTR("engaged");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXLockscreenPosterSuggestionMetric engaged](self, "engaged"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  if (!v3)

  return v10;
}

- (NSString)extensionBundleId
{
  return self->_extensionBundleId;
}

- (void)setExtensionBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)section
{
  return self->_section;
}

- (void)setSection:(unint64_t)a3
{
  self->_section = a3;
}

- (BOOL)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(BOOL)a3
{
  self->_outcome = a3;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)engaged
{
  return self->_engaged;
}

- (void)setEngaged:(BOOL)a3
{
  self->_engaged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
}

@end
