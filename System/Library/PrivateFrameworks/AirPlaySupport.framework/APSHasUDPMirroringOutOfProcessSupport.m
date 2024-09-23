@implementation APSHasUDPMirroringOutOfProcessSupport

uint64_t __APSHasUDPMirroringOutOfProcessSupport_block_invoke()
{
  int IsFeatureEnabledInDomain;
  uint64_t result;

  IsFeatureEnabledInDomain = APSSettingsIsFeatureEnabledInDomain();
  result = FigGetCFPreferenceNumberWithDefault();
  APSHasUDPMirroringOutOfProcessSupport_sIsSupported = (_DWORD)result != 0;
  if (IsFeatureEnabledInDomain != ((_DWORD)result != 0) && gLogCategory_APSSystemUtils <= 50)
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
