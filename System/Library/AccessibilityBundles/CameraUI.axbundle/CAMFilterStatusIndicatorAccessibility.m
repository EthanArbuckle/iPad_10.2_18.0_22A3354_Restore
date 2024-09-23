@implementation CAMFilterStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMFilterStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFilterStatusIndicator"), CFSTR("isOn"), "B", 0);
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(CFSTR("filter.button"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMFilterStatusIndicatorAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMFilterStatusIndicatorAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityValue
{
  __CFString *v2;

  if (-[CAMFilterStatusIndicatorAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isOn")))
    v2 = CFSTR("on.state");
  else
    v2 = CFSTR("off.state");
  accessibilityCameraUILocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
