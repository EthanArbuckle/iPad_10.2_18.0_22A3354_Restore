@implementation ACXIsInternalBuild

uint64_t __ACXIsInternalBuild_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  ACXIsInternalBuild_result = result;
  return result;
}

@end
