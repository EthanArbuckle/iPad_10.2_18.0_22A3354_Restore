@implementation CEMGetSharedEmojiCharacterSet

const __CFURL *__CEMGetSharedEmojiCharacterSet_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFLocale *a5)
{
  const __CFURL *result;

  result = CEMCreateEmojiCharacterSet(a1, a2, a3, a4, a5);
  CEMGetSharedEmojiCharacterSet::characterSet = (uint64_t)result;
  return result;
}

@end
