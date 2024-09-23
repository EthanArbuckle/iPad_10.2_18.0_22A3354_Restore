@implementation HMDTargetControllerErrorEvent

- (HMDTargetControllerErrorEvent)initWithErrorType:(unint64_t)a3 accessory:(id)a4
{
  id v6;
  HMDTargetControllerErrorEvent *v7;
  HMDTargetControllerErrorEvent *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HMDTargetControllerErrorEvent;
  v7 = -[HMMLogEvent init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_errorType = a3;
    objc_storeWeak((id *)&v7->_accessory, v6);
  }

  return v8;
}

- (unint64_t)errorType
{
  return self->_errorType;
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
}

+ (id)errorEventWithErrorType:(unint64_t)a3 accessory:(id)a4
{
  id v5;
  HMDTargetControllerErrorEvent *v6;

  v5 = a4;
  v6 = -[HMDTargetControllerErrorEvent initWithErrorType:accessory:]([HMDTargetControllerErrorEvent alloc], "initWithErrorType:accessory:", a3, v5);

  return v6;
}

@end
