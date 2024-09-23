@implementation SetNthScopeSet

void __SetNthScopeSet_block_invoke(uint64_t a1)
{
  __CFArray *Mutable;
  const void *v3;
  int v4;
  const __CFArray *v5;
  CFIndex CountOfValue;
  const void *v7;
  CFRange v8;

  Mutable = (__CFArray *)sLogSettings;
  if (sLogSettings)
  {
    v3 = (const void *)*MEMORY[0x24BDBD430];
  }
  else
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 4, MEMORY[0x24BDBD690]);
    v3 = (const void *)*MEMORY[0x24BDBD430];
    v4 = 5;
    do
    {
      CFArrayAppendValue(Mutable, v3);
      --v4;
    }
    while (v4);
    sLogSettings = (uint64_t)Mutable;
  }
  CFArraySetValueAtIndex(Mutable, *(int *)(a1 + 40), *(const void **)(a1 + 32));
  v5 = (const __CFArray *)sLogSettings;
  v8.length = CFArrayGetCount((CFArrayRef)sLogSettings);
  v8.location = 0;
  CountOfValue = CFArrayGetCountOfValue(v5, v8, v3);
  if (CountOfValue == CFArrayGetCount(v5))
  {
    v7 = (const void *)sLogSettings;
    if (sLogSettings)
    {
      sLogSettings = 0;
      CFRelease(v7);
    }
  }
}

@end
