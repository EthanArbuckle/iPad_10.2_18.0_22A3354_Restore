@implementation MSSharedContactStore

void __MSSharedContactStore_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v1 = (void *)MSSharedContactStore_store;
  MSSharedContactStore_store = (uint64_t)v0;

}

@end
