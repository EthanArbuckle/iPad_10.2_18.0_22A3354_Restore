@implementation CNLatinCharacterUSet

uint64_t __CNLatinCharacterUSet_block_invoke()
{
  uint64_t result;

  result = CNCopyCharacterUSetWithPattern(CFSTR("[[:Latin:][:Common:][:Inherited:]]"));
  CNLatinCharacterUSet_set = result;
  return result;
}

@end
