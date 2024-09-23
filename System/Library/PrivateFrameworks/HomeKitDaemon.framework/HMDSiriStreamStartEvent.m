@implementation HMDSiriStreamStartEvent

- (HMDSiriStreamStartEvent)initWithActivationType:(unint64_t)a3
{
  HMDSiriStreamStartEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDSiriStreamStartEvent;
  result = -[HMMLogEvent init](&v5, sel_init);
  if (result)
    result->_activationType = a3;
  return result;
}

- (NSString)coreAnalyticsEventName
{
  __CFString *v2;

  v2 = CFSTR("com.apple.HomeKit.daemon.siri.stream-start");
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.siri.stream-start");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("duration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("activationType");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDSiriStreamStartEvent activationType](self, "activationType"));
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

- (unint64_t)activationType
{
  return self->_activationType;
}

@end
