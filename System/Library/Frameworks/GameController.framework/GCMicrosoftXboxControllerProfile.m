@implementation GCMicrosoftXboxControllerProfile

void __50___GCMicrosoftXboxControllerProfile_deviceManager__block_invoke(uint64_t a1)
{
  _GCDefaultDeviceManager *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _GCDevicePIDVIDMatchingFilter *v6;

  v6 = -[_GCDevicePIDVIDMatchingFilter initWithVendorID:productIDs:]([_GCDevicePIDVIDMatchingFilter alloc], "initWithVendorID:productIDs:", &unk_24D30DF78, &unk_24D30FA88);
  v2 = [_GCDefaultDeviceManager alloc];
  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_GCDefaultDeviceManager initWithIdentifier:matchingFilter:probeScore:](v2, "initWithIdentifier:matchingFilter:probeScore:", v3, v6, *MEMORY[0x24BE3A690]);
  v5 = (void *)deviceManager_deviceManager_2;
  deviceManager_deviceManager_2 = v4;

  objc_msgSend((id)deviceManager_deviceManager_2, "setDelegate:", *(_QWORD *)(a1 + 32));
}

void __72___GCMicrosoftXboxControllerProfile_physicalDevice_getBatteryWithReply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  GCDeviceBattery *v4;

  v4 = -[GCDeviceBattery initWithLevel:isCharging:]([GCDeviceBattery alloc], "initWithLevel:isCharging:", a2, a3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
