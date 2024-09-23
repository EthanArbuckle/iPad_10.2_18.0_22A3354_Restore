@implementation NSArray

BOOL __71__NSArray_AXSSDocumentTextRuleExtension__containsString_caseSensitive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:options:", *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) == 0) == 0;
}

@end
