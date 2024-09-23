@implementation AVTUIIsFacetrackingSupported

uint64_t __AVTUIIsFacetrackingSupported_block_invoke()
{
  uint64_t result;

  result = MGIsQuestionValid();
  if ((_DWORD)result)
    result = MGGetBoolAnswer();
  AVTUIIsFacetrackingSupported_isFaceTrackingSupported = result;
  return result;
}

@end
