@implementation CNArabicCharacterUSet

uint64_t __CNArabicCharacterUSet_block_invoke()
{
  uint64_t result;

  result = CNCopyCharacterUSetWithPattern(CFSTR("[[:Arabic:][:block=ARABIC:]]"));
  CNArabicCharacterUSet_set = result;
  return result;
}

@end
