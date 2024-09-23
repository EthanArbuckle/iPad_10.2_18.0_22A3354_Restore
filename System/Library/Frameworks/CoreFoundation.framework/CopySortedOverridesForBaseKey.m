@implementation CopySortedOverridesForBaseKey

void ___CopySortedOverridesForBaseKey_block_invoke(uint64_t a1, const void *a2)
{
  if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 32), a2, 0))
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), a2);
}

@end
