@implementation BCChatButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BCChatButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCChatButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[BCChatButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("bc.chat.with.messages"));
}

@end
