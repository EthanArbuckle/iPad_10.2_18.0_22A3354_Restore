@implementation AFAnalyticsContextCreateWithErrorRecursively

void ___AFAnalyticsContextCreateWithErrorRecursively_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB3388]) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

@end
