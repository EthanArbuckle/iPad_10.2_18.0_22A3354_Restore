@implementation GetHiraganaSet

uint64_t __GetHiraganaSet_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0CB3940], "_characterSetWithPattern:", CFSTR("[[:Hiragana:][:Katakana_Or_Hiragana:]]"));
  GetHiraganaSet___hiraganaSet = result;
  return result;
}

@end
