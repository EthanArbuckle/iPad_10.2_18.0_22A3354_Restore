@implementation ComposeButtonItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ComposeButtonItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("compose.button.hint"));
}

- (id)accessibilityLabel
{
  return (id)UIKitAccessibilityLocalizedString();
}

@end
