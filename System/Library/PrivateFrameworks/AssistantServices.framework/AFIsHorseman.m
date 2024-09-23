@implementation AFIsHorseman

uint64_t __AFIsHorseman_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFIsHorseman_isHorseman = result;
  return result;
}

@end
