@implementation MFUnregisterPowerObserver

uint64_t __MFUnregisterPowerObserver_block_invoke(uint64_t a1)
{
  return objc_msgSend((id)_observers_0, "removeObject:", *(_QWORD *)(a1 + 32));
}

@end
