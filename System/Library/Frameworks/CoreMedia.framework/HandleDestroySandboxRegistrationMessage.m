@implementation HandleDestroySandboxRegistrationMessage

void __HandleDestroySandboxRegistrationMessage_block_invoke(uint64_t a1)
{
  CFNumberRef SInt32;
  BOOL v3;
  const __CFArray *v4;
  CFIndex FirstIndexOfValue;
  const void *v6;
  void *value;
  CFRange v8;

  SInt32 = FigCFNumberCreateSInt32((const __CFAllocator *)*MEMORY[0x1E0C9AE00], *(_DWORD *)(a1 + 40));
  value = 0;
  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)gFigSandboxServerXPC_1, SInt32, (const void **)&value))
    v3 = value == 0;
  else
    v3 = 1;
  if (!v3 && CFArrayGetCount((CFArrayRef)value) >= 1)
  {
    v4 = (const __CFArray *)value;
    v8.length = CFArrayGetCount((CFArrayRef)value);
    v8.location = 0;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v4, v8, *(const void **)(a1 + 32));
    if (FirstIndexOfValue != -1)
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)value, FirstIndexOfValue);
  }
  if (SInt32)
    CFRelease(SInt32);
  v6 = *(const void **)(a1 + 32);
  if (v6)
    CFRelease(v6);
}

@end
