@implementation HMAccessorySettingsMessageDispatcherStartSendingMessageEvent

- (HMAccessorySettingsMessageDispatcherStartSendingMessageEvent)initWithMessageName:(id)a3 updateKeyPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMAccessorySettingsMessageDispatcherStartSendingMessageEvent *v10;
  HMAccessorySettingsMessageDispatcherStartSendingMessageEvent *v11;
  uint64_t v12;
  NSString *updateKeyPath;
  HMAccessorySettingsMessageDispatcherStartSendingMessageEvent *v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = v8;
    v17.receiver = self;
    v17.super_class = (Class)HMAccessorySettingsMessageDispatcherStartSendingMessageEvent;
    v10 = -[HMCoreAnalyticsMetricEvent initWithName:](&v17, sel_initWithName_, CFSTR("com.apple.HomeKit.HMAccessorySettingsMetricsDispatcher.MessageDispatcher.StartSendingMessageEvent"));
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_messageName, a3);
      v12 = objc_msgSend(v9, "copy");
      updateKeyPath = v11->_updateKeyPath;
      v11->_updateKeyPath = (NSString *)v12;

    }
    return v11;
  }
  else
  {
    v15 = (HMAccessorySettingsMessageDispatcherStartSendingMessageEvent *)_HMFPreconditionFailure();
    return (HMAccessorySettingsMessageDispatcherStartSendingMessageEvent *)-[HMAccessorySettingsMessageDispatcherStartSendingMessageEvent eventPayload](v15, v16);
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
  void *v12;
  objc_super v14;

  v3 = [HMCoreAnalyticsStringFieldData alloc];
  -[HMAccessorySettingsMessageDispatcherStartSendingMessageEvent messageName](self, "messageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMCoreAnalyticsStringFieldData initWithName:stringValue:](v3, "initWithName:stringValue:", CFSTR("messageName"), v4);

  v14.receiver = self;
  v14.super_class = (Class)HMAccessorySettingsMessageDispatcherStartSendingMessageEvent;
  -[HMCoreAnalyticsMetricEvent eventPayload](&v14, sel_eventPayload);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[HMCoreAnalyticsFieldData value](v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCoreAnalyticsFieldData name](v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v9);

  -[HMAccessorySettingsMessageDispatcherStartSendingMessageEvent updateKeyPath](self, "updateKeyPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMAccessorySettingsMessageDispatcherStartSendingMessageEvent updateKeyPath](self, "updateKeyPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("updateKeyPath"));

  }
  v12 = (void *)objc_msgSend(v7, "copy");

  return v12;
}

- (NSString)messageName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)updateKeyPath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateKeyPath, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
}

@end
