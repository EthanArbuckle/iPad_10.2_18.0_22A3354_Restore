@implementation ABStringContainsNonLatinCharacters

void *___ABStringContainsNonLatinCharacters_block_invoke()
{
  void *result;

  result = ABGetCharacterSetWithPattern(CFSTR("[[:Latin:][:Common:][:Inherited:]]"));
  _ABStringContainsNonLatinCharacters___latinSet = (uint64_t)result;
  return result;
}

@end
