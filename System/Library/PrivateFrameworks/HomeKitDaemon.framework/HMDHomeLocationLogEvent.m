@implementation HMDHomeLocationLogEvent

- (HMDHomeLocationLogEvent)initWithDistance:(double)a3
{
  HMDHomeLocationLogEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDHomeLocationLogEvent;
  result = -[HMMLogEvent init](&v5, sel_init);
  if (result)
  {
    result->_isGreatDistance = a3 > 500.0;
    result->_homeLocationDistance = a3;
  }
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.homeLocationUpdate");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("homeLocationDistance_DOUBLE");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[HMDHomeLocationLogEvent homeLocationDistance](self, "homeLocationDistance");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("isGreatDistance_INT");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[HMDHomeLocationLogEvent isGreatDistance](self, "isGreatDistance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (double)homeLocationDistance
{
  return self->_homeLocationDistance;
}

- (int)isGreatDistance
{
  return self->_isGreatDistance;
}

+ (id)updateWithHomeDistance:(double)a3
{
  return -[HMDHomeLocationLogEvent initWithDistance:]([HMDHomeLocationLogEvent alloc], "initWithDistance:", a3);
}

@end
