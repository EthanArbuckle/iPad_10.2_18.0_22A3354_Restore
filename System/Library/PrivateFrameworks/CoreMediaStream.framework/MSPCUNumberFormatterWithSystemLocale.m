@implementation MSPCUNumberFormatterWithSystemLocale

CFNumberFormatterRef __MSPCUNumberFormatterWithSystemLocale_block_invoke()
{
  const __CFAllocator *v0;
  const __CFLocale *System;
  CFNumberFormatterRef result;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  System = CFLocaleGetSystem();
  result = CFNumberFormatterCreate(v0, System, kCFNumberFormatterDecimalStyle);
  MSPCUNumberFormatterWithSystemLocale_nf = (uint64_t)result;
  return result;
}

@end
