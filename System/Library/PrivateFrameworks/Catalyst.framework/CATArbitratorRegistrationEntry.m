@implementation CATArbitratorRegistrationEntry

void __71___CATArbitratorRegistrationEntry_initWithResource_maxConcurrentCount___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "servicePendingWaitTokens");

}

@end
