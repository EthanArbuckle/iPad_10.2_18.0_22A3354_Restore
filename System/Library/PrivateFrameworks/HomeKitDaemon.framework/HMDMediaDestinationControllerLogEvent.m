@implementation HMDMediaDestinationControllerLogEvent

- (HMDMediaDestinationControllerLogEvent)initWithIsTriggeredOnControllerDevice:(id)a3 userPrivilege:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDMediaDestinationControllerLogEvent *v10;
  HMDMediaDestinationControllerLogEvent *v11;
  HMDMediaDestinationControllerLogEvent *v13;
  SEL v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMDMediaDestinationControllerLogEvent *)_HMFPreconditionFailure();
    return (HMDMediaDestinationControllerLogEvent *)-[HMDMediaDestinationControllerLogEvent isTriggeredOnControllerDevice](v13, v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)HMDMediaDestinationControllerLogEvent;
  v10 = -[HMMLogEvent init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_isTriggeredOnControllerDevice, a3);
    objc_storeStrong((id *)&v11->_userPrivilege, a4);
  }

  return v11;
}

- (NSString)isTriggeredOnControllerDevice
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)userPrivilege
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPrivilege, 0);
  objc_storeStrong((id *)&self->_isTriggeredOnControllerDevice, 0);
}

@end
