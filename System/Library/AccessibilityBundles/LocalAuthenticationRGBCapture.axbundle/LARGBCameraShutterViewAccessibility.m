@implementation LARGBCameraShutterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LARGBCameraShutterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("camera.button"));
}

@end
