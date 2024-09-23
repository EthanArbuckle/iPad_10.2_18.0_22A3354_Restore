@implementation UICollectionViewListCellAccessibility__AppStore__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionViewListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("ASMessagesProvider.PageFacetsViewController"));
}

- (BOOL)_axIsInPageFacetsVC
{
  void *v2;
  BOOL v3;

  -[UICollectionViewListCellAccessibility__AppStore__UIKit _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_0, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_axSwitch
{
  void *v3;

  if (-[UICollectionViewListCellAccessibility__AppStore__UIKit _axIsInPageFacetsVC](self, "_axIsInPageFacetsVC"))
  {
    -[UICollectionViewListCellAccessibility__AppStore__UIKit _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[UICollectionViewListCellAccessibility__AppStore__UIKit _axSwitch](self, "_axSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityValue");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UICollectionViewListCellAccessibility__AppStore__UIKit;
    -[UICollectionViewListCellAccessibility__AppStore__UIKit accessibilityValue](&v8, sel_accessibilityValue);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGPoint result;

  -[UICollectionViewListCellAccessibility__AppStore__UIKit _axSwitch](self, "_axSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityActivationPoint");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UICollectionViewListCellAccessibility__AppStore__UIKit;
    -[UICollectionViewListCellAccessibility__AppStore__UIKit accessibilityActivationPoint](&v11, sel_accessibilityActivationPoint);
  }
  v7 = v5;
  v8 = v6;

  v9 = v7;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  -[UICollectionViewListCellAccessibility__AppStore__UIKit _axSwitch](self, "_axSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityTraits");
    v5 = _AXTraitsRemoveTrait();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UICollectionViewListCellAccessibility__AppStore__UIKit;
    v5 = -[UICollectionViewListCellAccessibility__AppStore__UIKit accessibilityTraits](&v8, sel_accessibilityTraits);
  }
  v6 = v5;

  return v6;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  objc_super v6;

  -[UICollectionViewListCellAccessibility__AppStore__UIKit _axSwitch](self, "_axSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UICollectionViewListCellAccessibility__AppStore__UIKit;
    -[UICollectionViewListCellAccessibility__AppStore__UIKit _accessibilitySupplementaryFooterViews](&v6, sel__accessibilitySupplementaryFooterViews);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

@end
