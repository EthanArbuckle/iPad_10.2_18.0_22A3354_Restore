@implementation AX

void __49__AX_FunCamFilterCarousel_accessibilityIncrement__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityContainer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView:didSelectItemAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __49__AX_FunCamFilterCarousel_accessibilityDecrement__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityContainer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView:didSelectItemAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end
