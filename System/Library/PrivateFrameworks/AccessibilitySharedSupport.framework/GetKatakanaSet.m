@implementation GetKatakanaSet

uint64_t __GetKatakanaSet_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0CB3940], "_characterSetWithPattern:", CFSTR("[[:Katakana:][:Katakana_Or_Hiragana:]]"));
  GetKatakanaSet___katakanaSet = result;
  return result;
}

@end
