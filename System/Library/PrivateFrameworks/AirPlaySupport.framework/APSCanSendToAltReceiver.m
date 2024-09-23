@implementation APSCanSendToAltReceiver

uint64_t __APSCanSendToAltReceiver_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = IsAppleInternalBuild();
  if ((_DWORD)result)
  {
    v1 = 0;
    result = APSSettingsGetInt64IfPresent(CFSTR("canSendToAltReceiver"), &v1);
    if ((_DWORD)result)
      APSCanSendToAltReceiver_sCanSendToAltReceiver = v1 != 0;
  }
  if (gLogCategory_APSSystemUtils <= 50)
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
