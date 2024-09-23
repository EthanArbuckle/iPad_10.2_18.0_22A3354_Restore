@implementation CUNextID32

uint64_t __CUNextID32_block_invoke()
{
  uint64_t result;

  result = arc4random();
  CUNextID32_sNextID = result & 0xFFFF0000;
  return result;
}

@end
