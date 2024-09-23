@implementation HMDMediaDestinationControllerDestinationLogEvent

- (HMDMediaDestinationControllerDestinationLogEvent)initWithExistingDestinationType:(id)a3 destinationType:(id)a4 isTriggeredOnControllerDevice:(id)a5 userPrivilege:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDMediaDestinationControllerDestinationLogEvent *v16;
  HMDMediaDestinationControllerDestinationLogEvent *v17;
  HMDMediaDestinationControllerDestinationLogEvent *v19;
  SEL v20;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v15 = v14;
  if (!v14)
  {
LABEL_11:
    v19 = (HMDMediaDestinationControllerDestinationLogEvent *)_HMFPreconditionFailure();
    return (HMDMediaDestinationControllerDestinationLogEvent *)-[HMDMediaDestinationControllerDestinationLogEvent existingDestinationType](v19, v20);
  }
  v21.receiver = self;
  v21.super_class = (Class)HMDMediaDestinationControllerDestinationLogEvent;
  v16 = -[HMDMediaDestinationControllerLogEvent initWithIsTriggeredOnControllerDevice:userPrivilege:](&v21, sel_initWithIsTriggeredOnControllerDevice_userPrivilege_, v13, v14);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_existingDestinationType, a3);
    objc_storeStrong((id *)&v17->_destinationType, a4);
  }

  return v17;
}

- (NSString)existingDestinationType
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)destinationType
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationType, 0);
  objc_storeStrong((id *)&self->_existingDestinationType, 0);
}

@end
