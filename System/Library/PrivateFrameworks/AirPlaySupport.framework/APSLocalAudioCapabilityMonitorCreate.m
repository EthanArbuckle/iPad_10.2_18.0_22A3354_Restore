@implementation APSLocalAudioCapabilityMonitorCreate

void __APSLocalAudioCapabilityMonitorCreate_block_invoke()
{
  uint64_t UsingAuxiliaryAVAudioSession;
  CFTypeRef v1;
  CFTypeRef cf;
  CFTypeRef v3;

  cf = 0;
  v3 = 0;
  v1 = 0;
  UsingAuxiliaryAVAudioSession = FigAudioSessionCreateUsingAuxiliaryAVAudioSession();
  if (!(_DWORD)UsingAuxiliaryAVAudioSession)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    UsingAuxiliaryAVAudioSession = FigNotificationCenterAddWeakListener();
    if (!(_DWORD)UsingAuxiliaryAVAudioSession)
      UsingAuxiliaryAVAudioSession = 4294948075;
  }
  APSLogErrorAt(UsingAuxiliaryAVAudioSession);
  if (cf)
    CFRelease(cf);
  if (v1)
    CFRelease(v1);
  if (v3)
    CFRelease(v3);
}

@end
