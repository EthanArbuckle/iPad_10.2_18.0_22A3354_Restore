@implementation VideosUI_OverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.OverlayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.OverlayView"), CFSTR("accessibilityTitleLabel"), "@");
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[VideosUI_OverlayViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityTitleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
