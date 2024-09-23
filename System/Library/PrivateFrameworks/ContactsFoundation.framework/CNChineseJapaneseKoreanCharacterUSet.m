@implementation CNChineseJapaneseKoreanCharacterUSet

uint64_t __CNChineseJapaneseKoreanCharacterUSet_block_invoke()
{
  uint64_t result;

  result = CNCopyCharacterUSetWithPattern(CFSTR("[[:Hani:][:Hiragana:][:scx=Kana:][:Bopomofo:][:Hangul:]]"));
  CNChineseJapaneseKoreanCharacterUSet_set = result;
  return result;
}

@end
