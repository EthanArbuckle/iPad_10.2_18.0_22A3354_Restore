@implementation SKUIIPhoneSlideshowCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIIPhoneSlideshowCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilitySKUILocalizedString(CFSTR("app.screenshot.label"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

@end
