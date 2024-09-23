@implementation APSIsAPValeriaScreenSender

uint64_t __APSIsAPValeriaScreenSender_block_invoke()
{
  _BOOL4 v0;
  uint64_t result;

  v0 = IsAppleTV() != 0;
  result = FigGetCFPreferenceNumberWithDefault();
  APSIsAPValeriaScreenSender_result = (_DWORD)result != 0;
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
