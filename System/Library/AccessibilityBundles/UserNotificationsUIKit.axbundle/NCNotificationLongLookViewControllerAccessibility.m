@implementation NCNotificationLongLookViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationLongLookViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  if (AXProcessIsSpringBoard())
  {
    objc_msgSend(v3, "validateClass:", CFSTR("SBFPagedScrollView"));
    objc_msgSend(v3, "validateClass:", CFSTR("SBBannerWindow"));
  }
  objc_msgSend(v3, "validateClass:", CFSTR("_UIInteractiveHighlightContentView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NCNotificationLongLookViewController"), CFSTR("UIViewController"));

}

- (void)viewDidAppear:(BOOL)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationLongLookViewControllerAccessibility;
  -[NCNotificationLongLookViewControllerAccessibility viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[NCNotificationLongLookViewControllerAccessibility _axSetModalAncestorsModal:](self, "_axSetModalAncestorsModal:", 1);
  v4 = *MEMORY[0x24BDF72C8];
  -[NCNotificationLongLookViewControllerAccessibility _axLongLookView](self, "_axLongLookView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationLongLookViewControllerAccessibility;
  -[NCNotificationLongLookViewControllerAccessibility viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[NCNotificationLongLookViewControllerAccessibility _axSetModalAncestorsModal:](self, "_axSetModalAncestorsModal:", 0);
}

- (id)_axLongLookView
{
  void *v2;
  void *v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_axSetModalAncestorsModal:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  -[NCNotificationLongLookViewControllerAccessibility _axLongLookView](self, "_axLongLookView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NCNotificationLongLookViewControllerAccessibility _axModalAncestorsForLongLookView:](self, "_axModalAncestorsForLongLookView:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setAccessibilityViewIsModal:", v3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)_axModalAncestorsForLongLookView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v4, "_accessibilityWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationLongLookViewControllerAccessibility _axNotificationBannerWindowClass](self, "_axNotificationBannerWindowClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "addObject:", v6);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __86__NCNotificationLongLookViewControllerAccessibility__axModalAncestorsForLongLookView___block_invoke;
  v12[3] = &unk_2503BE110;
  v12[4] = self;
  v7 = v5;
  v13 = v7;
  v8 = (id)objc_msgSend(v4, "_accessibilityFindViewAncestor:startWithSelf:", v12, 1);
  v9 = v13;
  v10 = v7;

  return v10;
}

uint64_t __86__NCNotificationLongLookViewControllerAccessibility__axModalAncestorsForLongLookView___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_ax_UIInteractiveHighlightContentViewClass");
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "_axPagedScrollViewClass"), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    if (objc_msgSend(*(id *)(a1 + 40), "count") == 2)
      *a3 = 1;
  }

  return 0;
}

- (Class)_ax_UIInteractiveHighlightContentViewClass
{
  if (_ax_UIInteractiveHighlightContentViewClass_onceToken != -1)
    dispatch_once(&_ax_UIInteractiveHighlightContentViewClass_onceToken, &__block_literal_global_7);
  return (Class)(id)_ax_UIInteractiveHighlightContentViewClass__UIInteractiveHighlightContentViewClass;
}

uint64_t __95__NCNotificationLongLookViewControllerAccessibility__ax_UIInteractiveHighlightContentViewClass__block_invoke()
{
  uint64_t result;

  result = MEMORY[0x2349233D4](CFSTR("_UIInteractiveHighlightContentView"));
  _ax_UIInteractiveHighlightContentViewClass__UIInteractiveHighlightContentViewClass = result;
  return result;
}

- (Class)_axPagedScrollViewClass
{
  if (_axPagedScrollViewClass_onceToken != -1)
    dispatch_once(&_axPagedScrollViewClass_onceToken, &__block_literal_global_195);
  return (Class)(id)_axPagedScrollViewClass_SBFPagedScrollViewClass;
}

uint64_t __76__NCNotificationLongLookViewControllerAccessibility__axPagedScrollViewClass__block_invoke()
{
  uint64_t result;

  result = MEMORY[0x2349233D4](CFSTR("SBFPagedScrollView"));
  _axPagedScrollViewClass_SBFPagedScrollViewClass = result;
  return result;
}

- (Class)_axNotificationBannerWindowClass
{
  if (_axNotificationBannerWindowClass_onceToken != -1)
    dispatch_once(&_axNotificationBannerWindowClass_onceToken, &__block_literal_global_196);
  return (Class)(id)_axNotificationBannerWindowClass_SBBannerWindowClass;
}

uint64_t __85__NCNotificationLongLookViewControllerAccessibility__axNotificationBannerWindowClass__block_invoke()
{
  uint64_t result;

  result = MEMORY[0x2349233D4](CFSTR("SBBannerWindow"));
  _axNotificationBannerWindowClass_SBBannerWindowClass = result;
  return result;
}

@end
