@implementation AFHasHapticEngine

uint64_t __AFHasHapticEngine_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFHasHapticEngine_hasHapticEngine = result;
  return result;
}

@end
