@implementation ABTokenListPopulateFromString

void __ABTokenListPopulateFromString_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  const void *v4;

  v3 = objc_msgSend(a2, "range");
  _AddTokenListEntryForRangeInString(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(char **)(a1 + 80), *(_QWORD *)(a1 + 88), (const void *)(*(_QWORD *)(a1 + 40) + v3), v4, (CFStringRef)objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v3, v4));
}

@end
