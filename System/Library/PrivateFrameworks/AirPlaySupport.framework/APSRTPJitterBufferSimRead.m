@implementation APSRTPJitterBufferSimRead

uint64_t __APSRTPJitterBufferSimRead_block_invoke()
{
  uint64_t result;

  if (gLogCategory_APSRTPJitterBufferSim <= 10)
  {
    if (gLogCategory_APSRTPJitterBufferSim != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

uint64_t __APSRTPJitterBufferSimRead_block_invoke_2()
{
  uint64_t result;

  if (gLogCategory_APSRTPJitterBufferSim <= 30)
  {
    if (gLogCategory_APSRTPJitterBufferSim != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

uint64_t __APSRTPJitterBufferSimRead_block_invoke_3()
{
  uint64_t result;

  if (gLogCategory_APSRTPJitterBufferSim <= 10)
  {
    if (gLogCategory_APSRTPJitterBufferSim != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

uint64_t __APSRTPJitterBufferSimRead_block_invoke_4()
{
  uint64_t result;

  if (gLogCategory_APSRTPJitterBufferSimMaxFreq <= 50)
  {
    if (gLogCategory_APSRTPJitterBufferSimMaxFreq != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

@end
