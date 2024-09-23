@implementation CNInvertedHangulCharacterUSet

uint64_t __CNInvertedHangulCharacterUSet_block_invoke()
{
  uint64_t result;

  result = CNCopyCharacterUSetWithPattern(CFSTR("[^[:Hangul:]]"));
  CNInvertedHangulCharacterUSet_set = result;
  return result;
}

@end
