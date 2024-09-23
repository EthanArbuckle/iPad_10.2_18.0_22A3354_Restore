@implementation _UIScrollsToTopInitiatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIScrollsToTopInitiatorView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldSeekHigherPriorityTouchTarget
{
  objc_super v3;
  SEL v4;
  _UIScrollsToTopInitiatorViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  if (UIAccessibilityIsVoiceOverRunning())
    return 0;
  v3.receiver = v5;
  v3.super_class = (Class)_UIScrollsToTopInitiatorViewAccessibility;
  return -[_UIScrollsToTopInitiatorViewAccessibility _shouldSeekHigherPriorityTouchTarget](&v3, sel__shouldSeekHigherPriorityTouchTarget);
}

@end
