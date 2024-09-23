@implementation SKUIVideoThumbnailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIVideoThumbnailView");
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
  return accessibilitySKUILocalizedString(CFSTR("video.play"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7408] | *MEMORY[0x24BDF73B0];
}

@end
