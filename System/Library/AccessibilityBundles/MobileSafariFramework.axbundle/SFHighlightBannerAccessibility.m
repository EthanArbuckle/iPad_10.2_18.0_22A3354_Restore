@implementation SFHighlightBannerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFHighlightBanner");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFHighlightBanner"), CFSTR("initWithHighlight:"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFHighlightBanner"), CFSTR("_close"), "v", 0);

}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFHighlightBannerAccessibility;
  -[SFHighlightBannerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SFHighlightBannerAccessibility _accessibilityMarkupButton](self, "_accessibilityMarkupButton");
}

- (void)_accessibilityMarkupButton
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v10, "actionsForTarget:forControlEvent:", self, 64);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "containsObject:", CFSTR("_close"));

          if (v12)
          {
            accessibilitySafariServicesLocalizedString(CFSTR("dismiss.shared.with.you.banner"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setAccessibilityLabel:", v13);

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (SFHighlightBannerAccessibility)initWithHighlight:(id)a3
{
  SFHighlightBannerAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFHighlightBannerAccessibility;
  v3 = -[SFHighlightBannerAccessibility initWithHighlight:](&v5, sel_initWithHighlight_, a3);
  -[SFHighlightBannerAccessibility _accessibilityMarkupButton](v3, "_accessibilityMarkupButton");

  return v3;
}

@end
