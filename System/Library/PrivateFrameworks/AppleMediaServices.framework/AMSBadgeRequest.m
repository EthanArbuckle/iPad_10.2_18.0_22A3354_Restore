@implementation AMSBadgeRequest

- (AMSBadgeRequest)initWithPushPayload:(id)a3
{
  id v4;
  AMSBadgeRequest *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *actionMetricsEvent;
  uint64_t v9;
  NSString *bundleIdentifier;
  void *v11;
  uint64_t v12;
  NSString *badgeIdentifier;
  void *v14;
  void *v15;
  NSDictionary *v16;
  NSDictionary *metrics;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AMSBadgeRequest;
  v5 = -[AMSBadgeRequest init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "aps");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actionMetricsEvent"));
    v7 = objc_claimAutoreleasedReturnValue();
    actionMetricsEvent = v5->_actionMetricsEvent;
    v5->_actionMetricsEvent = (NSDictionary *)v7;

    objc_msgSend(v4, "clientIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v9;

    objc_msgSend(v4, "aps");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("badgeId"));
    v12 = objc_claimAutoreleasedReturnValue();
    badgeIdentifier = v5->_badgeIdentifier;
    v5->_badgeIdentifier = (NSString *)v12;

    objc_msgSend(v4, "aps");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("metrics"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    metrics = v5->_metrics;
    v5->_metrics = v16;

    objc_msgSend(v4, "aps");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("enabled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "aps");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("enabled"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_enabled = objc_msgSend(v21, "BOOLValue");

    }
    else
    {
      v5->_enabled = 0;
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[AMSBadgeRequest actionMetricsEvent](self, "actionMetricsEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSBadgeRequest actionMetricsEvent](self, "actionMetricsEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("actionMetricsEvent"));

  }
  -[AMSBadgeRequest badgeIdentifier](self, "badgeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AMSBadgeRequest badgeIdentifier](self, "badgeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("badgeIdentifier"));

  }
  -[AMSBadgeRequest bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSBadgeRequest bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("bundleIdentifier"));

  }
  -[AMSBadgeRequest metrics](self, "metrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AMSBadgeRequest metrics](self, "metrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("metrics"));

  }
  objc_msgSend(v12, "encodeBool:forKey:", -[AMSBadgeRequest enabled](self, "enabled"), CFSTR("enabled"));

}

- (AMSBadgeRequest)initWithCoder:(id)a3
{
  id v4;
  AMSBadgeRequest *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *actionMetricsEvent;
  uint64_t v9;
  NSString *badgeIdentifier;
  uint64_t v11;
  NSString *bundleIdentifier;
  void *v13;
  uint64_t v14;
  NSDictionary *metrics;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AMSBadgeRequest;
  v5 = -[AMSBadgeRequest init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("actionMetricsEvent"));
    v7 = objc_claimAutoreleasedReturnValue();
    actionMetricsEvent = v5->_actionMetricsEvent;
    v5->_actionMetricsEvent = (NSDictionary *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("badgeIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    badgeIdentifier = v5->_badgeIdentifier;
    v5->_badgeIdentifier = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("metrics"));
    v14 = objc_claimAutoreleasedReturnValue();
    metrics = v5->_metrics;
    v5->_metrics = (NSDictionary *)v14;

    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)actionMetricsEvent
{
  return self->_actionMetricsEvent;
}

- (NSString)badgeIdentifier
{
  return self->_badgeIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_badgeIdentifier, 0);
  objc_storeStrong((id *)&self->_actionMetricsEvent, 0);
}

@end
