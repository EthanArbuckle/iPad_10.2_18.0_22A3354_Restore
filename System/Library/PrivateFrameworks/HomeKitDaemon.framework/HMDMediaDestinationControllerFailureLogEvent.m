@implementation HMDMediaDestinationControllerFailureLogEvent

- (HMDMediaDestinationControllerFailureLogEvent)initWithDestinationControllerErrorCode:(id)a3 errorCode:(id)a4 errorDomain:(id)a5 isTriggeredOnControllerDevice:(id)a6 userPrivilege:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  HMDMediaDestinationControllerFailureLogEvent *v19;
  HMDMediaDestinationControllerFailureLogEvent *v20;
  HMDMediaDestinationControllerFailureLogEvent *v22;
  SEL v23;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v14)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v15)
  {
LABEL_9:
    v22 = (HMDMediaDestinationControllerFailureLogEvent *)_HMFPreconditionFailure();
    return (HMDMediaDestinationControllerFailureLogEvent *)-[HMDMediaDestinationControllerFailureLogEvent coreAnalyticsEventName](v22, v23);
  }
  v18 = v17;
  v24.receiver = self;
  v24.super_class = (Class)HMDMediaDestinationControllerFailureLogEvent;
  v19 = -[HMDMediaDestinationControllerLogEvent initWithIsTriggeredOnControllerDevice:userPrivilege:](&v24, sel_initWithIsTriggeredOnControllerDevice_userPrivilege_, v16, v17);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_destinationControllerErrorCode, a3);
    objc_storeStrong((id *)&v20->_errorCode, a4);
    objc_storeStrong((id *)&v20->_errorDomain, a5);
  }

  return v20;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.media.destination.controller.updateDestinationFailed");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("isTriggeredOnControllerDevice");
  -[HMDMediaDestinationControllerLogEvent isTriggeredOnControllerDevice](self, "isTriggeredOnControllerDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("destinationControllerErrorCode");
  -[HMDMediaDestinationControllerFailureLogEvent destinationControllerErrorCode](self, "destinationControllerErrorCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("userPrivilege");
  -[HMDMediaDestinationControllerLogEvent userPrivilege](self, "userPrivilege");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("errorCode");
  -[HMDMediaDestinationControllerFailureLogEvent errorCode](self, "errorCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("errorDomain");
  -[HMDMediaDestinationControllerFailureLogEvent errorDomain](self, "errorDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSString)destinationControllerErrorCode
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)errorCode
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)errorDomain
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_destinationControllerErrorCode, 0);
}

@end
