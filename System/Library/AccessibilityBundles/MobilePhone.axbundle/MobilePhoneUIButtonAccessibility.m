@implementation MobilePhoneUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityKeyboardKeyAllowsTouchTyping
{
  void *v3;
  char v4;
  objc_super v6;

  -[MobilePhoneUIButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("DeleteButton"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)MobilePhoneUIButtonAccessibility;
  return -[MobilePhoneUIButtonAccessibility _accessibilityKeyboardKeyAllowsTouchTyping](&v6, sel__accessibilityKeyboardKeyAllowsTouchTyping);
}

@end
