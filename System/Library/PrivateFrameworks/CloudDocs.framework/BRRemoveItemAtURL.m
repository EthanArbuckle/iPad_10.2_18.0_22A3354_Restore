@implementation BRRemoveItemAtURL

uint64_t __BRRemoveItemAtURL_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBoolResult:error:", a2 == 0, a2);
}

@end
