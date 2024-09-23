@implementation HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent

- (HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent)initWithRemovalCount:(int64_t)a3
{
  HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent *v4;
  uint64_t v5;
  NSNumber *removalCount;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent;
  v4 = -[HMMLogEvent init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    removalCount = v4->_removalCount;
    v4->_removalCount = (NSNumber *)v5;

  }
  return v4;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("removalCount");
  -[HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent removalCount](self, "removalCount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent removalCount](self, "removalCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("removalCount"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSNumber)removalCount
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removalCount, 0);
}

@end
