@implementation AVMobileChromelessContentTabsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVMobileChromelessContentTabsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessContentTabsViewController"), CFSTR("contentTabsView:didChangeContentTab:withReason:"), "v", "@", "@", "Q", 0);
}

- (void)contentTabsView:(id)a3 didChangeContentTab:(id)a4 withReason:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  id location;
  objc_super v12;

  v8 = a3;
  v9 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVMobileChromelessContentTabsViewControllerAccessibility;
  -[AVMobileChromelessContentTabsViewControllerAccessibility contentTabsView:didChangeContentTab:withReason:](&v12, sel_contentTabsView_didChangeContentTab_withReason_, v8, v9, a5);
  objc_initWeak(&location, v8);
  objc_copyWeak(&v10, &location);
  AXPerformBlockOnMainThreadAfterDelay();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __107__AVMobileChromelessContentTabsViewControllerAccessibility_contentTabsView_didChangeContentTab_withReason___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityFindSubviewDescendant:", &__block_literal_global_6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v1);

}

uint64_t __107__AVMobileChromelessContentTabsViewControllerAccessibility_contentTabsView_didChangeContentTab_withReason___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  char v3;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    NSClassFromString(CFSTR("AVMobileChromelessContentTabsViewController"));
    v3 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    v3 = 0;
  }

  return v3 & 1;
}

@end
