@implementation ACUIAppInstallCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ACUIAppInstallCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("ACUIAppInstallCell"), CFSTR("_installButton"), "SKUIItemOfferButton");
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

  -[ACUIAppInstallCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_installButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityActivationPoint");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ACUIAppInstallCellAccessibility;
    -[ACUIAppInstallCellAccessibility accessibilityActivationPoint](&v11, sel_accessibilityActivationPoint);
  }
  v7 = v5;
  v8 = v6;

  v9 = v7;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

@end
