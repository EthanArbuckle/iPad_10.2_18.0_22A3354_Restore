@implementation CMPhotoMSRSupportsHDR

uint64_t __CMPhotoMSRSupportsHDR_block_invoke()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  uint64_t result;
  io_object_t v3;
  const __CFDictionary *v4;
  int v5;

  v0 = *MEMORY[0x1E0CBBAA8];
  v1 = IOServiceMatching("AppleM2ScalerCSCDriver");
  result = IOServiceGetMatchingService(v0, v1);
  if ((_DWORD)result)
  {
    v3 = result;
    v5 = 0;
    v4 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(result, "IOService", CFSTR("IOSurfaceAcceleratorCapabilitiesDict"), 0, 0);
    if (CMPhotoCFDictionaryGetIntIfPresent(v4, CFSTR("IOSurfaceAcceleratorCapabilitiesHDR"), &v5))
      CMPhotoMSRSupportsHDR_sHDRSupported = v5 != 0;
    if (v4)
      CFRelease(v4);
    return IOObjectRelease(v3);
  }
  return result;
}

@end
