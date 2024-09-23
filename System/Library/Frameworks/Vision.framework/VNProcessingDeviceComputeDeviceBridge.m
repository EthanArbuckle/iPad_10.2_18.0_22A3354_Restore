@implementation VNProcessingDeviceComputeDeviceBridge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingDevice, 0);
}

- (VNProcessingDeviceComputeDeviceBridge)initWithProcessingDevice:(id)a3
{
  id v5;
  VNProcessingDeviceComputeDeviceBridge *v6;
  VNProcessingDeviceComputeDeviceBridge *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNProcessingDeviceComputeDeviceBridge;
  v6 = -[VNProcessingDeviceComputeDeviceBridge init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_processingDevice, a3);

  return v7;
}

- (MLComputeDeviceProtocol)computeDevice
{
  return (MLComputeDeviceProtocol *)-[VNProcessingDevice computeDevice](self->_processingDevice, "computeDevice");
}

- (VNProcessingDevice)processingDevice
{
  return self->_processingDevice;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNProcessingDeviceComputeDeviceBridge processingDevice](self, "processingDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNProcessingDeviceComputeDeviceBridge computeDevice](self, "computeDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ [ %@ --> %@ ]"), v5, v6, v7);

  return (NSString *)v8;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[VNProcessingDevice computeDevice](self->_processingDevice, "computeDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VNProcessingDeviceComputeDeviceBridge;
    -[VNProcessingDeviceComputeDeviceBridge forwardingTargetForSelector:](&v9, sel_forwardingTargetForSelector_, a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

@end
