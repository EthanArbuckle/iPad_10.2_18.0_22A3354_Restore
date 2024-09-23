@implementation APSHasHDRSenderSupport

void __APSHasHDRSenderSupport_block_invoke()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  CFTypeRef v4;
  const void *v5;

  if (FVDUtilsHEVCEncoderSupports42010())
  {
    if (APSIsAPMSpeaker_sCheckOnce != -1)
      dispatch_once(&APSIsAPMSpeaker_sCheckOnce, &__block_literal_global_9);
    if (!APSIsAPMSpeaker_sIsAPMSpeaker && !IsAppleTV())
    {
      v0 = *MEMORY[0x1E0CBBAA8];
      v1 = IOServiceMatching("AppleM2ScalerCSCDriver");
      MatchingService = IOServiceGetMatchingService(v0, v1);
      if (MatchingService)
      {
        v3 = MatchingService;
        v4 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("IOSurfaceAcceleratorCapabilitiesDict"), 0, 0);
        if (v4)
        {
          v5 = v4;
          APSHasHDRSenderSupport_supported = CFDictionaryGetInt64() != 0;
          if (gLogCategory_APSSystemUtils <= 50
            && (gLogCategory_APSSystemUtils != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          CFRelease(v5);
        }
        IOObjectRelease(v3);
      }
    }
  }
}

@end
