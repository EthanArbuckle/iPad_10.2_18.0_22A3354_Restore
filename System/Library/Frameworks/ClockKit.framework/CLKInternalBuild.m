@implementation CLKInternalBuild

uint64_t __CLKInternalBuild_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  CLKInternalBuild_internal = result;
  return result;
}

@end
