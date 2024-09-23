@implementation AirPlayReceiverServerPostMediaControlEvent

void ___AirPlayReceiverServerPostMediaControlEvent_block_invoke(uint64_t a1)
{
  const __CFData *v2;
  uint64_t v3;
  int v4;
  int v5;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(const __CFData **)(a1 + 40);
  if (*(_QWORD *)(v3 + 64))
  {
    v4 = HTTPMessageCreate();
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      MEMORY[0x25F0] = _DoEventTransactionCompletion;
      HTTPHeader_InitRequest();
      HTTPHeader_SetField();
      CFDataGetLength(v2);
      CFDataGetBytePtr(v2);
      HTTPMessageSetBody();
      v5 = HTTPClientSendMessage();
      if (!v5)
        goto LABEL_4;
    }
    APSLogErrorAt();
LABEL_4:
    if (!v5)
      goto LABEL_9;
    goto LABEL_5;
  }
  APSLogErrorAt();
LABEL_5:
  if (gLogCategory_AirPlayReceiverServer <= 60
    && (gLogCategory_AirPlayReceiverServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_9:
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
