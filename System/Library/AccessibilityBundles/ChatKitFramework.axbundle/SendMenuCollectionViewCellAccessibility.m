@implementation SendMenuCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ChatKit.SendMenuCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("drag.drop.reorder.hint"));
}

- (CGRect)_accessibilityVisibleFrame:(BOOL)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  v7.receiver = self;
  v7.super_class = (Class)SendMenuCollectionViewCellAccessibility;
  -[SendMenuCollectionViewCellAccessibility _accessibilityVisibleFrame:](&v7, sel__accessibilityVisibleFrame_, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end
