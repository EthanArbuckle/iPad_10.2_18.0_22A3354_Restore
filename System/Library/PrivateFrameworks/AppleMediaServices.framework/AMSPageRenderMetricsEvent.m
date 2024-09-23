@implementation AMSPageRenderMetricsEvent

- (AMSPageRenderMetricsEvent)init
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] init", buf, 0x16u);

  }
  v8.receiver = self;
  v8.super_class = (Class)AMSPageRenderMetricsEvent;
  return -[AMSMetricsEvent initWithTopic:](&v8, sel_initWithTopic_, CFSTR("xp_ase_ams_perf"));
}

- (NSNumber)pageAppearTime
{
  return (NSNumber *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageAppearTime"));
}

- (NSNumber)pageEndTime
{
  return (NSNumber *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageEndTime"));
}

- (NSString)pageId
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageId"));
}

- (NSNumber)pageInterruptTime
{
  return (NSNumber *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageInterruptTime"));
}

- (NSNumber)pageReappearTime
{
  return (NSNumber *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageReappearTime"));
}

- (NSNumber)pageRequestTime
{
  return (NSNumber *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageRequestTime"));
}

- (NSString)pageType
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageType"));
}

- (NSNumber)pageUserInteractiveTime
{
  return (NSNumber *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageUserInteractiveTime"));
}

- (NSString)pageUrl
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageUrl"));
}

- (NSString)placement
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("placement"));
}

- (NSNumber)resourceRequestEndTime
{
  return (NSNumber *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("resourceRequestEndTime"));
}

- (NSNumber)resourceRequestStartTime
{
  return (NSNumber *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("resourceRequestStartTime"));
}

- (void)setPageAppearTime:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("pageAppearTime"));
}

- (void)setPageEndTime:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("pageEndTime"));
}

- (void)setPageId:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("pageId"));
}

- (void)setPageInterruptTime:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("pageInterruptTime"));
}

- (void)setPageReappearTime:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("pageReappearTime"));
}

- (void)setPageRequestTime:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("pageRequestTime"));
}

- (void)setPageType:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("pageType"));
}

- (void)setPageUserInteractiveTime:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("pageUserInteractiveTime"));
}

- (void)setPageUrl:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("pageUrl"));
}

- (void)setPlacement:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("placement"));
}

- (void)setResourceRequestEndTime:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("resourceRequestEndTime"));
}

- (void)setResourceRequestStartTime:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("resourceRequestStartTime"));
}

@end
