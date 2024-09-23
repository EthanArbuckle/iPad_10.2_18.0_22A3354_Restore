@implementation ABChineseJapaneseKoreanCharacterSet

uint64_t __ABChineseJapaneseKoreanCharacterSet_block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(CFSTR("[[:Hani:][:Hiragana:][[:scx=Kana:]][:Bopomofo:][ˉˊˇˋ˙][:Hangul:][()（）]]"), "_cn_resultWithAllCharacters:", &__block_literal_global_9), "pointerValue");
  ABChineseJapaneseKoreanCharacterSet___CJKSet = result;
  return result;
}

@end
