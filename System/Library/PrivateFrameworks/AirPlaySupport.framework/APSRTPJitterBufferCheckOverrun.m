@implementation APSRTPJitterBufferCheckOverrun

uint64_t ___APSRTPJitterBufferCheckOverrun_block_invoke()
{
  uint64_t result;

  if (gLogCategory_APSRTPJitterBuffer <= 30)
  {
    if (gLogCategory_APSRTPJitterBuffer != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

@end
