@implementation SKUIShelfCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIShelfCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIShelfCollectionViewCell"), CFSTR("setCollectionView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIShelfCollectionViewCell"), CFSTR("collectionView"), "@", 0);

}

- (void)setCollectionView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIShelfCollectionViewCellAccessibility;
  -[SKUIShelfCollectionViewCellAccessibility setCollectionView:](&v4, sel_setCollectionView_, a3);
  -[SKUIShelfCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  const __CFString *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SKUIShelfCollectionViewCellAccessibility;
  -[SKUIShelfCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[SKUIShelfCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SKUICarouselCollectionViewLayout"));
  isKindOfClass = objc_opt_isKindOfClass();

  -[SKUIShelfCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((isKindOfClass & 1) != 0)
    v9 = CFSTR("SKUICarouselCollection");
  else
    v9 = CFSTR("ShelfCollectionView");
  objc_msgSend(v7, "setAccessibilityIdentifier:", v9);

}

@end
