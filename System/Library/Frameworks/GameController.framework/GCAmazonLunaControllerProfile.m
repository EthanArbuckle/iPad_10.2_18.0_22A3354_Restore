@implementation GCAmazonLunaControllerProfile

void __47___GCAmazonLunaControllerProfile_deviceManager__block_invoke(uint64_t a1)
{
  _GCDefaultDeviceManager *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _GCDevicePIDVIDMatchingFilter *v6;

  v6 = -[_GCDevicePIDVIDMatchingFilter initWithVendorID:productIDs:]([_GCDevicePIDVIDMatchingFilter alloc], "initWithVendorID:productIDs:", &unk_24D30EEC0, &unk_24D30FAD0);
  v2 = [_GCDefaultDeviceManager alloc];
  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_GCDefaultDeviceManager initWithIdentifier:matchingFilter:probeScore:](v2, "initWithIdentifier:matchingFilter:probeScore:", v3, v6, *MEMORY[0x24BE3A690]);
  v5 = (void *)deviceManager_deviceManager_4;
  deviceManager_deviceManager_4 = v4;

  objc_msgSend((id)deviceManager_deviceManager_4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

@end
