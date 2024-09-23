@implementation HMDLaunchEvent

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.launch");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("isFirstLaunchAfterBoot");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDLaunchEvent isFirstLaunchAfterBoot](self, "isFirstLaunchAfterBoot"));
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

- (HMDLaunchEvent)initWithFirstLaunchAfterBoot:(BOOL)a3
{
  HMDLaunchEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDLaunchEvent;
  result = -[HMMDatedLogEvent init](&v5, sel_init);
  if (result)
    result->_firstLaunchAfterBoot = a3;
  return result;
}

- (BOOL)isFirstLaunchAfterBoot
{
  return self->_firstLaunchAfterBoot;
}

@end
