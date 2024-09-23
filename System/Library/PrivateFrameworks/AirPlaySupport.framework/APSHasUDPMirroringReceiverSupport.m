@implementation APSHasUDPMirroringReceiverSupport

uint64_t __APSHasUDPMirroringReceiverSupport_block_invoke()
{
  uint64_t result;

  result = FigGetCFPreferenceNumberWithDefault();
  APSHasUDPMirroringReceiverSupport_sIsSupported = (_DWORD)result != 0;
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
