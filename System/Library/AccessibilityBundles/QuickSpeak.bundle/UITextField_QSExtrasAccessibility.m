@implementation UITextField_QSExtrasAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextField"), CFSTR("tokenizer"), "@", 0);
}

- (BOOL)_accessibilitySystemShouldShowSpeakBubbleCommon
{
  objc_super v4;

  if ((-[UITextField_QSExtrasAccessibility isSecureTextEntry](self, "isSecureTextEntry") & 1) != 0)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)UITextField_QSExtrasAccessibility;
  return -[UITextField_QSExtrasAccessibility _accessibilitySystemShouldShowSpeakBubbleCommon](&v4, sel__accessibilitySystemShouldShowSpeakBubbleCommon);
}

- (id)_accessibilityQuickSpeakTokenizer
{
  return (id)-[UITextField_QSExtrasAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tokenizer"));
}

- (id)_accessibilityQuickSpeakContent
{
  objc_super v4;

  if ((-[UITextField_QSExtrasAccessibility isSecureTextEntry](self, "isSecureTextEntry") & 1) != 0)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)UITextField_QSExtrasAccessibility;
  -[UITextField_QSExtrasAccessibility _accessibilityQuickSpeakContent](&v4, sel__accessibilityQuickSpeakContent);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
