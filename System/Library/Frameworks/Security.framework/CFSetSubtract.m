@implementation CFSetSubtract

void __CFSetSubtract_block_invoke(uint64_t a1, const void *a2)
{
  CFSetRemoveValue(*(CFMutableSetRef *)(a1 + 32), a2);
}

@end
