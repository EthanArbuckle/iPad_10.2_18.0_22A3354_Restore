@implementation GetHalfWidthLatinSet

uint64_t __GetHalfWidthLatinSet_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0CB3940], "_characterSetWithPattern:", CFSTR("[a-zA-Z]"));
  GetHalfWidthLatinSet___halfWidthLatinSet = result;
  return result;
}

@end
