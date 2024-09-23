@implementation CAMFlashStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMFlashStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFlashStatusIndicator"), CFSTR("flashMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFlashStatusIndicator"), CFSTR("isFlashUnavailable"), "B", 0);

}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(CFSTR("FLASH_MODE_BUTTON_LABEL"));
}

- (id)accessibilityValue
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;

  if ((-[CAMFlashStatusIndicatorAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isFlashUnavailable")) & 1) != 0)
  {
    v3 = CFSTR("FLASH_MODE_BUTTON_UNAVAILABLE");
  }
  else
  {
    -[CAMFlashStatusIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("flashMode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    v6 = CFSTR("FLASH_MODE_BUTTON_VALUE_AUTO");
    if (v5 == 1)
      v6 = CFSTR("FLASH_MODE_BUTTON_VALUE_ON");
    if (v5)
      v3 = (__CFString *)v6;
    else
      v3 = CFSTR("FLASH_MODE_BUTTON_VALUE_OFF");
  }
  accessibilityCameraKitLocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMFlashStatusIndicatorAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMFlashStatusIndicatorAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
