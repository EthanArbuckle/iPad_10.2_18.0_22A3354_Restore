@implementation MRArrayCopySingleLineDescription

uint64_t __MRArrayCopySingleLineDescription_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t result;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

  result = objc_msgSend(*(id *)(a1 + 40), "count");
  if (result - 1 != a3)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  return result;
}

@end
