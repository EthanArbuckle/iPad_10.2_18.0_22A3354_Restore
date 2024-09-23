@implementation GKDashboardPlayerPhotoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKDashboardPlayerPhotoView");
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
  return AXGameCenterUIFrameworkLocString(CFSTR("PLAYER_PHOTO"));
}

@end
