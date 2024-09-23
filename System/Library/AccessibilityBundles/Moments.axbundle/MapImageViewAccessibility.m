@implementation MapImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MomentsUIService.mapImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityJurassicLocalizedString(CFSTR("map"));
}

@end
