@implementation TVRUIButtonPanelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVRUIButtonPanelView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("controls.container.label"));
}

@end
