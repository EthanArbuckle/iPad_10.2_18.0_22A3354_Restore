@implementation TVMLKit_TVImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("_TVImageView"), CFSTR("UIControl"));
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[TVMLKit_TVImageViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  int v4;
  objc_super v6;

  -[TVMLKit_TVImageViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXTVMLKitLogoImageViewID"));

  if (v4)
    return *MEMORY[0x24BDF73C0];
  v6.receiver = self;
  v6.super_class = (Class)TVMLKit_TVImageViewAccessibility;
  return *MEMORY[0x24BDF73E8] ^ -[TVMLKit_TVImageViewAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
}

@end
