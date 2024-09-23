@implementation HandleReceiverUINotification

void ___HandleReceiverUINotification_block_invoke(uint64_t a1, int a2)
{
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  AirPlayReceiverSessionControl(*(_QWORD *)(a1 + 32), a2, CFSTR("sessionDied"));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
