@implementation MediaOptionIndexesFromAvailableOptionsForPreferredLanguage

uint64_t ___MediaOptionIndexesFromAvailableOptionsForPreferredLanguage_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40));

  return v4;
}

@end
