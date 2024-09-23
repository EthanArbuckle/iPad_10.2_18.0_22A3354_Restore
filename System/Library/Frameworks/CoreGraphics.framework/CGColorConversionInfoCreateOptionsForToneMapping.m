@implementation CGColorConversionInfoCreateOptionsForToneMapping

CFDictionaryRef __CGColorConversionInfoCreateOptionsForToneMapping_block_invoke()
{
  CFDictionaryRef result;
  const void *v1;
  void *keys;

  v1 = (const void *)*MEMORY[0x1E0C9AE50];
  keys = CFSTR("kCGColorConversionInfoOptionsFailed");
  result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&keys, &v1, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CGColorConversionInfoCreateOptionsForToneMapping_bad_color_conversion_info_options = (uint64_t)result;
  return result;
}

@end
