@implementation HUTimerCancelButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUTimerCancelButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityHomeUILocalizedString(CFSTR("cancel.timer"));
}

@end
