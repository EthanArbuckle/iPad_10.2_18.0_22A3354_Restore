@implementation VSOnceAndOnlyOnceBlock

uint64_t __VSOnceAndOnlyOnceBlock_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

@end
