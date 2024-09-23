@implementation AirPlayReceiverServerControl

void __AirPlayReceiverServerControl_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  __CFArray *v3;
  __CFArray *v4;
  const void *v5;
  const void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (gLogCategory_AirPlayReceiverServer <= 60
    && (gLogCategory_AirPlayReceiverServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = APReceiverSessionManagerCopyAllSessions(*(_QWORD *)(v2 + 216));
  if (v3)
  {
    v4 = v3;
    CFArrayGetCount(v3);
    CFArrayApplyBlock();
    CFRelease(v4);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  v5 = *(const void **)(a1 + 48);
  if (v5)
    CFRelease(v5);
  v6 = *(const void **)(a1 + 56);
  if (v6)
    CFRelease(v6);
}

@end
