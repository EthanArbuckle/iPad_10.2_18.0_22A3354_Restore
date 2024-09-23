@implementation PlaceCardLayoutChanged

uint64_t __PlaceCardLayoutChanged_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateViewControllers");
}

@end
