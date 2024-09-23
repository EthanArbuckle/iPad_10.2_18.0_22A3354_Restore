@implementation TabDocumentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TabDocument");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabDocument"), CFSTR("setActive:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabDocument"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabDocument"), CFSTR("isActive"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabDocument"), CFSTR("_webView:takeFocus:"), "v", "@", "q", 0);

}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  char v5;
  objc_super v6;

  v3 = a3;
  v5 = -[TabDocumentAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isActive"));
  v6.receiver = self;
  v6.super_class = (Class)TabDocumentAccessibility;
  -[TabDocumentAccessibility setActive:](&v6, sel_setActive_, v3);
  if (v3 && (v5 & 1) == 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)_webView:(id)a3 takeFocus:(int64_t)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  if ((objc_msgSend(v6, "_accessibilityIsFKARunningForFocusItem") & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)TabDocumentAccessibility;
    -[TabDocumentAccessibility _webView:takeFocus:](&v7, sel__webView_takeFocus_, v6, a4);
  }

}

@end
