@implementation APSenderSessionMessageSendTimeout

uint64_t __APSenderSessionMessageSendTimeout_block_invoke()
{
  uint64_t result;
  int v1;

  result = APSSettingsGetInt64();
  if ((int)result >= 1)
  {
    v1 = result;
    if (gLogCategory_APSenderSession <= 50)
    {
      if (gLogCategory_APSenderSession != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
        result = LogPrintF();
    }
    APSenderSessionMessageSendTimeout_messageTimeout = v1;
  }
  return result;
}

@end
