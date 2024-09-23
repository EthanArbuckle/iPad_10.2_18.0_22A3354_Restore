@implementation HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent

- (HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent *v17;
  HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent *v18;
  objc_super v20;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resumeSetupNonConfiguredAccessoryCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resumeSetupNonConfiguredBridgeCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resumeSetupNonConfiguredBridgedCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeUUID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  v20.receiver = self;
  v20.super_class = (Class)HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent;
  v17 = -[HFAnalyticsEvent initWithEventType:](&v20, sel_initWithEventType_, 30);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_nonConfiguredAccessoryCount, v6);
    objc_storeStrong((id *)&v18->_nonConfiguredBridgeCount, v9);
    objc_storeStrong((id *)&v18->_nonConfiguredBridgedCount, v12);
    objc_storeStrong((id *)&v18->_homeID, v15);
  }

  return v18;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent;
  -[HFAnalyticsEvent payload](&v10, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent nonConfiguredAccessoryCount](self, "nonConfiguredAccessoryCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("nonConfiguredAccessoryCount"));

  -[HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent nonConfiguredBridgeCount](self, "nonConfiguredBridgeCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("nonConfiguredBridgesCount"));

  -[HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent nonConfiguredBridgedCount](self, "nonConfiguredBridgedCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, CFSTR("nonConfiguredBridgedCount"));

  -[HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent homeID](self, "homeID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, CFSTR("home"));

  return v4;
}

- (NSNumber)nonConfiguredBridgedCount
{
  return self->_nonConfiguredBridgedCount;
}

- (NSNumber)nonConfiguredBridgeCount
{
  return self->_nonConfiguredBridgeCount;
}

- (NSNumber)nonConfiguredAccessoryCount
{
  return self->_nonConfiguredAccessoryCount;
}

- (NSString)homeID
{
  return self->_homeID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeID, 0);
  objc_storeStrong((id *)&self->_nonConfiguredBridgedCount, 0);
  objc_storeStrong((id *)&self->_nonConfiguredBridgeCount, 0);
  objc_storeStrong((id *)&self->_nonConfiguredAccessoryCount, 0);
}

- (void)setNonConfiguredAccessoryCount:(id)a3
{
  objc_storeStrong((id *)&self->_nonConfiguredAccessoryCount, a3);
}

- (void)setNonConfiguredBridgeCount:(id)a3
{
  objc_storeStrong((id *)&self->_nonConfiguredBridgeCount, a3);
}

- (void)setNonConfiguredBridgedCount:(id)a3
{
  objc_storeStrong((id *)&self->_nonConfiguredBridgedCount, a3);
}

- (void)setHomeID:(id)a3
{
  objc_storeStrong((id *)&self->_homeID, a3);
}

@end
