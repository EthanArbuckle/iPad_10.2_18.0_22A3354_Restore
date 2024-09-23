@implementation CFSetOfCFObjectsCopyValues

void __CFSetOfCFObjectsCopyValues_block_invoke(uint64_t a1, const void *a2)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), a2);
}

@end
