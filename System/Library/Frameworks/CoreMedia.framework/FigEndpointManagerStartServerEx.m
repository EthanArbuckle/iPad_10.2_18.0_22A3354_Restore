@implementation FigEndpointManagerStartServerEx

void __FigEndpointManagerStartServerEx_block_invoke(uint64_t a1, const void *a2)
{
  CFMutableDictionaryRef Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), a2, Mutable);
  if (Mutable)
    CFRelease(Mutable);
}

@end
