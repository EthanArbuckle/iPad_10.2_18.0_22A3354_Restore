@implementation HMDUserDataZoneControllerShareLogEvent

- (HMDUserDataZoneControllerShareLogEvent)initWithResult:(unint64_t)a3 didAccept:(BOOL)a4
{
  HMDUserDataZoneControllerShareLogEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDUserDataZoneControllerShareLogEvent;
  result = -[HMMLogEvent init](&v7, sel_init);
  if (result)
  {
    result->_result = a3;
    result->_didAccept = a4;
  }
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.UserDataZoneShare");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserDataZoneControllerShareLogEvent result](self, "result"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("didAccept");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUserDataZoneControllerShareLogEvent didAccept](self, "didAccept"));
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

- (unint64_t)result
{
  return self->_result;
}

- (BOOL)didAccept
{
  return self->_didAccept;
}

@end
