@implementation EFRegisterContentProtectionObserver

void __EFRegisterContentProtectionObserver_block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;
  _EFContentProtectionObserverWrapper *value;

  value = -[_EFContentProtectionObserverWrapper initWithObserver:queue:]([_EFContentProtectionObserverWrapper alloc], "initWithObserver:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  Mutable = (__CFDictionary *)_observers;
  if (!_observers)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
    _observers = (uint64_t)Mutable;
  }
  CFDictionaryAddValue(Mutable, *(const void **)(a1 + 32), value);

}

@end
