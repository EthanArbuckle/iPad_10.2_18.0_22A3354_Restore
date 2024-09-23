@implementation SCDynamicStoreDeallocate

void ____SCDynamicStoreDeallocate_block_invoke(uint64_t a1)
{
  CFSetRemoveValue((CFMutableSetRef)_sc_store_sessions, *(const void **)(a1 + 32));
}

@end
