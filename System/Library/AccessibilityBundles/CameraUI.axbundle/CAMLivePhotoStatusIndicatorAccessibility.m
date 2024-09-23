@implementation CAMLivePhotoStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMLivePhotoStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMLivePhotoStatusIndicator"), CFSTR("livePhotoMode"), "q", 0);
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("LIVEPHOTO_MODE_BUTTON_LABEL"));
}

- (id)accessibilityValue
{
  void *v3;
  uint64_t v4;

  -[CAMLivePhotoStatusIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("livePhotoMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return -[CAMLivePhotoStatusIndicatorAccessibility _axValueForLivePhotoMode:](self, "_axValueForLivePhotoMode:", v4);
}

- (id)_axValueForLivePhotoMode:(int64_t)a3
{
  const __CFString *v3;
  __CFString *v4;

  v3 = CFSTR("LIVEPHOTO_MODE_BUTTON_VALUE_AUTO");
  if (a3 == 1)
    v3 = CFSTR("LIVEPHOTO_MODE_BUTTON_VALUE_ON");
  if (a3)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("LIVEPHOTO_MODE_BUTTON_VALUE_OFF");
  accessibilityCameraUILocalizedString(v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMLivePhotoStatusIndicatorAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMLivePhotoStatusIndicatorAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
