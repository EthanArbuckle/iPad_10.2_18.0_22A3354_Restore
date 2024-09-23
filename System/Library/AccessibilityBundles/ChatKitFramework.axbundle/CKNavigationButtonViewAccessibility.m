@implementation CKNavigationButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKNavigationButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNavigationButtonView"), CFSTR("iconImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNavigationButtonView"), CFSTR("textLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CKNavigationButtonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGRect v21;
  CGRect v23;

  -[CKNavigationButtonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKNavigationButtonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessibilityFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  v23.origin.x = v14;
  v23.origin.y = v16;
  v23.size.width = v18;
  v23.size.height = v20;
  return CGRectUnion(v21, v23);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKNavigationButtonViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CKNavigationButtonViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
