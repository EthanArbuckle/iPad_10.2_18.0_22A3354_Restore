@implementation GCGenericDeviceModel

GCHapticActuator *__76__GCGenericDeviceModel_DeviceDelegate__physicalDeviceGetHapticCapabilities___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  GCHapticActuator *v5;
  void *v6;
  GCHapticActuator *v7;

  v4 = a2;
  v5 = [GCHapticActuator alloc];
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[GCHapticActuator initWithLabel:type:index:](v5, "initWithLabel:type:index:", v6, 0, a3);
  return v7;
}

@end
