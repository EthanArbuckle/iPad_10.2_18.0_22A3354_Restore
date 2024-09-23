@implementation UICollectionViewListCellAccessibility

uint64_t __77__UICollectionViewListCellAccessibility__AppStore__UIKit__axIsInPageFacetsVC__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490667C](CFSTR("Arcade.PageFacetsViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
