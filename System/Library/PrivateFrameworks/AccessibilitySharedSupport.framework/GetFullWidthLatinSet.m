@implementation GetFullWidthLatinSet

uint64_t __GetFullWidthLatinSet_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0CB3940], "_characterSetWithPattern:", CFSTR("[ａ-ｚＡ-Ｚ]"));
  GetFullWidthLatinSet___fullWidthLatinSet = result;
  return result;
}

@end
