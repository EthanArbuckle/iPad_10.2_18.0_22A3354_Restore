@implementation UICollectionViewLayoutAccessibility

uint64_t __101__UICollectionViewLayoutAccessibility__MobileSafari__UIKit__accessibilitySortCollectionViewLogically__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("PageFormatMenu"));

  return v3;
}

@end
