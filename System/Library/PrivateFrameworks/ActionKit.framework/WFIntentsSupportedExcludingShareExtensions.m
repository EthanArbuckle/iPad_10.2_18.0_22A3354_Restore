@implementation WFIntentsSupportedExcludingShareExtensions

void __WFIntentsSupportedExcludingShareExtensions_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(a2, "isEqualToString:", CFSTR("com.apple.share-services")) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "unionSet:", v5);

}

@end
