@implementation AFSupportsVibration

uint64_t __AFSupportsVibration_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFSupportsVibration_supportsVibration = result;
  return result;
}

@end
