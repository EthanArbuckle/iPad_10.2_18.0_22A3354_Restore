@implementation NviIsHorseman

uint64_t __NviIsHorseman_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  NviIsHorseman_isHorseman = result;
  return result;
}

@end
