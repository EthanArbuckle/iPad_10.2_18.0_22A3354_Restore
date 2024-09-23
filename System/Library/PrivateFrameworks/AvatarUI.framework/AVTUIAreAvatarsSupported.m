@implementation AVTUIAreAvatarsSupported

uint64_t __AVTUIAreAvatarsSupported_block_invoke()
{
  uint64_t result;

  result = MGIsQuestionValid();
  if ((_DWORD)result)
    result = MGGetBoolAnswer();
  AVTUIAreAvatarsSupported_supportsAvatars = result;
  return result;
}

@end
