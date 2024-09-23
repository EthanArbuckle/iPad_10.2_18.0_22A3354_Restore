@implementation HMDTargetControllerCommandEvent

- (HMDTargetControllerCommandEvent)initWithCommandType:(unint64_t)a3 accessory:(id)a4
{
  id v6;
  HMDTargetControllerCommandEvent *v7;
  HMDTargetControllerCommandEvent *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HMDTargetControllerCommandEvent;
  v7 = -[HMMLogEvent init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_commandType = a3;
    objc_storeWeak((id *)&v7->_accessory, v6);
  }

  return v8;
}

- (unint64_t)commandType
{
  return self->_commandType;
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
}

+ (id)commandEventWithCommandType:(unint64_t)a3 accessory:(id)a4
{
  id v5;
  HMDTargetControllerCommandEvent *v6;

  v5 = a4;
  v6 = -[HMDTargetControllerCommandEvent initWithCommandType:accessory:]([HMDTargetControllerCommandEvent alloc], "initWithCommandType:accessory:", a3, v5);

  return v6;
}

@end
