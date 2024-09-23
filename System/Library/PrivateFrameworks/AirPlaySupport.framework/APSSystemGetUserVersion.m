@implementation APSSystemGetUserVersion

uint64_t __APSSystemGetUserVersion_block_invoke()
{
  uint64_t result;

  result = FigGetCFPreferenceNumberWithDefault();
  APSSystemGetUserVersion_prefsUserVersion = result;
  if (result <= 2 && gLogCategory_APSSystemUtils <= 50)
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
