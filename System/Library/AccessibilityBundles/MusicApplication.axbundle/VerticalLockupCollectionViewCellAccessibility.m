@implementation VerticalLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.VerticalLockupCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axCollectionViewLayout
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[VerticalLockupCollectionViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  char isKindOfClass;
  void *v5;
  objc_super v6;

  -[VerticalLockupCollectionViewCellAccessibility _axCollectionViewLayout](self, "_axCollectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234917594](CFSTR("MusicApplication.ShelfCollectionViewLayout"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[VerticalLockupCollectionViewCellAccessibility _axCollectionViewLayout](self, "_axCollectionViewLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("AX_VertificalLockupCollectionViewCell"));

  }
  v6.receiver = self;
  v6.super_class = (Class)VerticalLockupCollectionViewCellAccessibility;
  -[VerticalLockupCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VerticalLockupCollectionViewCellAccessibility;
  -[VerticalLockupCollectionViewCellAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[VerticalLockupCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
