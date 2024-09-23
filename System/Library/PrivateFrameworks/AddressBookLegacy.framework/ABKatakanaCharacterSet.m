@implementation ABKatakanaCharacterSet

uint64_t __ABKatakanaCharacterSet_block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(CFSTR("[[:scx=Kana:]]"), "_cn_resultWithAllCharacters:", &__block_literal_global_9), "pointerValue");
  ABKatakanaCharacterSet___katakanaSet = result;
  return result;
}

@end
