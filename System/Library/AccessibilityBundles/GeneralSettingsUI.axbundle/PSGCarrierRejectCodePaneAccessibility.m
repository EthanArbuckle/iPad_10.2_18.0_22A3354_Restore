@implementation PSGCarrierRejectCodePaneAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSGCarrierRejectCodePane");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("PSGCarrierRejectCodePane"), CFSTR("_rejectMessage"), "UILabel");
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PSGCarrierRejectCodePaneAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_rejectMessage"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
