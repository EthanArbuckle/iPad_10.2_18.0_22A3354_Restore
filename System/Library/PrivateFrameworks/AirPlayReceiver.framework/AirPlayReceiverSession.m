@implementation AirPlayReceiverSession

void ___AirPlayReceiverSession_HandleUINotifications_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  const void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(a1 + 40);
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v5 = Mutable;
    CFDictionarySetValue(Mutable, CFSTR("type"), CFSTR("FPSSecureStop"));
    CFDictionarySetValue(v5, CFSTR("FPSSecureStopPayload"), v3);
    if (AirPlayReceiverSessionSendCommandForObject(v2, 0, v5, 0, 0))
      APSLogErrorAt();
    CFRelease(v5);
  }
  else
  {
    APSLogErrorAt();
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
  v6 = *(const void **)(a1 + 40);
  if (v6)
    CFRelease(v6);
}

void ___AirPlayReceiverSession_HandleUINotifications_block_invoke_2(uint64_t a1)
{
  _ScreenTearDown(*(_QWORD *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ___AirPlayReceiverSession_HandleUINotifications_block_invoke_3(uint64_t a1)
{
  int v2;
  _DWORD *v3;

  v2 = *(_DWORD *)(a1 + 40);
  v3 = *(_DWORD **)(a1 + 32);
  if (v2 == v3[159])
  {
    _ScreenTearDown((uint64_t)v3);
    v3 = *(_DWORD **)(a1 + 32);
  }
  CFRelease(v3);
}

void ___AirPlayReceiverSession_HandleUINotifications_block_invoke_4(uint64_t a1)
{
  AirPlayReceiverSessionForceKeyFrame(*(_QWORD *)(a1 + 32), 0, 0);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ___AirPlayReceiverSession_HandleUINotifications_block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  __CFDictionary *Mutable;
  __CFDictionary *v4;
  void *value;

  v2 = *(_QWORD *)(a1 + 32);
  value = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v4 = Mutable;
    CFDictionarySetValue(Mutable, CFSTR("type"), CFSTR("updateDisplayInfo"));
    if (APReceiverSystemInfoCopyDisplaysInfoForUserVersion(*(_QWORD *)(*(_QWORD *)(v2 + 24) + 160), (const __CFAllocator *)*MEMORY[0x24BDBD240], *(_DWORD *)(v2 + 608), (__CFArray **)&value)|| (CFDictionarySetValue(v4, CFSTR("displays"), value), AirPlayReceiverSessionSendCommandForObject(v2, 0, v4, 0, 0)))
    {
      APSLogErrorAt();
    }
    if (value)
      CFRelease(value);
    CFRelease(v4);
  }
  else
  {
    APSLogErrorAt();
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
