@implementation ATStoreAssetLinkRaiseWithSerialABCReport

intptr_t __ATStoreAssetLinkRaiseWithSerialABCReport_block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
