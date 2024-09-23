@implementation FigRouteDiscoveryManagerPowerLogDiscoveryLevelChange

void __FigRouteDiscoveryManagerPowerLogDiscoveryLevelChange_block_invoke(uint64_t a1)
{
  const __CFAllocator *v2;
  __CFDictionary *Mutable;
  CFNumberRef v4;
  const __CFDictionary *v5;
  const void *Value;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  int valuePtr;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  valuePtr = discovererManager_getDiscoveryModeAsInt();
  v4 = CFNumberCreate(v2, kCFNumberSInt32Type, &valuePtr);
  if (v4)
    CFDictionarySetValue(Mutable, CFSTR("Level"), v4);
  v5 = *(const __CFDictionary **)(a1 + 40);
  if (v5)
  {
    if (CFDictionaryContainsKey(v5, CFSTR("ObjectHash")))
    {
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), CFSTR("ObjectHash"));
      CFDictionarySetValue(Mutable, CFSTR("ObjectHash"), Value);
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 40), CFSTR("Client")))
    {
      v7 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), CFSTR("Client"));
      CFDictionarySetValue(Mutable, CFSTR("Client"), v7);
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 40), CFSTR("OnBehalfOf")))
    {
      v8 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), CFSTR("OnBehalfOf"));
      CFDictionarySetValue(Mutable, CFSTR("OnBehalfOf"), v8);
    }
  }
  PLLogRegisteredEvent();
  if (v4)
    CFRelease(v4);
  v9 = *(const void **)(a1 + 32);
  if (v9)
    CFRelease(v9);
  v10 = *(const void **)(a1 + 40);
  if (v10)
    CFRelease(v10);
  if (Mutable)
    CFRelease(Mutable);
}

@end
