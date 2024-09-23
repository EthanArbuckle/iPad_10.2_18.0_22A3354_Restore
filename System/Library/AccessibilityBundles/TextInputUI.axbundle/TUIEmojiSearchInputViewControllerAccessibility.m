@implementation TUIEmojiSearchInputViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TUIEmojiSearchInputViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("TUIEmojiSearchInputViewController"), CFSTR("UIViewController"));
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIEmojiSearchInputViewControllerAccessibility;
  -[TUIEmojiSearchInputViewControllerAccessibility viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  accessibilityLocalizedString(CFSTR("emoji.search.hidden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();

}

@end
