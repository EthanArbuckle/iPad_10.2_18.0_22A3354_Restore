@implementation SUStorePageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUStorePageViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_handleViewControllerBecameReady:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUStorePageViewControllerAccessibility;
  -[SUStorePageViewControllerAccessibility _handleViewControllerBecameReady:](&v3, sel__handleViewControllerBecameReady_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (BOOL)reloadForSectionsWithGroup:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUStorePageViewControllerAccessibility;
  v4 = -[SUStorePageViewControllerAccessibility reloadForSectionsWithGroup:](&v8, sel_reloadForSectionsWithGroup_, a3);
  -[SUStorePageViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_segmentedControl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeValueForKey:", CFSTR("_accessibilityContentLanguage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLanguage:", v6);

  return v4;
}

- (void)_setActiveChildViewController:(id)a3 shouldTearDown:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  char isKindOfClass;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  -[SUStorePageViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_activeChildViewController"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SUPlaceholderViewController"));
  isKindOfClass = objc_opt_isKindOfClass();
  v9.receiver = self;
  v9.super_class = (Class)SUStorePageViewControllerAccessibility;
  -[SUStorePageViewControllerAccessibility _setActiveChildViewController:shouldTearDown:](&v9, sel__setActiveChildViewController_shouldTearDown_, v6, v4);

  if (v7 != v6 && (isKindOfClass & 1) != 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

@end
