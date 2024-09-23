@implementation HMFHTTPClientHandleReachabilityChange

void ____HMFHTTPClientHandleReachabilityChange_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a3)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "setReachable:", 1);
    WeakRetained = v5;
  }

}

@end
