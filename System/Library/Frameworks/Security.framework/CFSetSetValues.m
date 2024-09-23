@implementation CFSetSetValues

void __CFSetSetValues_block_invoke(uint64_t a1, const void *a2)
{
  CFSetSetValue(*(CFMutableSetRef *)(a1 + 32), a2);
}

@end
