@implementation TUIEmojiSearchTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TUIEmojiSearchTextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityTextInputProxiesForRealTextView
{
  return _AXSHoverTextTypingEnabled() == 0;
}

@end
