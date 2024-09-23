@implementation PKPaymentAuthorizationSummaryItemsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentAuthorizationSummaryItemsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityPaymentSummaryItemsElements
{
  JUMPOUT(0x234918CC4);
}

- (void)_setAccessibilityPaymentSummaryItemsElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentAuthorizationSummaryItemsView"), CFSTR("_titleViews"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentAuthorizationSummaryItemsView"), CFSTR("_labelViews"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentAuthorizationSummaryItemsView"), CFSTR("_valueViews"), "NSMutableArray");

}

- (id)accessibilityElements
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, unint64_t);
  void *v14;
  id v15;
  id v16;
  PKPaymentAuthorizationSummaryItemsViewAccessibility *v17;
  id v18;
  id v19;
  id location;

  -[PKPaymentAuthorizationSummaryItemsViewAccessibility _accessibilityPaymentSummaryItemsElements](self, "_accessibilityPaymentSummaryItemsElements");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_initWeak(&location, self);
    -[PKPaymentAuthorizationSummaryItemsViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_titleViews"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationSummaryItemsViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_labelViews"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationSummaryItemsViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_valueViews"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __76__PKPaymentAuthorizationSummaryItemsViewAccessibility_accessibilityElements__block_invoke;
    v14 = &unk_2502E3CF8;
    v8 = v4;
    v15 = v8;
    v9 = v6;
    v16 = v9;
    v17 = self;
    objc_copyWeak(&v19, &location);
    v3 = v7;
    v18 = v3;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v11);
    -[PKPaymentAuthorizationSummaryItemsViewAccessibility _setAccessibilityPaymentSummaryItemsElements:](self, "_setAccessibilityPaymentSummaryItemsElements:", v3, v11, v12, v13, v14);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __76__PKPaymentAuthorizationSummaryItemsViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a2;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a3)
  {
    v8 = 0;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "axSafeObjectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v20 = v5;
  if (objc_msgSend(*(id *)(a1 + 40), "count") <= a3)
  {
    v10 = 0;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "axSafeObjectAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", *(_QWORD *)(a1 + 48));
  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  __UIAccessibilityCastAsClass();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "size");
  objc_msgSend(v6, "size");
  objc_msgSend(v10, "size");
  objc_msgSend(v13, "origin");
  v15 = v14;
  objc_msgSend(v6, "origin");
  objc_msgSend(v11, "setAccessibilityFrameInContainerSpace:", v15);
  objc_msgSend(v8, "accessibilityLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityLabel:", v19, v17, v18, CFSTR("__AXStringForVariablesSentinel"));

  objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
}

@end
