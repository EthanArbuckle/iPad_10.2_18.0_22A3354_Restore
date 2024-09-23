@implementation CALayer

uint64_t __70__CALayer_MTCoreMaterialVisualStylingAdditions__mt_applyVisualStying___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  if (v4)
    return objc_msgSend(v5, "setContentsMultiplyColor:", a2);
  else
    return objc_msgSend(v5, "setBackgroundColor:", a2);
}

@end
