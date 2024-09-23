@implementation ScreenPostRecordingState

void ___ScreenPostRecordingState_block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;
  const void **v3;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, CFSTR("type"), CFSTR("setScreenRecordingState"));
  v3 = (const void **)MEMORY[0x24BDBD270];
  if (!*(_BYTE *)(a1 + 40))
    v3 = (const void **)MEMORY[0x24BDBD268];
  CFDictionarySetValue(Mutable, CFSTR("state"), *v3);
  if (AirPlayReceiverSessionSendCommandForObject(*(_QWORD *)(a1 + 32), 0, Mutable, 0, 0))
  {
    APSLogErrorAt();
    if (!Mutable)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (Mutable)
LABEL_5:
    CFRelease(Mutable);
LABEL_6:
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
