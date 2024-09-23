@implementation ATXLockscreenSwitchMetric

- (id)metricName
{
  return CFSTR("com.apple.Proactive.Lockscreen.Switch");
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
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("lockscreenId");
  -[ATXLockscreenSwitchMetric lockscreenId](self, "lockscreenId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v4;
  v12[1] = CFSTR("switchMechanism");
  -[ATXLockscreenSwitchMetric switchMechanism](self, "switchMechanism");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v6;
  v12[2] = CFSTR("outcome");
  -[ATXLockscreenSwitchMetric outcome](self, "outcome");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v8;
  v12[3] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXLockscreenSwitchMetric duration](self, "duration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  if (!v5)

  if (!v3)
  return v10;
}

- (NSString)lockscreenId
{
  return self->_lockscreenId;
}

- (void)setLockscreenId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)switchMechanism
{
  return self->_switchMechanism;
}

- (void)setSwitchMechanism:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(int64_t)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_switchMechanism, 0);
  objc_storeStrong((id *)&self->_lockscreenId, 0);
}

@end
