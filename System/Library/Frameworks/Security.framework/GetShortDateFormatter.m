@implementation GetShortDateFormatter

void __GetShortDateFormatter_block_invoke(uint64_t a1)
{
  const __CFLocale *v2;

  v2 = CFLocaleCopyCurrent();
  **(_QWORD **)(a1 + 32) = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetFormat(**(CFDateFormatterRef **)(a1 + 32), CFSTR("yyyy-MM-dd HH:mm"));
  if (v2)
    CFRelease(v2);
}

@end
