@implementation CMScreenHandleDeactivation

void __CMScreenHandleDeactivation_block_invoke(uint64_t a1)
{
  BOOL v2;
  const __CFAllocator *v3;
  CFAbsoluteTime Current;
  CFDateRef v5;
  __CFDictionary *PowerLogDataForStarkWiFi;
  const void *v7;
  const void *v8;

  cmscreenSetCurrentState(CFSTR("ScreenState_Deactivated"));
  if (cmscreenEndpointIsStarkWiFi())
    v2 = sCMScreenStarkWiFiIdleSleepPreventor == 0;
  else
    v2 = 1;
  if (!v2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Current = CFAbsoluteTimeGetCurrent();
    v5 = CFDateCreate(v3, Current);
    PowerLogDataForStarkWiFi = CMSMPowerLogCreatePowerLogDataForStarkWiFi(CFSTR("WiFiCarPlayScreenDeactivate"), sCMScreenStarkWiFiIdleSleepPreventor, CFSTR("com.apple.cmsession.WiFiCarPlay.IsConnected"), v5);
    CMSMSleep_ReleaseIdleSleepPreventor(sCMScreenStarkWiFiIdleSleepPreventor, CFSTR("WiFiCarPlayScreen"), PowerLogDataForStarkWiFi);
    sCMScreenStarkWiFiIdleSleepPreventor = 0;
    if (v5)
      CFRelease(v5);
    if (PowerLogDataForStarkWiFi)
      CFRelease(PowerLogDataForStarkWiFi);
  }
  CMSMPowerLogPostScreenMirroringPowerLogs((const void *)*MEMORY[0x1E0C9AE40]);
  if (gCMScreen_0)
  {

    gCMScreen_0 = 0;
  }
  v7 = *(const void **)(a1 + 32);
  if (v7)
    CFRelease(v7);
  v8 = *(const void **)(a1 + 40);
  if (v8)
    CFRelease(v8);
}

@end
