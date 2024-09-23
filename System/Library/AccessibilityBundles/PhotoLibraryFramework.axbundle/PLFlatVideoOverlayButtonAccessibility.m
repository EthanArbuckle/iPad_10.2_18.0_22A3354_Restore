@implementation PLFlatVideoOverlayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLFlatVideoOverlayButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("play.video.button.txt"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("Play video");
}

@end
