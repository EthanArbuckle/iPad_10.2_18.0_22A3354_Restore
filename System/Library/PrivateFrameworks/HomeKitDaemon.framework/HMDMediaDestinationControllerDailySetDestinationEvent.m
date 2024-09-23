@implementation HMDMediaDestinationControllerDailySetDestinationEvent

- (HMDMediaDestinationControllerDailySetDestinationEvent)initWithExistingDestinationType:(id)a3
{
  id v5;
  HMDMediaDestinationControllerDailySetDestinationEvent *v6;
  HMDMediaDestinationControllerDailySetDestinationEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDMediaDestinationControllerDailySetDestinationEvent;
  v6 = -[HMMLogEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_existingDestinationType, a3);

  return v7;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.media.destination.controller.daily.setDestination");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("existingMediaDestinationType");
  -[HMDMediaDestinationControllerDailySetDestinationEvent existingDestinationType](self, "existingDestinationType");
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

- (NSString)existingDestinationType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingDestinationType, 0);
}

@end
