@implementation RegisterForDeviceIsChargingNotification

void __cmsmdevicestate_RegisterForDeviceIsChargingNotification_block_invoke(uint64_t a1)
{
  mach_port_t v2;
  IONotificationPort *v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  CFTypeRef CFProperty;

  v2 = *MEMORY[0x1E0CBBAA8];
  v3 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
  qword_1EE2B2A18 = (uint64_t)v3;
  if (v3)
  {
    IONotificationPortSetDispatchQueue(v3, *(dispatch_queue_t *)(a1 + 32));
    v4 = IOServiceMatching("IOPMPowerSource");
    MatchingService = IOServiceGetMatchingService(v2, v4);
    if (!IOServiceAddInterestNotification((IONotificationPortRef)qword_1EE2B2A18, MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)cmsmdeviceState_BatteryStateChanged, 0, &dword_1EE2B2A14))
    {
      CFProperty = IORegistryEntryCreateCFProperty(MatchingService, CFSTR("ExternalConnected"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      byte_1EE2B2A10 = FigCFEqual();
      if (CFProperty)
        CFRelease(CFProperty);
    }
  }
}

@end
