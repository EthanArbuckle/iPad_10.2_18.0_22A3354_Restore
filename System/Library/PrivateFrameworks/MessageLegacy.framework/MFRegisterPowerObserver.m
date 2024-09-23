@implementation MFRegisterPowerObserver

uint64_t __MFRegisterPowerObserver_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_observers_0;
  if (!_observers_0)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = (void *)_observers_0;
    _observers_0 = (uint64_t)v3;

    v2 = (void *)_observers_0;
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));
}

@end
