@implementation CNChineseJapaneseKoreanPlusWhitelistedCharacterUSet

uint64_t __CNChineseJapaneseKoreanPlusWhitelistedCharacterUSet_block_invoke()
{
  uint64_t result;

  result = CNCopyCharacterUSetWithPattern(CFSTR("[[:Hani:][:Hiragana:][:scx=Kana:][:Bopomofo:][:Hangul:][ˉˊˇˋ˙][()（）]]"));
  CNChineseJapaneseKoreanPlusWhitelistedCharacterUSet_set = result;
  return result;
}

@end
