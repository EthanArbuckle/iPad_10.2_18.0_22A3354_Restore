@implementation MFUnregisterContentProtectionObserver

void __MFUnregisterContentProtectionObserver_block_invoke(uint64_t a1)
{
  if (_observers)
    CFDictionaryRemoveValue((CFMutableDictionaryRef)_observers, *(const void **)(a1 + 32));
}

@end
