@implementation FMCardContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FindMy.FMCardContainerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("FindMy.FMCardContainerViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FindMy.FMCardContainerViewController"), CFSTR("handleCloseAction"), "v", 0);
  objc_msgSend(v3, "validateClass:hasSwiftFieldOfAnyClass:", CFSTR("FindMy.FMCardContainerViewController"), CFSTR("passthroughView"));
  objc_msgSend(v3, "validateClass:", CFSTR("FindMy.FMMapOptionsView"));
  objc_msgSend(v3, "validateClass:", CFSTR("MKMapView"));

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMCardContainerViewControllerAccessibility;
  -[FMCardContainerViewControllerAccessibility viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[FMCardContainerViewControllerAccessibility _accessibilityManageFMMapOptionsView](self, "_accessibilityManageFMMapOptionsView");
}

- (void)_accessibilityManageFMMapOptionsView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_opt_class();
  -[FMCardContainerViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("passthroughView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityFindSubviewDescendant:", &__block_literal_global_196);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityFindSubviewDescendant:", &__block_literal_global_197);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityElementsHidden:", objc_msgSend(v6, "_accessibilityIsVisibleByCompleteHitTest") ^ 1);

}

uint64_t __82__FMCardContainerViewControllerAccessibility__accessibilityManageFMMapOptionsView__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessibilityIdentification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("FMMainView"));

  return v3;
}

uint64_t __82__FMCardContainerViewControllerAccessibility__accessibilityManageFMMapOptionsView__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x23490EA68](CFSTR("FindMy.FMMapOptionsView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __82__FMCardContainerViewControllerAccessibility__accessibilityManageFMMapOptionsView__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x23490EA68](CFSTR("MKMapView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)handleCloseAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMCardContainerViewControllerAccessibility;
  -[FMCardContainerViewControllerAccessibility handleCloseAction](&v7, sel_handleCloseAction);
  objc_opt_class();
  -[FMCardContainerViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("passthroughView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_200, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityFindSubviewDescendant:", &__block_literal_global_201);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityElementsHidden:", 0);

}

uint64_t __63__FMCardContainerViewControllerAccessibility_handleCloseAction__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessibilityIdentification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("FMMainView"));

  return v3;
}

uint64_t __63__FMCardContainerViewControllerAccessibility_handleCloseAction__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x23490EA68](CFSTR("FindMy.FMMapOptionsView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
