@implementation SUUIIPhoneSlideshowCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIIPhoneSlideshowCell");
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
  return accessibilityLocalizedString(CFSTR("app.screenshot.label"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

@end
