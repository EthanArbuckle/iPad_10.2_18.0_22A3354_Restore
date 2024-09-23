@implementation CUNextID64

uint64_t __CUNextID64_block_invoke()
{
  uint64_t result;

  result = arc4random();
  CUNextID64_sNextID = result << 32;
  return result;
}

@end
