@implementation SetHIDInputMode

void __carEndpoint_SetHIDInputMode_block_invoke(uint64_t a1)
{
  uint64_t v2;
  __CFDictionary *Mutable;
  __CFDictionary *v4;
  const void *v5;
  const void *v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
  if (v2)
  {
    if (APHIDClientSetInputModeForUUID(v2, *(const void **)(a1 + 40), *(const void **)(a1 + 48))
      || (Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0])) == 0)
    {
      APSLogErrorAt();
    }
    else
    {
      v4 = Mutable;
      CFDictionarySetValue(Mutable, CFSTR("uuid"), *(const void **)(a1 + 40));
      CFDictionarySetValue(v4, CFSTR("hidInputMode"), *(const void **)(a1 + 48));
      if (carEndpoint_sendCommandInternal(*(const void **)(a1 + 56), CFSTR("hidSetInputMode"), v4, 0, 0))APSLogErrorAt();
      CFRelease(v4);
    }
  }
  v5 = *(const void **)(a1 + 40);
  if (v5)
    CFRelease(v5);
  v6 = *(const void **)(a1 + 48);
  if (v6)
    CFRelease(v6);
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

@end
