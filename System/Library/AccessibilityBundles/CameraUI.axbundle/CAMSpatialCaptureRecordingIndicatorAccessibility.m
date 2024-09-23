@implementation CAMSpatialCaptureRecordingIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMSpatialCaptureRecordingIndicator");
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
  return accessibilityCameraUILocalizedString(CFSTR("recording.spatial.video"));
}

@end
