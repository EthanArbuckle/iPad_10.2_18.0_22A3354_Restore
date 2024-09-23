@implementation NSString

void __63__NSString_HealthKit__hk_firstWordCapitalizedStringWithLocale___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v8;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v8 + 32) = a3;
  *(_QWORD *)(v8 + 40) = a4;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  *a7 = 1;
}

@end
