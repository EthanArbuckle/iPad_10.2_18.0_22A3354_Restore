@implementation SecTrustStoreCopyCTExceptions

uint64_t __SecTrustStoreCopyCTExceptions_block_invoke(uint64_t a1, uint64_t a2, __CFString **a3)
{
  const __CFString *v4;

  v4 = *(const __CFString **)(a1 + 32);
  if (v4)
    SecXPCDictionarySetString(a2, (uint64_t)"appID", v4, a3);
  return 1;
}

uint64_t __SecTrustStoreCopyCTExceptions_block_invoke_2(uint64_t a1, void *a2, __CFString **a3)
{
  SecXPCDictionaryCopyDictionaryOptional(a2, "exceptions", (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a3);
  return 1;
}

@end
