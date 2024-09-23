@implementation CASetRootQueue

uint64_t __CASetRootQueue_block_invoke(uint64_t result)
{
  CA::_root_queue = *(_QWORD *)(result + 32);
  return result;
}

@end
