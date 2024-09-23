@implementation WKWebViewAccessibility_QSExtras

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WKWebView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKWebView"), CFSTR("_currentContentView"), "@", 0);
}

- (id)_axContentView
{
  return (id)-[WKWebViewAccessibility_QSExtras safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentContentView"));
}

- (id)_accessibilityQuickSpeakContent
{
  void *v2;
  void *v3;

  -[WKWebViewAccessibility_QSExtras _axContentView](self, "_axContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityQuickSpeakContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilitySystemShouldShowSpeakBubble
{
  void *v2;
  char v3;

  -[WKWebViewAccessibility_QSExtras _axContentView](self, "_axContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilitySystemShouldShowSpeakBubble");

  return v3;
}

- (BOOL)_accessibilityShouldShowSpeakBubble
{
  void *v2;
  char v3;

  -[WKWebViewAccessibility_QSExtras _axContentView](self, "_axContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityShouldShowSpeakBubble");

  return v3;
}

- (BOOL)_accessibilityShouldShowSpeakSpellOut
{
  void *v2;
  char v3;

  -[WKWebViewAccessibility_QSExtras _axContentView](self, "_axContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityShouldShowSpeakSpellOut");

  return v3;
}

- (BOOL)_accessibilityShouldShowSpeakLanguageBubble
{
  void *v2;
  char v3;

  -[WKWebViewAccessibility_QSExtras _axContentView](self, "_axContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityShouldShowSpeakLanguageBubble");

  return v3;
}

- (BOOL)_accessibilityShouldUpdateQuickSpeakContent
{
  void *v2;
  char v3;

  -[WKWebViewAccessibility_QSExtras _axContentView](self, "_axContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityShouldUpdateQuickSpeakContent");

  return v3;
}

- (BOOL)_accessibilityQScanPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v6 = a4;
  -[WKWebViewAccessibility_QSExtras _axContentView](self, "_axContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("WKContentView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "_axWaitForSpeakSelectionContentResults");
  v10.receiver = self;
  v10.super_class = (Class)WKWebViewAccessibility_QSExtras;
  v8 = -[WKWebViewAccessibility_QSExtras _accessibilityQScanPerformAction:withSender:](&v10, sel__accessibilityQScanPerformAction_withSender_, a3, v6);

  return v8;
}

@end
