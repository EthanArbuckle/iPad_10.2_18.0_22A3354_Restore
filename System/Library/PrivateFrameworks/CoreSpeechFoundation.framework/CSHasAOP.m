@implementation CSHasAOP

uint64_t __CSHasAOP_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  CSHasAOP_hasAOP = result;
  return result;
}

@end
