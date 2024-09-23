@implementation UICollectionViewListCellAccessibility

uint64_t __84__UICollectionViewListCellAccessibility__MusicUI__UIKit__axIsInViewControllerClass___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234917594](*(_QWORD *)(a1 + 32));
  LOBYTE(a1) = objc_opt_isKindOfClass();

  return a1 & 1;
}

@end
