@implementation SFAdaptivePreviewViewController

uint64_t __58___SFAdaptivePreviewViewController_setLinkPreviewEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePreferredContentSize");
}

uint64_t __63___SFAdaptivePreviewViewController__updatePreferredContentSize__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

@end
