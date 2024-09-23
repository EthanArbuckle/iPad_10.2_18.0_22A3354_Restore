@implementation CAMExposureBiasStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMExposureBiasStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMExposureBiasStatusIndicator"), CFSTR("isExposureValueVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMExposureBiasStatusIndicator"), CFSTR("_exposureLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("exposure.button"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMExposureBiasStatusIndicatorAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMExposureBiasStatusIndicatorAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  objc_super v6;

  if ((-[CAMExposureBiasStatusIndicatorAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExposureValueVisible")) & 1) != 0)
  {
    -[CAMExposureBiasStatusIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_exposureLabel"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CAMExposureBiasStatusIndicatorAccessibility;
    -[CAMExposureBiasStatusIndicatorAccessibility accessibilityValue](&v6, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
