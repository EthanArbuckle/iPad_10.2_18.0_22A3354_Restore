@implementation HMDMessageHandlerFailureMetricEvent

- (HMDMessageHandlerFailureMetricEvent)initWithFailureType:(unint64_t)a3 messageName:(id)a4
{
  id v7;
  HMDMessageHandlerFailureMetricEvent *v8;
  HMDMessageHandlerFailureMetricEvent *v9;
  __CFString *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDMessageHandlerFailureMetricEvent;
  v8 = -[HMMLogEvent init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_messageName, a4);
    if (a3 > 2)
      v10 = CFSTR("unknown");
    else
      v10 = off_24E78A620[a3];
    objc_storeStrong((id *)&v9->_type, v10);
  }

  return v9;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.message.handler.failureEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("messageName");
  -[HMDMessageHandlerFailureMetricEvent messageName](self, "messageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("failureType");
  v8[0] = v3;
  -[HMDMessageHandlerFailureMetricEvent type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSString)messageName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
}

@end
