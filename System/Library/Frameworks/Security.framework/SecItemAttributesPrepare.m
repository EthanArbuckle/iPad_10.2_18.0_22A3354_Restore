@implementation SecItemAttributesPrepare

void __SecItemAttributesPrepare_block_invoke(uint64_t a1, const void *a2, const void *a3)
{
  __CFDictionary *v5;

  v5 = SecCFDictionaryCOWGetMutable(*(const __CFDictionary ***)(a1 + 32));
  CFDictionaryAddValue(v5, a2, a3);
}

@end
