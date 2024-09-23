@implementation HMCoreAnalyticsMetricEvent

- (HMCoreAnalyticsMetricEvent)initWithName:(id)a3
{
  id v5;
  void *v6;
  HMCoreAnalyticsMetricEvent *v7;
  HMCoreAnalyticsMetricEvent *v8;
  HMCoreAnalyticsMetricEvent *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMCoreAnalyticsMetricEvent;
    v7 = -[HMCoreAnalyticsMetricEvent init](&v12, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_name, a3);

    return v8;
  }
  else
  {
    v10 = (HMCoreAnalyticsMetricEvent *)_HMFPreconditionFailure();
    return (HMCoreAnalyticsMetricEvent *)-[HMCoreAnalyticsMetricEvent eventPayload](v10, v11);
  }
}

- (id)eventPayload
{
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  HMCoreAnalyticsStringFieldData *v9;
  HMCoreAnalyticsIntegerFieldData *v10;
  HMCoreAnalyticsStringFieldData *v11;
  void *v12;
  HMCoreAnalyticsFieldData *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0D28688], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationIdentifier");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v6 = CFSTR("unknown");
  if (v4)
    v6 = v4;
  v7 = v6;

  -[HMCoreAnalyticsMetricEvent error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMCoreAnalyticsStringFieldData initWithName:stringValue:]([HMCoreAnalyticsStringFieldData alloc], "initWithName:stringValue:", CFSTR("bundleIdentifier"), v7);

  if (v8)
  {
    v10 = -[HMCoreAnalyticsIntegerFieldData initWithName:integerValue:]([HMCoreAnalyticsIntegerFieldData alloc], "initWithName:integerValue:", CFSTR("eventErrorCode"), objc_msgSend(v8, "code", v8));
    v11 = [HMCoreAnalyticsStringFieldData alloc];
    objc_msgSend(v8, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMCoreAnalyticsStringFieldData initWithName:stringValue:](v11, "initWithName:stringValue:", CFSTR("eventErrorDomain"), v12);

  }
  else
  {
    v10 = -[HMCoreAnalyticsFieldData initWithName:]([HMCoreAnalyticsFieldData alloc], "initWithName:", CFSTR("eventErrorCode"), 0);
    v13 = -[HMCoreAnalyticsFieldData initWithName:]([HMCoreAnalyticsFieldData alloc], "initWithName:", CFSTR("eventErrorDomain"));
  }
  -[HMCoreAnalyticsFieldData name](v10, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  -[HMCoreAnalyticsFieldData value](v10, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  -[HMCoreAnalyticsFieldData name](v13, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v16;
  -[HMCoreAnalyticsFieldData value](v13, "value");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v17;
  -[HMCoreAnalyticsFieldData name](v9, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v18;
  -[HMCoreAnalyticsFieldData value](v9, "value");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
