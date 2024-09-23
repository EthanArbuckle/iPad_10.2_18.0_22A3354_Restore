@implementation DKPlatform

void __25___DKPlatform_deviceUUID__block_invoke()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  uint64_t v4;
  void *v5;
  id CFProperty;

  v0 = *MEMORY[0x1E0CBBAB8];
  v1 = IOServiceMatching("IOPlatformExpertDevice");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    v3 = MatchingService;
    CFProperty = (id)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("IOPlatformUUID"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    IOObjectRelease(v3);
    if (CFProperty)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFProperty);
      v5 = (void *)deviceUUID_deviceUUID_0;
      deviceUUID_deviceUUID_0 = v4;

    }
  }
}

@end
