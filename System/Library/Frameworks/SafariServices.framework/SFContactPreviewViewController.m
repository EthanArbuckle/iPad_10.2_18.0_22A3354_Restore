@implementation SFContactPreviewViewController

void __66___SFContactPreviewViewController__presentActivityViewController___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

@end
