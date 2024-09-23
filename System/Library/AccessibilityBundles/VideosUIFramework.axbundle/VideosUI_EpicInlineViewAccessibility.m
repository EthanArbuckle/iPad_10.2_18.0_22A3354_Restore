@implementation VideosUI_EpicInlineViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.EpicInlineView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VideosUI.EpicInlineView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:", CFSTR("VideosUI.VerticalStackView"));
  objc_msgSend(v3, "validateClass:", CFSTR("VUILabel"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)VideosUI_EpicInlineViewAccessibility;
  -[VideosUI_EpicInlineViewAccessibility _accessibilityLoadAccessibilityInformation](&v14, sel__accessibilityLoadAccessibilityInformation);
  -[VideosUI_EpicInlineViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_189);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    v8 = *MEMORY[0x24BDF73C0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "setAccessibilityTraits:", v8 | objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "accessibilityTraits"));
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VideosUI_EpicInlineViewAccessibility;
  -[VideosUI_EpicInlineViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[VideosUI_EpicInlineViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
