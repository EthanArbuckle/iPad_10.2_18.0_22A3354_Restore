@implementation BLTDaemonRestarted

uint64_t __BLTDaemonRestarted_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connect");
}

@end
