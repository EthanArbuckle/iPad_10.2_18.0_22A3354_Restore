@implementation RGBLivenessCoachingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CoreIDVRGBLiveness.RGBLivenessCoachingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("stylized.animation.role"));
}

@end
