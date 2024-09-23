@implementation CAMRAWStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMRAWStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMRAWStatusIndicator"), CFSTR("rawMode"), "q", 0);
}

- (id)accessibilityLabel
{
  return accessibilityCameraUIAzulCLocalizedString(CFSTR("RAW_MODE_BUTTON_LABEL"));
}

- (id)accessibilityValue
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;

  -[CAMRAWStatusIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rawMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if (v3)
  {
    if (v3 != 1)
    {
      v5 = 0;
      return v5;
    }
    v4 = CFSTR("RAW_MODE_BUTTON_VALUE_ON");
  }
  else
  {
    v4 = CFSTR("RAW_MODE_BUTTON_VALUE_OFF");
  }
  accessibilityCameraUIAzulCLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMRAWStatusIndicatorAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMRAWStatusIndicatorAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
