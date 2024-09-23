@implementation CNKatakanaCharacterUSet

uint64_t __CNKatakanaCharacterUSet_block_invoke()
{
  uint64_t result;

  result = CNCopyCharacterUSetWithPattern(CFSTR("[:scx=Kana:]"));
  CNKatakanaCharacterUSet_set = result;
  return result;
}

@end
