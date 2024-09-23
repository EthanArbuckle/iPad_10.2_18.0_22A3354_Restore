@implementation APBrokerKeychainUtilsRemoveExpiredAuthTokens

uint64_t __APBrokerKeychainUtilsRemoveExpiredAuthTokens_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    if (gLogCategory_APBrokerKeychainUtils <= 90)
    {
      if (gLogCategory_APBrokerKeychainUtils != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  else if (gLogCategory_APBrokerKeychainUtils <= 50)
  {
    if (gLogCategory_APBrokerKeychainUtils != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

@end
