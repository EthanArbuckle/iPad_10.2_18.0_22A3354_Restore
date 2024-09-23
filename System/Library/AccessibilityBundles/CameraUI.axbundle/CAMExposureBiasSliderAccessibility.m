@implementation CAMExposureBiasSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMExposureBiasSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMExposureBiasSlider"), CFSTR("setExposureBiasValue:"), "v", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CAMExposureBiasSlider"), CFSTR("_exposureBiasValue"), "f");

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityValue
{
  float v2;
  float v3;
  void *v4;
  void *v5;
  void *v6;

  -[CAMExposureBiasSliderAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("_exposureBiasValue"));
  v3 = v2;
  v4 = (void *)MEMORY[0x24BDD17C8];
  accessibilityCameraUILocalizedString(CFSTR("exposure.unit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setExposureBiasValue:(float)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMExposureBiasSliderAccessibility;
  -[CAMExposureBiasSliderAccessibility setExposureBiasValue:](&v6, sel_setExposureBiasValue_);
  if (CFAbsoluteTimeGetCurrent() - *(double *)&AXExposureAnnouncementTime > 1.0)
  {
    v4 = *MEMORY[0x24BDF71E8];
    -[CAMExposureBiasSliderAccessibility accessibilityValue](self, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v4, v5);

    AXExposureAnnouncementTime = CFAbsoluteTimeGetCurrent();
  }
}

@end
