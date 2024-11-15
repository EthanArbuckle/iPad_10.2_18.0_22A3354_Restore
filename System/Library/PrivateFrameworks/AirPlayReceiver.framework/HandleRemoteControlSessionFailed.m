@implementation HandleRemoteControlSessionFailed

void ___HandleRemoteControlSessionFailed_block_invoke(uint64_t a1)
{
  if (CFDictionaryContainsValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 672), *(const void **)(a1 + 40)))
  {
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    _AirPlayReceiverSession_Terminate(*(_QWORD *)(a1 + 32));
  }
  else if (gLogCategory_AirPlayReceiverCore <= 40
         && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
