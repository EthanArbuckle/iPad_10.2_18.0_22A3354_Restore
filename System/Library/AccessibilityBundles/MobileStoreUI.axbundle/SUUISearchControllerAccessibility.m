@implementation SUUISearchControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUISearchController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUISearchController"), CFSTR("_setSuffix:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUISearchController"), CFSTR("setActive:"), "v", "B", 0);

}

- (void)setActive:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUISearchControllerAccessibility;
  -[SUUISearchControllerAccessibility setActive:](&v9, sel_setActive_, a3);
  -[SUUISearchControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("searchBar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("searchField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessibilityValue:", 0);
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_clearButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", 0);

  objc_msgSend(v5, "safeValueForKey:", CFSTR("_clearButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityHint:", 0);

  objc_msgSend(v5, "safeValueForKey:", CFSTR("_clearButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("ClearText"));

}

- (void)_setSuffix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SUUISearchControllerAccessibility;
  v4 = a3;
  -[SUUISearchControllerAccessibility _setSuffix:](&v13, sel__setSuffix_, v4);
  -[SUUISearchControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("searchBar"), v13.receiver, v13.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("searchField"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "length");
  if (v7)
  {
    objc_msgSend(v6, "safeValueForKey:", CFSTR("_clearButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("clear.search.results.button"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v9);

    objc_msgSend(v6, "safeValueForKey:", CFSTR("_clearButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("clear.search.results.hint"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityHint:", v11);

  }
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_clearButton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("ClearText"));

}

@end
