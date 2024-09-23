@implementation HMDMediaDestinationControllerReceivedUpdateDestinationRequestMessageLogEvent

- (HMDMediaDestinationControllerReceivedUpdateDestinationRequestMessageLogEvent)initWithExistingDestinationType:(id)a3 destinationType:(id)a4 isTriggeredOnControllerDevice:(id)a5 userPrivilege:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDMediaDestinationControllerReceivedUpdateDestinationRequestMessageLogEvent;
  return -[HMDMediaDestinationControllerDestinationLogEvent initWithExistingDestinationType:destinationType:isTriggeredOnControllerDevice:userPrivilege:](&v7, sel_initWithExistingDestinationType_destinationType_isTriggeredOnControllerDevice_userPrivilege_, a3, a4, a5, a6);
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.media.destination.controller.receivedUpdateDestinationRequestMessage");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("existingMediaDestinationType");
  -[HMDMediaDestinationControllerDestinationLogEvent existingDestinationType](self, "existingDestinationType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("mediaDestinationType");
  -[HMDMediaDestinationControllerDestinationLogEvent destinationType](self, "destinationType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("isTriggeredOnControllerDevice");
  -[HMDMediaDestinationControllerLogEvent isTriggeredOnControllerDevice](self, "isTriggeredOnControllerDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("userPrivilege");
  -[HMDMediaDestinationControllerLogEvent userPrivilege](self, "userPrivilege");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

@end
