@implementation HandleSandboxRegistrationCreationMessage

void __HandleSandboxRegistrationCreationMessage_block_invoke(uint64_t a1)
{
  const void *v2;
  void *value;

  value = 0;
  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)gFigSandboxServerXPC_1, *(const void **)(a1 + 32), (const void **)&value))
  {
    CFRetain(value);
  }
  else
  {
    value = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    CFDictionarySetValue((CFMutableDictionaryRef)gFigSandboxServerXPC_1, *(const void **)(a1 + 32), value);
  }
  CFArrayAppendValue((CFMutableArrayRef)value, *(const void **)(a1 + 40));
  if (value)
  {
    CFRelease(value);
    value = 0;
  }
  v2 = (const void *)*(int *)(a1 + 48);
  MEMORY[0x193FFAA5C](gFigSandboxServerXPC_2, v2);
  CFBagAddValue((CFMutableBagRef)gFigSandboxServerXPC_2, v2);
}

@end
