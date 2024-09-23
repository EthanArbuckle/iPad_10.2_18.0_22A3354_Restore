@implementation YearViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("YearViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("EKUIYearMonthView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("YearViewController"), CFSTR("bestDateForNewEvent"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("InfiniteScrollViewController"), CFSTR("showDate: animated: completionBlock:"), "v", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("InfiniteScrollViewController"), CFSTR("scrollView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("YearViewController"), CFSTR("InfiniteScrollViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("YearViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("YearViewController"), CFSTR("InfiniteScrollViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKUIYearMonthView"), CFSTR("_todayIndex"), "q");

}

- (void)_axAnnotateView
{
  void *v2;
  void *v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilitySetIdentification:", CFSTR("_AXYearViewIdentifier"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)YearViewControllerAccessibility;
  -[YearViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[YearViewControllerAccessibility _axAnnotateView](self, "_axAnnotateView");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)YearViewControllerAccessibility;
  -[YearViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[YearViewControllerAccessibility _axAnnotateView](self, "_axAnnotateView");
}

- (id)accessibilityScrollStatusForScrollView:(id)a3
{
  void *v3;
  char isKindOfClass;
  uint64_t v5;
  void *v6;
  void *v7;

  -[YearViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bestDateForNewEvent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v3, "date");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if ((isKindOfClass & 1) != 0)
  {
    MEMORY[0x2349148D0](v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _AXAssert();
    v7 = 0;
  }

  return v7;
}

- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;
  _QWORD v13[5];
  id v14;

  v5 = a4;
  v8 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__YearViewControllerAccessibility_showDate_animated_completionBlock___block_invoke;
  v13[3] = &unk_25027D4B8;
  v13[4] = self;
  v14 = v8;
  v9 = v8;
  v10 = a3;
  v11 = (void *)MEMORY[0x234914B7C](v13);
  v12.receiver = self;
  v12.super_class = (Class)YearViewControllerAccessibility;
  -[YearViewControllerAccessibility showDate:animated:completionBlock:](&v12, sel_showDate_animated_completionBlock_, v10, v5, v11);

}

void __69__YearViewControllerAccessibility_showDate_animated_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id argument;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  if (objc_msgSend(*(id *)(a1 + 32), "_accessibilityBoolValueForKey:", CFSTR("_AXShouldFocusOnTodayStorageKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("view"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilityFindSubviewDescendant:", &__block_literal_global_7);
    argument = (id)objc_claimAutoreleasedReturnValue();

    UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], argument);
  }
}

BOOL __69__YearViewControllerAccessibility_showDate_animated_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  NSClassFromString(CFSTR("EKUIYearMonthView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("_todayIndex"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue") != -1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)scrollView
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)YearViewControllerAccessibility;
  -[YearViewControllerAccessibility scrollView](&v5, sel_scrollView);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityContainerType:", 4);
  accessibilityLocalizedString(CFSTR("years.container"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

@end
