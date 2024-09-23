@implementation SFSafariViewControllerPrewarmingRequestThrottler

void __71___SFSafariViewControllerPrewarmingRequestThrottler__startRequestTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_stopRequestTimer");
    objc_msgSend(v2, "_performNextRequest");
    WeakRetained = v2;
  }

}

@end
