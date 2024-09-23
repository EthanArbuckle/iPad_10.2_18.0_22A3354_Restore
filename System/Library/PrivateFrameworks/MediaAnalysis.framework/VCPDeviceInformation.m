@implementation VCPDeviceInformation

+ (BOOL)canRenderVariation
{
  if (+[VCPDeviceInformation canRenderVariation]::onceToken != -1)
    dispatch_once(&+[VCPDeviceInformation canRenderVariation]::onceToken, &__block_literal_global_97);
  return +[VCPDeviceInformation canRenderVariation]::canRenderVariations;
}

void __42__VCPDeviceInformation_canRenderVariation__block_invoke()
{
  const __CFString *v0;
  const __CFString *v1;
  CFComparisonResult v2;
  id v3;

  v0 = (const __CFString *)MGGetStringAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFStringCompare(v0, CFSTR("iPad"), 0);
    CFRelease(v1);
    if (v2)
    {
      +[VCPDeviceInformation canRenderVariation]::canRenderVariations = MGGetBoolAnswer();
    }
    else
    {
      v3 = MTLCreateSystemDefaultDevice();
      +[VCPDeviceInformation canRenderVariation]::canRenderVariations = objc_msgSend(v3, "supportsFeatureSet:", 6);

    }
  }
}

+ (BOOL)isHomePod
{
  return 0;
}

+ (id)marketingName
{
  if (+[VCPDeviceInformation marketingName]::onceToken != -1)
    dispatch_once(&+[VCPDeviceInformation marketingName]::onceToken, &__block_literal_global_6);
  return (id)+[VCPDeviceInformation marketingName]::marketingName;
}

void __37__VCPDeviceInformation_marketingName__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGGetStringAnswer();
  v1 = (void *)+[VCPDeviceInformation marketingName]::marketingName;
  +[VCPDeviceInformation marketingName]::marketingName = v0;

}

+ (int64_t)batteryLevel
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  void *CFProperty;
  id v6;
  int64_t v7;

  v2 = *MEMORY[0x1E0CBBAA8];
  v3 = IOServiceMatching("IOPMPowerSource");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("CurrentCapacity"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (!CFProperty)
    return -1;
  v6 = CFProperty;
  LODWORD(v7) = objc_msgSend(v6, "intValue");
  CFRelease(v6);
  v7 = (int)v7;

  return v7;
}

@end
