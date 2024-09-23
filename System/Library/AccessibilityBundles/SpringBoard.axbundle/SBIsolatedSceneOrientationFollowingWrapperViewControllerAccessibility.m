@implementation SBIsolatedSceneOrientationFollowingWrapperViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBIsolatedSceneOrientationFollowingWrapperViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIsolatedSceneOrientationFollowingWrapperViewController"), CFSTR("_contentViewController"), "UIViewController");
}

- (id)accessibilityElements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[SBIsolatedSceneOrientationFollowingWrapperViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_contentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
