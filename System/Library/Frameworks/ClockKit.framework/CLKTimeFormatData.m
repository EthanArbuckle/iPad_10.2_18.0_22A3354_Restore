@implementation CLKTimeFormatData

void __47___CLKTimeFormatData__timeFormatDataAccessLock__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1648]);
  v1 = (void *)_timeFormatDataAccessLock_accessLock;
  _timeFormatDataAccessLock_accessLock = (uint64_t)v0;

}

@end
