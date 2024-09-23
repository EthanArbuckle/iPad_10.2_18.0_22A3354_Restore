@implementation BSIntegerMapAllKeys

uint64_t __BSIntegerMapAllKeys_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addValue:", a2);
}

@end
