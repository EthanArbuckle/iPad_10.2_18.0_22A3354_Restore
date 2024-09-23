@implementation CAMVideoStabilizationStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMVideoStabilizationStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMVideoStabilizationStatusIndicator"), CFSTR("videoStabilizationMode"), "q", 0);
}

- (id)accessibilityLabel
{
  return accessibilityCameraUI2LocalizedString(CFSTR("Action_Mode"));
}

- (id)accessibilityValue
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;

  -[CAMVideoStabilizationStatusIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("videoStabilizationMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if (v3)
  {
    if (v3 != 1)
    {
      v5 = 0;
      return v5;
    }
    v4 = CFSTR("Action_Mode_On");
  }
  else
  {
    v4 = CFSTR("Action_Mode_Off");
  }
  accessibilityCameraUI2LocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMVideoStabilizationStatusIndicatorAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMVideoStabilizationStatusIndicatorAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
