@implementation GKComposeHeaderFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKComposeHeaderField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKComposeHeaderField"), CFSTR("nameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKComposeHeaderField"), CFSTR("valueLabel"), "@", 0);

}

- (GKComposeHeaderFieldAccessibility)initWithFrame:(CGRect)a3
{
  GKComposeHeaderFieldAccessibility *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKComposeHeaderFieldAccessibility;
  v3 = -[GKComposeHeaderFieldAccessibility initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[GKComposeHeaderFieldAccessibility safeValueForKey:](v3, "safeValueForKey:", CFSTR("nameLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKComposeHeaderFieldAccessibility safeValueForKey:](v3, "safeValueForKey:", CFSTR("valueLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("ComposeHeaderFieldNameLabel"));
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("ComposeHeaderFieldValueLabel"));

  return v3;
}

@end
