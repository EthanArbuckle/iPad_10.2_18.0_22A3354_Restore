@implementation HFAnalyticsAppForegroundDurationEvent

- (HFAnalyticsAppForegroundDurationEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HFAnalyticsAppForegroundDurationEvent *v7;
  HFAnalyticsAppForegroundDurationEvent *v8;
  void *v9;
  uint64_t v10;
  NSString *processName;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("foregroundDuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    NSLog(CFSTR("HFAnalyticsAppForegroundDurationEvent foregroundDuration is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userHasAccessories"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    NSLog(CFSTR("HFAnalyticsAppForegroundDurationEvent userHasAccessories is nil"));
  v13.receiver = self;
  v13.super_class = (Class)HFAnalyticsAppForegroundDurationEvent;
  v7 = -[HFAnalyticsEvent initWithEventType:](&v13, sel_initWithEventType_, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_foregroundDuration, v5);
    v8->_userHasAccessories = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processName");
    v10 = objc_claimAutoreleasedReturnValue();
    processName = v8->_processName;
    v8->_processName = (NSString *)v10;

  }
  return v8;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HFAnalyticsAppForegroundDurationEvent;
  -[HFAnalyticsEvent payload](&v9, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsAppForegroundDurationEvent foregroundDuration](self, "foregroundDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("foregroundDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsAppForegroundDurationEvent userHasAccessories](self, "userHasAccessories"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("userHasAccessories"));

  -[HFAnalyticsAppForegroundDurationEvent processName](self, "processName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("processName"));

  return v4;
}

- (NSNumber)foregroundDuration
{
  return self->_foregroundDuration;
}

- (void)setForegroundDuration:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundDuration, a3);
}

- (BOOL)userHasAccessories
{
  return self->_userHasAccessories;
}

- (void)setUserHasAccessories:(BOOL)a3
{
  self->_userHasAccessories = a3;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_foregroundDuration, 0);
}

@end
