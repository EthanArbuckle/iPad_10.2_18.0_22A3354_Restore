@implementation AX

void __49__AX_FunCamAvatarCarousel_accessibilityIncrement__block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 56));
  objc_msgSend(WeakRetained, "collectionView:didSelectItemAtIndexPath:", a1[5], a1[6]);

}

void __49__AX_FunCamAvatarCarousel_accessibilityDecrement__block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 56));
  objc_msgSend(WeakRetained, "collectionView:didSelectItemAtIndexPath:", a1[5], a1[6]);

}

@end
