@implementation CalendarFoundationPerformBlockOnSharedContactStore

void __CalendarFoundationPerformBlockOnSharedContactStore_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.eventkit.contactstore", 0);
  v1 = (void *)CalendarFoundationPerformBlockOnSharedContactStore__contactStoreQueue;
  CalendarFoundationPerformBlockOnSharedContactStore__contactStoreQueue = (uint64_t)v0;

}

uint64_t __CalendarFoundationPerformBlockOnSharedContactStore_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
