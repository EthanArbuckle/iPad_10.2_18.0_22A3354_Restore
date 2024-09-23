@implementation SecTokenItemAdd

void __SecTokenItemAdd_block_invoke(uint64_t a1, CFTypeRef cf1, const void *a3)
{
  if (!CFEqual(cf1, CFSTR("v_Data")) && !CFEqual(cf1, CFSTR("toid")) && !CFEqual(cf1, CFSTR("accc")))
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), cf1, a3);
}

@end
