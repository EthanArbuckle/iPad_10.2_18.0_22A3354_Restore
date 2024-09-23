@implementation CMScreenResumeStream

void __CMScreenResumeStream_block_invoke(_QWORD *a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const __CFAllocator *v3;
  CFAbsoluteTime Current;
  CFDateRef v5;
  __CFDictionary *PowerLogDataForStarkWiFi;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;

  if (a1[4])
  {
    if (FigCFEqual() || FigCFEqual())
    {
      if (dword_1EE2B3F38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (cmscreenEndpointIsStarkWiFi() && !sCMScreenStarkWiFiIdleSleepPreventor)
      {
        v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        Current = CFAbsoluteTimeGetCurrent();
        v5 = CFDateCreate(v3, Current);
        PowerLogDataForStarkWiFi = CMSMPowerLogCreatePowerLogDataForStarkWiFi(CFSTR("WiFiCarPlayScreenResume"), sCMScreenStarkWiFiIdleSleepPreventor, CFSTR("com.apple.cmsession.WiFiCarPlay.IsConnected"), v5);
        CMSMSleep_CreateIdleSleepPreventor(CFSTR("com.apple.cmsession.WiFiCarPlay.IsConnected"), CFSTR("WiFiCarPlayScreen"), PowerLogDataForStarkWiFi, (IOPMAssertionID *)&sCMScreenStarkWiFiIdleSleepPreventor);
        if (v5)
          CFRelease(v5);
        if (PowerLogDataForStarkWiFi)
          CFRelease(PowerLogDataForStarkWiFi);
      }
      FigEndpointStreamResume();
      cmscreenSetCurrentState(CFSTR("ScreenState_Activated"));
    }
    else
    {
      FigSignalErrorAt();
    }
  }
  v7 = (const void *)a1[4];
  if (v7)
    CFRelease(v7);
  v8 = (const void *)a1[5];
  if (v8)
    CFRelease(v8);
  v9 = (const void *)a1[6];
  if (v9)
    CFRelease(v9);
  v10 = (const void *)a1[7];
  if (v10)
    CFRelease(v10);
}

@end
