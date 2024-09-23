@implementation SecCFDictionaryCOWGetMutable

void __SecCFDictionaryCOWGetMutable_block_invoke(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 8), a2, a3);
}

@end
