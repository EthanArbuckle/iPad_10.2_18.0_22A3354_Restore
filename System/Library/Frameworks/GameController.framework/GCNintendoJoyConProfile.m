@implementation GCNintendoJoyConProfile

void __41___GCNintendoJoyConProfile_deviceManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)deviceManager_deviceManager;
  deviceManager_deviceManager = v0;

}

void __63___GCNintendoJoyConProfile_physicalDevice_getBatteryWithReply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  GCDeviceBattery *v4;

  v4 = -[GCDeviceBattery initWithLevel:isCharging:]([GCDeviceBattery alloc], "initWithLevel:isCharging:", a2, a3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
