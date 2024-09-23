@implementation SBIconWidgetIntroductionPopoverViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBIconWidgetIntroductionPopoverView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end
