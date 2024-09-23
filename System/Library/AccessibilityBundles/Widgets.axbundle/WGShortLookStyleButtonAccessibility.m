@implementation WGShortLookStyleButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WGShortLookStyleButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("WGShortLookStyleButton"), CFSTR("_titleLabel"), "UILabel");
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[WGShortLookStyleButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
