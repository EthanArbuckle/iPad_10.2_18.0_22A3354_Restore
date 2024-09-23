@implementation HandleEventConnectionInvalidated

void ___HandleEventConnectionInvalidated_block_invoke(uint64_t a1)
{
  _BYTE *v2;
  int v3;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[456])
  {
    if (gLogCategory_AirPlayReceiverCore <= 50)
    {
      if (gLogCategory_AirPlayReceiverCore != -1 || (v3 = _LogCategory_Initialize(), v2 = *(_BYTE **)(a1 + 32), v3))
      {
        LogPrintF();
        v2 = *(_BYTE **)(a1 + 32);
      }
    }
    _AirPlayReceiverSession_Terminate((uint64_t)v2);
    v2 = *(_BYTE **)(a1 + 32);
  }
  CFRelease(v2);
}

@end
