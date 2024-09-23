@implementation NSString

uint64_t __33__NSString_AXPriv___ideographSet__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_characterSetWithPattern:", CFSTR("[:Hani:]"));
  _ideographSet___ideographSet = result;
  return result;
}

uint64_t __38__NSString_AXPriv___japaneseLetterSet__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_characterSetWithPattern:", CFSTR("[[:Hiragana:][:Katakana:][:Katakana_Or_Hiragana:][:Hani:]]"));
  _japaneseLetterSet___japaneseLetterSet = result;
  return result;
}

@end
