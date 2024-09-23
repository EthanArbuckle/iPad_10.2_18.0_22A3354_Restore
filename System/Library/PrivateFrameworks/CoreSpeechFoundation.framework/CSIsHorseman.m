@implementation CSIsHorseman

uint64_t __CSIsHorseman_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  CSIsHorseman_isHorseman = result;
  return result;
}

@end
