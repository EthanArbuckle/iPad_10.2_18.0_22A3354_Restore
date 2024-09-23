@implementation HUIDarkTextView

void __57___HUIDarkTextView_setVisualStylingProvider_forCategory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "nameLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "automaticallyUpdateView:withStyle:", v3, 0);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "valueLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "automaticallyUpdateView:withStyle:", v5, 1);

}

@end
