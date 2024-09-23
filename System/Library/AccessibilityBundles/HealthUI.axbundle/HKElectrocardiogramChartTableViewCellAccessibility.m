@implementation HKElectrocardiogramChartTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKElectrocardiogramChartTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HKElectrocardiogramChartTableViewCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HKElectrocardiogramChartTableViewCell"), CFSTR("_scrollView"), "UIScrollView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKElectrocardiogramChartTableViewCell"), CFSTR("initWithGridSize:reuseIdentifier:"), "{CGSize=dd}", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKElectrocardiogramChartTableViewCellAccessibility;
  -[HKElectrocardiogramChartTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[HKElectrocardiogramChartTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityElementsHidden:", 1);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  char v9;

  v9 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_accessibleSubviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HKElectrocardiogramChartTableViewCellAccessibility;
    -[HKElectrocardiogramChartTableViewCellAccessibility accessibilityElements](&v8, sel_accessibilityElements);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (HKElectrocardiogramChartTableViewCellAccessibility)initWithGridSize:(CGSize)a3 reuseIdentifier:(id)a4
{
  HKElectrocardiogramChartTableViewCellAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKElectrocardiogramChartTableViewCellAccessibility;
  v4 = -[HKElectrocardiogramChartTableViewCellAccessibility initWithGridSize:reuseIdentifier:](&v6, sel_initWithGridSize_reuseIdentifier_, a4, a3.width, a3.height);
  -[HKElectrocardiogramChartTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

@end
