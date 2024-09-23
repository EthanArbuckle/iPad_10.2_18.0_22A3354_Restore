@implementation CAMProResStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMProResStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMProResStatusIndicator"), CFSTR("proResVideoMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMProResStatusIndicator"), CFSTR("colorSpace"), "q", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  objc_super v7;

  v3 = -[CAMProResStatusIndicatorAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("colorSpace"));
  if (v3 < 2)
  {
    v4 = CFSTR("pro.res.button.sdr");
  }
  else if (v3 == 2)
  {
    v4 = CFSTR("pro.res.button.hdr");
  }
  else
  {
    if (v3 != 3)
    {
      v7.receiver = self;
      v7.super_class = (Class)CAMProResStatusIndicatorAccessibility;
      -[CAMProResStatusIndicatorAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    v4 = CFSTR("pro.res.button.log");
  }
  accessibilityCameraUILocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (id)accessibilityValue
{
  __CFString *v2;

  if (-[CAMProResStatusIndicatorAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("proResVideoMode")))
    v2 = CFSTR("on.state");
  else
    v2 = CFSTR("off.state");
  accessibilityCameraUILocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMProResStatusIndicatorAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMProResStatusIndicatorAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
