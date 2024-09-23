@implementation CRDeviceHardwareIdentifierForDevice

void __CRDeviceHardwareIdentifierForDevice_block_invoke()
{
  uint64_t v0;
  void *v1;
  size_t v2;
  _OWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memset(v3, 0, sizeof(v3));
  v2 = 32;
  sysctlbyname("hw.targettype", v3, &v2, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CRDeviceHardwareIdentifierForDevice_hardwareIdentifier;
  CRDeviceHardwareIdentifierForDevice_hardwareIdentifier = v0;

}

@end
