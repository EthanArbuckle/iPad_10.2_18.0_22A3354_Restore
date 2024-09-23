@implementation SRGuideViewHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SRGuideViewHeader");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SRGuideViewHeader"), CFSTR("_headerLabel"), "UILabel");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C0];
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SRGuideViewHeaderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_headerLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
