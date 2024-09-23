@implementation EFManualObservable

uint64_t __33___EFManualObservable_subscribe___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeObserver:", *(_QWORD *)(a1 + 40));
}

@end
