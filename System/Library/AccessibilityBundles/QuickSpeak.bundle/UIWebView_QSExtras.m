@implementation UIWebView_QSExtras

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIWebView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilitySpeak:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIWebView_QSExtras safeValueForKey:](self, "safeValueForKey:", CFSTR("_internal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("browserView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_accessibilitySpeak:", v6);

}

- (id)_accessibilitySpeakSelectionTextInputResponder
{
  void *v2;
  void *v3;

  -[UIWebView_QSExtras safeValueForKey:](self, "safeValueForKey:", CFSTR("_internal"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("browserView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_accessibilityPauseSpeaking:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIWebView_QSExtras safeValueForKey:](self, "safeValueForKey:", CFSTR("_internal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("browserView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_accessibilityPauseSpeaking:", v6);

}

@end
