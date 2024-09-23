@implementation CacheDeleteUpdateSetting

uint64_t __CacheDeleteUpdateSetting_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clientSetState:key:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
