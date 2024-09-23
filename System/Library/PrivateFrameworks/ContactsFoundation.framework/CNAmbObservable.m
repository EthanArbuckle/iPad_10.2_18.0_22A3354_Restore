@implementation CNAmbObservable

uint64_t __30___CNAmbObservable_subscribe___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelRemainingObservables");
}

@end
