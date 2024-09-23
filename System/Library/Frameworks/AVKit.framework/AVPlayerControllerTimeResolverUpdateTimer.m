@implementation AVPlayerControllerTimeResolverUpdateTimer

void __AVPlayerControllerTimeResolverUpdateTimer_block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    AVPlayerControllerTimeResolverUpdateTime(WeakRetained);
    WeakRetained = v2;
  }

}

@end
