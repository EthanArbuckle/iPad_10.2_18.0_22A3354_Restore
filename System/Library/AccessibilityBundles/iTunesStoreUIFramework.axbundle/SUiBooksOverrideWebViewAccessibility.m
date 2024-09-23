@implementation SUiBooksOverrideWebViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUWebView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsScrollAncestor
{
  void *v3;
  char isKindOfClass;
  objc_super v6;

  if (_accessibilityIsScrollAncestor_onceToken != -1)
    dispatch_once(&_accessibilityIsScrollAncestor_onceToken, &__block_literal_global_0);
  if (_accessibilityIsScrollAncestor_isBadVersionOfiBooks == 1)
  {
    -[SUiBooksOverrideWebViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("BKWebViewController"));
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      return 1;
    else
      return -[SUiBooksOverrideWebViewAccessibility _accessibilitySUWebViewIsScrollAncestor](self, "_accessibilitySUWebViewIsScrollAncestor");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SUiBooksOverrideWebViewAccessibility;
    return -[SUiBooksOverrideWebViewAccessibility _accessibilityIsScrollAncestor](&v6, sel__accessibilityIsScrollAncestor);
  }
}

void __70__SUiBooksOverrideWebViewAccessibility__accessibilityIsScrollAncestor__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.iBooks"));

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "infoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBD1E0]);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "compare:options:", CFSTR("2.2"), 64) == -1)
      _accessibilityIsScrollAncestor_isBadVersionOfiBooks = 1;

  }
}

@end
