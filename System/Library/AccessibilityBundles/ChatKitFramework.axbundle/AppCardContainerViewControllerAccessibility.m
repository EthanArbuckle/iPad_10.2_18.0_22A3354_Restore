@implementation AppCardContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ChatKit.AppCardContainerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ChatKit.AppCardContainerViewController"), CFSTR("viewDidLayoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ChatKit.AppCardContainerViewController"), CFSTR("remoteViewController"), "UIViewController & CKBrowserViewControllerProtocol");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("view"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("_UIRemoteView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISheetPresentationController"), CFSTR("_currentPresentedViewFrame"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISheetPresentationController"), CFSTR("selectedDetentIdentifier"), "@", 0);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  char v12;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AppCardContainerViewControllerAccessibility;
  -[AppCardContainerViewControllerAccessibility viewDidLayoutSubviews](&v16, sel_viewDidLayoutSubviews);
  -[AppCardContainerViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("remoteViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityFindSubviewDescendant:", &__block_literal_global_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetUsesScrollParentForOrdering:", 0);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__AppCardContainerViewControllerAccessibility_viewDidLayoutSubviews__block_invoke_2;
  v13[3] = &unk_2501B1CB8;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v5, "_setAccessibilityFrameForSortingBlock:", v13);
  v12 = 0;
  objc_opt_class();
  objc_msgSend(v5, "accessibilityElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __68__AppCardContainerViewControllerAccessibility_viewDidLayoutSubviews__block_invoke_3;
  v10[3] = &unk_2501B1C70;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "_setAccessibilityRemoteElementShouldHitTestHostProcessBlock:", v10);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

uint64_t __68__AppCardContainerViewControllerAccessibility_viewDidLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("_UIRemoteView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

double __68__AppCardContainerViewControllerAccessibility_viewDidLayoutSubviews__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("sheetPresentationController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeCGRectForKey:", CFSTR("_currentPresentedViewFrame"));
  v4 = v3;

  return v4;
}

uint64_t __68__AppCardContainerViewControllerAccessibility_viewDidLayoutSubviews__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("sheetPresentationController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("selectedDetentIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7D88]) ^ 1;
  return v4;
}

@end
