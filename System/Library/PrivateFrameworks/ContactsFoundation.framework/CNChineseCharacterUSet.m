@implementation CNChineseCharacterUSet

uint64_t __CNChineseCharacterUSet_block_invoke()
{
  uint64_t result;

  result = CNCopyCharacterUSetWithPattern(CFSTR("[:Hani:]"));
  CNChineseCharacterUSet_set = result;
  return result;
}

@end
