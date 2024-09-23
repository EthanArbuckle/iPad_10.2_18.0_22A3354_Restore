@implementation NowPlayingQueueHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Music.NowPlayingQueueHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Music.NowPlayingQueueHeaderView"), CFSTR("clearButton"), "UIButton");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[NowPlayingQueueHeaderViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("clearButton"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)NowPlayingQueueHeaderViewAccessibility;
  -[NowPlayingQueueHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
}

@end
