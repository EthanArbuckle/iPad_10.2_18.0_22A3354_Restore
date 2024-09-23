@implementation AFDictationCapable

uint64_t __AFDictationCapable_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFDictationCapable_isCapable = result;
  return result;
}

@end
