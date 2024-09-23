@implementation UTDynamicGetParentIdentifiers

void ___UTDynamicGetParentIdentifiers_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(a2, "copy");
  objc_msgSend(v2, "addObject:");

}

@end
