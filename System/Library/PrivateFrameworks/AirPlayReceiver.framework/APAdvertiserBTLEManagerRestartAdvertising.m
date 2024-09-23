@implementation APAdvertiserBTLEManagerRestartAdvertising

uint64_t __APAdvertiserBTLEManagerRestartAdvertising_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "restartAdvertisingIfNecessary");
}

@end
