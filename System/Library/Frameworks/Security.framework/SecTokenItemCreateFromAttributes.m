@implementation SecTokenItemCreateFromAttributes

void __SecTokenItemCreateFromAttributes_block_invoke(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), a2, a3);
}

@end
