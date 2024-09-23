@implementation UILabel

void __57__UILabel_MTVisualStylingSupport__mt_applyVisualStyling___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setTextColor:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setTintColor:", v4);

}

@end
