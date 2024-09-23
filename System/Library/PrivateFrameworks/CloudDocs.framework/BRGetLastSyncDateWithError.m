@implementation BRGetLastSyncDateWithError

uint64_t __BRGetLastSyncDateWithError_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", a2, a3);
}

@end
