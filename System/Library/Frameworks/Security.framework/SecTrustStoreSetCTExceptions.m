@implementation SecTrustStoreSetCTExceptions

uint64_t __SecTrustStoreSetCTExceptions_block_invoke(uint64_t a1, void *a2, __CFString **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFString *v11;
  const __CFString *v12;

  v11 = *(const __CFString **)(a1 + 32);
  if (v11)
    SecXPCDictionarySetPListWithRepair(a2, "exceptions", v11, a3, a5, a6, a7, a8);
  v12 = *(const __CFString **)(a1 + 40);
  if (v12)
    SecXPCDictionarySetString((uint64_t)a2, (uint64_t)"appID", v12, a3);
  return 1;
}

uint64_t __SecTrustStoreSetCTExceptions_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return 1;
}

@end
