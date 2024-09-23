@implementation CMScreenHandleActivation

void __CMScreenHandleActivation_block_invoke(uint64_t a1)
{
  uint64_t CStringPtrAndBufferToFree;
  const char *v3;
  const __CFAllocator *v4;
  CFAbsoluteTime Current;
  CFDateRef v6;
  __CFDictionary *PowerLogDataForStarkWiFi;
  const void *v8;
  const void *v9;
  char __str[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!cmscreenIsActivated())
  {
    if (!gCMScreen_0)
    {
      CStringPtrAndBufferToFree = FigCFStringGetCStringPtrAndBufferToFree();
      v3 = "unknown endpoint type";
      if (CStringPtrAndBufferToFree)
        v3 = (const char *)CStringPtrAndBufferToFree;
      snprintf(__str, 0x80uLL, "CMSessionManager-%s", v3);
      free(0);
      gCMScreen_0 = FigOSTransactionCreate();
    }
    cmscreenSetCurrentState(CFSTR("ScreenState_Suspended"));
    if (cmscreenEndpointIsStarkWiFi() && !sCMScreenStarkWiFiIdleSleepPreventor)
    {
      v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      Current = CFAbsoluteTimeGetCurrent();
      v6 = CFDateCreate(v4, Current);
      PowerLogDataForStarkWiFi = CMSMPowerLogCreatePowerLogDataForStarkWiFi(CFSTR("WiFiCarPlayScreenActivate"), sCMScreenStarkWiFiIdleSleepPreventor, CFSTR("com.apple.cmsession.WiFiCarPlay.IsConnected"), v6);
      CMSMSleep_CreateIdleSleepPreventor(CFSTR("com.apple.cmsession.WiFiCarPlay.IsConnected"), CFSTR("WiFiCarPlayScreen"), PowerLogDataForStarkWiFi, (IOPMAssertionID *)&sCMScreenStarkWiFiIdleSleepPreventor);
      if (v6)
        CFRelease(v6);
      if (PowerLogDataForStarkWiFi)
        CFRelease(PowerLogDataForStarkWiFi);
    }
    CMSMPowerLogPostScreenMirroringPowerLogs((const void *)*MEMORY[0x1E0C9AE50]);
  }
  v8 = *(const void **)(a1 + 32);
  if (v8)
    CFRelease(v8);
  v9 = *(const void **)(a1 + 40);
  if (v9)
    CFRelease(v9);
}

@end
