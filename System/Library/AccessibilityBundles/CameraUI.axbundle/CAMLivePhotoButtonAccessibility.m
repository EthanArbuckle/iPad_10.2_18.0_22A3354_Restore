@implementation CAMLivePhotoButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMLivePhotoButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMLivePhotoButton"), CFSTR("livePhotoMode"), "q", 0);
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("live.photo"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMLivePhotoButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMLivePhotoButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityValue
{
  uint64_t v2;
  const __CFString *v3;
  __CFString *v4;

  v2 = -[CAMLivePhotoButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("livePhotoMode"));
  v3 = CFSTR("off");
  if (v2 == 2)
    v3 = CFSTR("auto");
  if (v2 == 1)
    v4 = CFSTR("on");
  else
    v4 = (__CFString *)v3;
  accessibilityCameraUILocalizedString(v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityIdentifier
{
  return CFSTR("Iris");
}

@end
