@implementation CFSetUnion

void __CFSetUnion_block_invoke(uint64_t a1, const void *a2)
{
  CFSetSetValue(*(CFMutableSetRef *)(a1 + 32), a2);
}

void __CFSetUnion_block_invoke_6232(uint64_t a1, const void *a2)
{
  CFSetSetValue(*(CFMutableSetRef *)(a1 + 32), a2);
}

@end
