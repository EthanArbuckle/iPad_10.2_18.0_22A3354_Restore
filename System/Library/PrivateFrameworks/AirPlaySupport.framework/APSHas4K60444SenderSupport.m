@implementation APSHas4K60444SenderSupport

uint64_t __APSHas4K60444SenderSupport_block_invoke()
{
  uint64_t result;

  result = APSSettingsGetIntWithOverrideAndDefault(CFSTR("senderSupports4k60444"), 0, 0);
  APSHas4K60444SenderSupport_sIsSupported = (_DWORD)result != 0;
  if ((_DWORD)result)
  {
    if (gLogCategory_APSSystemUtils <= 50)
    {
      if (gLogCategory_APSSystemUtils != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  return result;
}

@end
