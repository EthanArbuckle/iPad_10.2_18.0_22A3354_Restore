@implementation SBUIVibrantButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIVibrantButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIVibrantButton"), CFSTR("title"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;

  -[SBUIVibrantButtonAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[SBUIVibrantButtonAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  else
    -[SBUIVibrantButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
