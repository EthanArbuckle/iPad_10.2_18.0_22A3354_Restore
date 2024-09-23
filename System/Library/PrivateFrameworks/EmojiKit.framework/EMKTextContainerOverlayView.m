@implementation EMKTextContainerOverlayView

uint64_t __52___EMKTextContainerOverlayView_prepareWithTextView___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newFragmentViewForFragment:", a2);
  objc_msgSend(*(id *)(a1 + 32), "fragmentViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v3);
  return 1;
}

@end
