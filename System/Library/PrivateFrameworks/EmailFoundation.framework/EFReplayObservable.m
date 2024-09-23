@implementation EFReplayObservable

uint64_t __33___EFReplayObservable_subscribe___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unsubscribe:", *(_QWORD *)(a1 + 40));
}

@end
