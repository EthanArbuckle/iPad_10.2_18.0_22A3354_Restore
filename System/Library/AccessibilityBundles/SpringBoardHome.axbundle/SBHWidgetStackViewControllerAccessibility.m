@implementation SBHWidgetStackViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHWidgetStackViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHWidgetStackViewController"), CFSTR("pageControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHWidgetStackViewController"), CFSTR("scrollView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHWidgetStackViewController"), CFSTR("icon"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHWidgetStackViewController"), CFSTR("scrollViewDidEndScrolling:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHWidgetStackViewController"), CFSTR("_updateActiveWidgetIndexAndScrollViewContentOffset"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLeafIcon"), CFSTR("iconDataSources"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLeafIcon"), CFSTR("activeDataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBWidgetIcon"), CFSTR("SBLeafIcon"));
  objc_msgSend(v3, "validateClass:", CFSTR("_UIScenePresentationView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHWidget"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHSiriSuggestionsElement"), CFSTR("displayName"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHWidgetStackViewControllerAccessibility;
  -[SBHWidgetStackViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SBHWidgetStackViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  -[SBHWidgetStackViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("iconDataSources"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 2)
    return 0;
  v7 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("widget.icon.action.next"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:target:selector:", v8, self, sel__accessibilityScrollToNextWidget);

  v10 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("widget.icon.action.previous"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:target:selector:", v11, self, sel__accessibilityScrollToPreviousWidget);

  v14[0] = v9;
  v14[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)_accessibilityScrollToPreviousWidget
{
  return -[SBHWidgetStackViewControllerAccessibility _accessibilityScrollToWidgetNext:](self, "_accessibilityScrollToWidgetNext:", 0);
}

- (BOOL)_accessibilityScrollToNextWidget
{
  return -[SBHWidgetStackViewControllerAccessibility _accessibilityScrollToWidgetNext:](self, "_accessibilityScrollToWidgetNext:", 1);
}

- (BOOL)_accessibilityScrollToWidgetNext:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  AXPerformSafeBlock();
  objc_opt_class();
  -[SBHWidgetStackViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("scrollView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], v6);
  if (v3)
    objc_msgSend(v6, "accessibilityScrollDownPage");
  else
    objc_msgSend(v6, "accessibilityScrollUpPage");
  v7 = v6;
  AXPerformBlockOnMainThreadAfterDelay();

  return 1;
}

uint64_t __78__SBHWidgetStackViewControllerAccessibility__accessibilityScrollToWidgetNext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateActiveWidgetIndexAndScrollViewContentOffset");
}

void __78__SBHWidgetStackViewControllerAccessibility__accessibilityScrollToWidgetNext___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = MEMORY[0x24BDAC760];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  AXPerformSafeBlock();
  objc_msgSend(*(id *)(a1 + 40), "setIsAccessibilityElement:", 0, v3, 3221225472, __78__SBHWidgetStackViewControllerAccessibility__accessibilityScrollToWidgetNext___block_invoke_3, &unk_250383B68, v4);
  objc_msgSend(*(id *)(a1 + 40), "_accessibilityDescendantOfType:", NSClassFromString(CFSTR("_UIScenePresentationView")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v2);

}

uint64_t __78__SBHWidgetStackViewControllerAccessibility__accessibilityScrollToWidgetNext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scrollViewDidEndScrolling:", *(_QWORD *)(a1 + 40));
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  -[SBHWidgetStackViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeArrayForKey:", CFSTR("iconDataSources"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 < 2)
  {
LABEL_5:
    v9.receiver = self;
    v9.super_class = (Class)SBHWidgetStackViewControllerAccessibility;
    return -[SBHWidgetStackViewControllerAccessibility accessibilityScroll:](&v9, sel_accessibilityScroll_, a3);
  }
  if (a3 != 4)
  {
    if (a3 == 3)
      return -[SBHWidgetStackViewControllerAccessibility _accessibilityScrollToPreviousWidget](self, "_accessibilityScrollToPreviousWidget");
    goto LABEL_5;
  }
  return -[SBHWidgetStackViewControllerAccessibility _accessibilityScrollToNextWidget](self, "_accessibilityScrollToNextWidget");
}

- (id)accessibilityScrollStatusForScrollView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  -[SBHWidgetStackViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("iconDataSources"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("activeDataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeStringForKey:", CFSTR("displayName"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("widget.stack.scroll.status"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v11 = v8;
  else
    v11 = &stru_250385500;
  objc_msgSend(v9, "localizedStringWithFormat:", v10, v11, v6 + 1, objc_msgSend(v4, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
