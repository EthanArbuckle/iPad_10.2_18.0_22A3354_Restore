@implementation MFRegisterContentProtectionObserver

void __MFRegisterContentProtectionObserver_block_invoke(uint64_t a1)
{
  _MFContentProtectionObserverWrapper *v2;
  __CFDictionary *Mutable;
  _MFContentProtectionObserverWrapper *value;

  v2 = -[_MFContentProtectionObserverWrapper initWithObserver:queue:]([_MFContentProtectionObserverWrapper alloc], "initWithObserver:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  Mutable = (__CFDictionary *)_observers;
  value = v2;
  if (!_observers)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
    v2 = value;
    _observers = (uint64_t)Mutable;
  }
  CFDictionaryAddValue(Mutable, *(const void **)(a1 + 32), v2);

}

@end
