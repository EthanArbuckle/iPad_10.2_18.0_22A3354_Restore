@implementation CAMHDRStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMHDRStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMHDRStatusIndicator"), CFSTR("hdrMode"), "q", 0);
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("HDR_MODE_BUTTON_LABEL"));
}

- (id)accessibilityValue
{
  void *v2;
  unint64_t v3;
  void *v4;

  -[CAMHDRStatusIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("hdrMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if (v3 > 2)
  {
    v4 = 0;
  }
  else
  {
    accessibilityCameraUILocalizedString(off_24FEE0A88[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMHDRStatusIndicatorAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMHDRStatusIndicatorAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
