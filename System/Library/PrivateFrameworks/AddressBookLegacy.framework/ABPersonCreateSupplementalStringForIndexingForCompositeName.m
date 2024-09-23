@implementation ABPersonCreateSupplementalStringForIndexingForCompositeName

void *__ABPersonCreateSupplementalStringForIndexingForCompositeName_block_invoke()
{
  void *result;

  result = ABGetCharacterSetWithPattern(CFSTR("[^[:Hangul:]]"));
  ABPersonCreateSupplementalStringForIndexingForCompositeName___invertedKorean = (uint64_t)result;
  return result;
}

@end
