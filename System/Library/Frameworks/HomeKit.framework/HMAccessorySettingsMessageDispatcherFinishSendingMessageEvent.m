@implementation HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent

- (HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent)initWithMessageName:(id)a3
{
  id v5;
  void *v6;
  HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent *v7;
  HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent *v8;
  HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent;
    v7 = -[HMCoreAnalyticsMetricEvent initWithName:](&v12, sel_initWithName_, CFSTR("com.apple.HomeKit.HMAccessorySettingsMetricsDispatcher.MessageDispatcher.FinishSendingMessageEvent"));
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_messageName, a3);

    return v8;
  }
  else
  {
    v10 = (HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent *)_HMFPreconditionFailure();
    return (HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent *)-[HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent eventPayload](v10, v11);
  }
}

- (id)eventPayload
{
  HMCoreAnalyticsStringFieldData *v3;
  void *v4;
  HMCoreAnalyticsStringFieldData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = [HMCoreAnalyticsStringFieldData alloc];
  -[HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent messageName](self, "messageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMCoreAnalyticsStringFieldData initWithName:stringValue:](v3, "initWithName:stringValue:", CFSTR("messageName"), v4);

  v13.receiver = self;
  v13.super_class = (Class)HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent;
  -[HMCoreAnalyticsTimedMetricEvent eventPayload](&v13, sel_eventPayload);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[HMCoreAnalyticsFieldData name](v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  -[HMCoreAnalyticsFieldData value](v5, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValuesForKeysWithDictionary:", v10);

  v11 = (void *)objc_msgSend(v7, "copy");
  return v11;
}

- (NSString)messageName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageName, 0);
}

@end
