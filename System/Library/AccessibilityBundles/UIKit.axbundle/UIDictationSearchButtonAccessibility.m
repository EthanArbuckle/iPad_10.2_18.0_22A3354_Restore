@implementation UIDictationSearchButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDictationSearchButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return (id)UIKitAccessibilityLocalizedString();
}

- (id)accessibilityHint
{
  return (id)UIKitAccessibilityLocalizedString();
}

- (id)accessibilityIdentifier
{
  return CFSTR("Dictate");
}

@end
