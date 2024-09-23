@implementation GEOConfigChangedDelegateListener

uint64_t __49___GEOConfigChangedDelegateListener_callListener__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "valueChangedForGEOConfigKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
