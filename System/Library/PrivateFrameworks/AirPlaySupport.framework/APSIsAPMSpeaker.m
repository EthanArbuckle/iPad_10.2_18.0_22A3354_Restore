@implementation APSIsAPMSpeaker

uint64_t __APSIsAPMSpeaker_block_invoke()
{
  int v0;
  uint64_t result;

  v0 = MGGetSInt32Answer();
  if (gLogCategory_APSSystemUtils <= 50
    && (gLogCategory_APSSystemUtils != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  result = FigGetCFPreferenceNumberWithDefault();
  APSIsAPMSpeaker_sIsAPMSpeaker = (_DWORD)result != 0;
  if ((v0 == 7) != ((_DWORD)result != 0) && gLogCategory_APSSystemUtils <= 50)
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
