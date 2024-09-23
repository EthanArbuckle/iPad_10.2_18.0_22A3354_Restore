@implementation HMDProcessMemoryPressureNotificationLogEvent

- (HMDProcessMemoryPressureNotificationLogEvent)initWithProcessMemoryState:(id)a3 dataSyncState:(id)a4
{
  id v7;
  id v8;
  HMDProcessMemoryPressureNotificationLogEvent *v9;
  HMDProcessMemoryPressureNotificationLogEvent *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDProcessMemoryPressureNotificationLogEvent;
  v9 = -[HMMLogEvent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_processMemoryState, a3);
    objc_storeStrong((id *)&v10->_dataSyncState, a4);
  }

  return v10;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.MemoryPressureNotificationEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("processMemoryState");
  -[HMDProcessMemoryPressureNotificationLogEvent processMemoryState](self, "processMemoryState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[HMDProcessMemoryPressureNotificationLogEvent processMemoryState](self, "processMemoryState");
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("dataSyncState");
  v10[0] = v4;
  -[HMDProcessMemoryPressureNotificationLogEvent dataSyncState](self, "dataSyncState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[HMDProcessMemoryPressureNotificationLogEvent dataSyncState](self, "dataSyncState");
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSString)processMemoryState
{
  return self->_processMemoryState;
}

- (NSString)dataSyncState
{
  return self->_dataSyncState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSyncState, 0);
  objc_storeStrong((id *)&self->_processMemoryState, 0);
}

+ (id)createEventWithProcessMemoryState:(id)a3 dataSyncState:(id)a4
{
  id v5;
  id v6;
  HMDProcessMemoryPressureNotificationLogEvent *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMDProcessMemoryPressureNotificationLogEvent initWithProcessMemoryState:dataSyncState:]([HMDProcessMemoryPressureNotificationLogEvent alloc], "initWithProcessMemoryState:dataSyncState:", v6, v5);

  return v7;
}

@end
