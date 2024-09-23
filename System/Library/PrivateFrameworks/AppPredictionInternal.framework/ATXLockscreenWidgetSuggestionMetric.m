@implementation ATXLockscreenWidgetSuggestionMetric

- (id)metricName
{
  return CFSTR("com.apple.Proactive.Lockscreen.WidgetSuggestion");
}

- (id)coreAnalyticsDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[7];
  _QWORD v17[8];

  v17[7] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("extensionBundleId");
  -[ATXLockscreenWidgetSuggestionMetric extensionBundleId](self, "extensionBundleId");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v3;
  v16[1] = CFSTR("family");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXLockscreenWidgetSuggestionMetric family](self, "family", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  v16[2] = CFSTR("kind");
  -[ATXLockscreenWidgetSuggestionMetric kind](self, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v7;
  v16[3] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXLockscreenWidgetSuggestionMetric reason](self, "reason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v8;
  v16[4] = CFSTR("outcome");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXLockscreenWidgetSuggestionMetric outcome](self, "outcome"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v9;
  v16[5] = CFSTR("sessionId");
  -[ATXLockscreenWidgetSuggestionMetric sessionId](self, "sessionId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[5] = v11;
  v16[6] = CFSTR("numEngaged");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXLockscreenWidgetSuggestionMetric numEngaged](self, "numEngaged"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  if (!v6)

  if (!v4)
  return v13;
}

- (NSString)extensionBundleId
{
  return self->_extensionBundleId;
}

- (void)setExtensionBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)family
{
  return self->_family;
}

- (void)setFamily:(unint64_t)a3
{
  self->_family = a3;
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (BOOL)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(BOOL)a3
{
  self->_outcome = a3;
}

- (int64_t)numEngaged
{
  return self->_numEngaged;
}

- (void)setNumEngaged:(int64_t)a3
{
  self->_numEngaged = a3;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
}

@end
