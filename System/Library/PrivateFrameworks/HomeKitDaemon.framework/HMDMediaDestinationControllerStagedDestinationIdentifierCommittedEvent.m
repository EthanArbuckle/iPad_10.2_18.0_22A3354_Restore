@implementation HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent

- (HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent)initWithStagedDestinationIdentifier:(id)a3 isTriggeredOnControllerDevice:(id)a4 userPrivilege:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent *v13;
  HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent *v14;
  HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent *v16;
  SEL v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v12 = v11;
    v18.receiver = self;
    v18.super_class = (Class)HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent;
    v13 = -[HMDMediaDestinationControllerLogEvent initWithIsTriggeredOnControllerDevice:userPrivilege:](&v18, sel_initWithIsTriggeredOnControllerDevice_userPrivilege_, v10, v11);
    v14 = v13;
    if (v13)
      objc_storeStrong((id *)&v13->_stagedDestinationIdentifier, a3);

    return v14;
  }
  else
  {
    v16 = (HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent *)_HMFPreconditionFailure();
    return (HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent *)-[HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent coreAnalyticsEventName](v16, v17);
  }
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.media.destination.controller.stagedDestinationIdentifierCommitted");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("duration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", ceil((double)-[HMMLogEvent durationMilliseconds](self, "durationMilliseconds") / 1000.0 / 0.1) * 0.1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("isTriggeredOnControllerDevice");
  -[HMDMediaDestinationControllerLogEvent isTriggeredOnControllerDevice](self, "isTriggeredOnControllerDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("userPrivilege");
  -[HMDMediaDestinationControllerLogEvent userPrivilege](self, "userPrivilege");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSUUID)stagedDestinationIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedDestinationIdentifier, 0);
}

@end
