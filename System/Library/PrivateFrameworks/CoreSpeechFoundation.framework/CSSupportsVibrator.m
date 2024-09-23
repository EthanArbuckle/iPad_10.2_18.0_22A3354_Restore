@implementation CSSupportsVibrator

uint64_t __CSSupportsVibrator_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  CSSupportsVibrator_hasHaptic = result;
  return result;
}

@end
