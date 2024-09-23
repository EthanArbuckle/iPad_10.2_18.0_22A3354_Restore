@implementation AMSPaymentSheetPerformanceMetrics

- (AMSPaymentSheetPerformanceMetrics)initWithBag:(id)a3
{
  id v5;
  AMSPaymentSheetPerformanceMetrics *v6;
  AMSPaymentSheetPerformanceMetrics *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSPaymentSheetPerformanceMetrics;
  v6 = -[AMSPaymentSheetPerformanceMetrics init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bag, a3);

  return v7;
}

- (void)enqueueMetricsEventWithOverlay:(id)a3
{
  id v4;
  AMSMetricsEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[AMSMetricsEvent initWithTopic:]([AMSMetricsEvent alloc], "initWithTopic:", &stru_1E2548760);
  -[AMSMetricsEvent setEventType:](v5, "setEventType:", CFSTR("pageRender"));
  -[AMSMetricsEvent setEventVersion:](v5, "setEventVersion:", &unk_1E25AF890);
  -[AMSPaymentSheetPerformanceMetrics primaryDataResponseStartTime](self, "primaryDataResponseStartTime");
  +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](v5, "setProperty:forBodyKey:", v6, CFSTR("primaryDataParseStartTime"));

  -[AMSPaymentSheetPerformanceMetrics primaryDataResponseEndTime](self, "primaryDataResponseEndTime");
  +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](v5, "setProperty:forBodyKey:", v7, CFSTR("primaryDataParseEndTime"));

  -[AMSPaymentSheetPerformanceMetrics resourceRequestStartTime](self, "resourceRequestStartTime");
  +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](v5, "setProperty:forBodyKey:", v8, CFSTR("resourceRequestStartTime"));

  -[AMSPaymentSheetPerformanceMetrics resourceRequestEndTime](self, "resourceRequestEndTime");
  +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](v5, "setProperty:forBodyKey:", v9, CFSTR("resourceRequestEndTime"));

  -[AMSPaymentSheetPerformanceMetrics primaryDataResponseStartTime](self, "primaryDataResponseStartTime");
  +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](v5, "setProperty:forBodyKey:", v10, CFSTR("primaryDataResponseStartTime"));

  -[AMSPaymentSheetPerformanceMetrics primaryDataResponseEndTime](self, "primaryDataResponseEndTime");
  +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](v5, "setProperty:forBodyKey:", v11, CFSTR("primaryDataResponseEndTime"));

  -[AMSMetricsEvent addPropertiesWithDictionary:](v5, "addPropertiesWithDictionary:", v4);
  -[AMSMetricsEvent topic](v5, "topic");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543362;
      v19 = objc_opt_class();
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Logging Payment Sheet Performance Metrics", (uint8_t *)&v18, 0xCu);
    }

    -[AMSPaymentSheetPerformanceMetrics bag](self, "bag");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "enqueueEvent:", v5);

  }
}

- (double)primaryDataResponseStartTime
{
  return self->_primaryDataResponseStartTime;
}

- (void)setPrimaryDataResponseStartTime:(double)a3
{
  self->_primaryDataResponseStartTime = a3;
}

- (double)primaryDataResponseEndTime
{
  return self->_primaryDataResponseEndTime;
}

- (void)setPrimaryDataResponseEndTime:(double)a3
{
  self->_primaryDataResponseEndTime = a3;
}

- (double)primaryDataParseStartTime
{
  return self->_primaryDataParseStartTime;
}

- (void)setPrimaryDataParseStartTime:(double)a3
{
  self->_primaryDataParseStartTime = a3;
}

- (double)primaryDataParseEndTime
{
  return self->_primaryDataParseEndTime;
}

- (void)setPrimaryDataParseEndTime:(double)a3
{
  self->_primaryDataParseEndTime = a3;
}

- (double)resourceRequestStartTime
{
  return self->_resourceRequestStartTime;
}

- (void)setResourceRequestStartTime:(double)a3
{
  self->_resourceRequestStartTime = a3;
}

- (double)resourceRequestEndTime
{
  return self->_resourceRequestEndTime;
}

- (void)setResourceRequestEndTime:(double)a3
{
  self->_resourceRequestEndTime = a3;
}

- (AMSBag)bag
{
  return self->_bag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
