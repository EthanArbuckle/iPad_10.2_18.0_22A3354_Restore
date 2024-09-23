@implementation UIWebViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIWebView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_accessibilityAutomationType
{
  return 58;
}

- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIWebViewAccessibility;
  -[UIWebViewAccessibility webView:didFinishLoadForFrame:](&v4, sel_webView_didFinishLoadForFrame_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)webViewClose:(id)a3
{
  UIAccessibilityNotifications v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIWebViewAccessibility;
  -[UIWebViewAccessibility webViewClose:](&v6, sel_webViewClose_, a3);
  v3 = *MEMORY[0x24BEBB1F8];
  LODWORD(v4) = -1.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v5);

}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5
{
  UIAccessibilityNotifications v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIWebViewAccessibility;
  -[UIWebViewAccessibility webView:didFailLoadWithError:forFrame:](&v8, sel_webView_didFailLoadWithError_forFrame_, a3, a4, a5);
  v5 = *MEMORY[0x24BEBB1F8];
  LODWORD(v6) = -1.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v5, v7);

}

@end
