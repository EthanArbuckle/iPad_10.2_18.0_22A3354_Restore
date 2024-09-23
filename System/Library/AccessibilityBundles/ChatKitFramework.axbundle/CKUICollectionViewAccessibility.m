@implementation CKUICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  void *v3;
  char v4;
  objc_super v6;

  -[CKUICollectionViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXImpactEffectCollectionView"));

  if ((v4 & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)CKUICollectionViewAccessibility;
  return -[CKUICollectionViewAccessibility isAccessibilityOpaqueElementProvider](&v6, sel_isAccessibilityOpaqueElementProvider);
}

@end
