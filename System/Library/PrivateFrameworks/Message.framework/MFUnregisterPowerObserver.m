@implementation MFUnregisterPowerObserver

uint64_t __MFUnregisterPowerObserver_block_invoke(uint64_t a1)
{
  return objc_msgSend((id)sObservers, "removeObject:", *(_QWORD *)(a1 + 32));
}

@end
