@implementation HUGridSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUGridSectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridSectionHeaderView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridSectionHeaderView"), CFSTR("chevronView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUGridSectionHeaderView"), CFSTR("UICollectionViewListCell"));

}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUGridSectionHeaderViewAccessibility;
  v3 = -[HUGridSectionHeaderViewAccessibility accessibilityTraits](&v10, sel_accessibilityTraits);
  -[HUGridSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("chevronView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDF73C0] | v3;
  LODWORD(v3) = objc_msgSend(v5, "isHidden");

  v7 = *MEMORY[0x24BDF73B0];
  if ((_DWORD)v3)
    v7 = 0;
  v8 = v6 | v7;

  return v8;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (HUGridSectionHeaderViewAccessibility)initWithFrame:(CGRect)a3
{
  HUGridSectionHeaderViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUGridSectionHeaderViewAccessibility;
  v3 = -[HUGridSectionHeaderViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[HUGridSectionHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end
