@implementation CGColorGetConstantColor

CFMutableDictionaryRef __CGColorGetConstantColor_block_invoke()
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CGColorGetConstantColor_constant_colors = (uint64_t)result;
  return result;
}

@end
