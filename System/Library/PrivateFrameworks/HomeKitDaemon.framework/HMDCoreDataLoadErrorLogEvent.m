@implementation HMDCoreDataLoadErrorLogEvent

- (HMDCoreDataLoadErrorLogEvent)initWithReason:(unint64_t)a3
{
  HMDCoreDataLoadErrorLogEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDCoreDataLoadErrorLogEvent;
  result = -[HMMLogEvent init](&v5, sel_init);
  if (result)
    result->_reason = a3;
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HMDCoreDataLoadErrorLogEvent - action: %lu"), -[HMDCoreDataLoadErrorLogEvent reason](self, "reason"));
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.coredata.persistentStore.load");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDCoreDataLoadErrorLogEvent reason](self, "reason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("action"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v5;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (unint64_t)reason
{
  return self->_reason;
}

@end
