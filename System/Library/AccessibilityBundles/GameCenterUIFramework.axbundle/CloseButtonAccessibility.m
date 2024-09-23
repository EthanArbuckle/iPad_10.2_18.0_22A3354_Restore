@implementation CloseButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GameCenterUI.CloseButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return AXGameCenterUIFrameworkLocString(CFSTR("CLOSE"));
}

@end
