@implementation APSHasUDPMirroringSenderSupport

uint64_t __APSHasUDPMirroringSenderSupport_block_invoke()
{
  int v0;
  uint64_t result;
  uint64_t v2;
  char __s1[64];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (APSIsAPMSpeaker_sCheckOnce != -1)
    dispatch_once(&APSIsAPMSpeaker_sCheckOnce, &__block_literal_global_9);
  if (!APSIsAPMSpeaker_sIsAPMSpeaker && !IsAppleTV())
  {
    GetDeviceModelString();
    v2 = 0;
    while (strncmp(__s1, gLogCategory_APSSystemUtils_block_invoke_unsupportedModels[v2], 0x40uLL))
    {
      if (++v2 == 27)
      {
        v0 = 1;
        goto LABEL_6;
      }
    }
  }
  v0 = 0;
LABEL_6:
  result = FigGetCFPreferenceNumberWithDefault();
  APSHasUDPMirroringSenderSupport_sIsSupported = (_DWORD)result != 0;
  if (v0 != ((_DWORD)result != 0) && gLogCategory_APSSystemUtils <= 50)
  {
    if (gLogCategory_APSSystemUtils != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

@end
