@implementation MFMailCopySharedEventStore

void __MFMailCopySharedEventStore_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CAA078]);
  v1 = (void *)MFMailCopySharedEventStore_sEventStore;
  MFMailCopySharedEventStore_sEventStore = (uint64_t)v0;

}

@end
