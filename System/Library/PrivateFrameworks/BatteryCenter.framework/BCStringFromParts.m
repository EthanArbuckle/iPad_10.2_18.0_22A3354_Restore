@implementation BCStringFromParts

void __BCStringFromParts_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("-"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v4);

}

@end
