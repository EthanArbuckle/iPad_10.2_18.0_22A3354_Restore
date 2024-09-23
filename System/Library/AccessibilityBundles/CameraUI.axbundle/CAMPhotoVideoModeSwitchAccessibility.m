@implementation CAMPhotoVideoModeSwitchAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMPhotoVideoModeSwitch");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMPhotoVideoModeSwitch"), CFSTR("mode"), "Q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  __CFString *v3;

  v2 = (void *)-[CAMPhotoVideoModeSwitchAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("mode"));
  if (!v2)
  {
    v3 = CFSTR("photo.mode");
    goto LABEL_5;
  }
  if (v2 == (void *)1)
  {
    v3 = CFSTR("video.mode");
LABEL_5:
    accessibilityCameraUI3LocalizedString(v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityHint
{
  void *v2;
  __CFString *v3;

  v2 = (void *)-[CAMPhotoVideoModeSwitchAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("mode"));
  if (!v2)
  {
    v3 = CFSTR("switch.to.video");
    goto LABEL_5;
  }
  if (v2 == (void *)1)
  {
    v3 = CFSTR("switch.to.photo");
LABEL_5:
    accessibilityCameraUI3LocalizedString(v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

@end
