@implementation Shutdown

void __aprscreen_Shutdown_block_invoke(uint64_t a1)
{
  CFSetRemoveValue(*(CFMutableSetRef *)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 40));
}

@end
