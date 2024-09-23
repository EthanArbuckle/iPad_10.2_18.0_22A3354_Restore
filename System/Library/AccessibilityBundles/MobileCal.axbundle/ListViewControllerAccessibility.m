@implementation ListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ListViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUIKCalendarModel"), CFSTR("dateForCachedOccurrencesInSection: usingFilter:"), "@", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ListViewController"), CFSTR("showFilteredData"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ListViewController"), CFSTR("tableView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ListViewController"), CFSTR("MainViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MainViewController"), CFSTR("_model"), "CUIKCalendarModel");

}

- (id)_axCalendarModel
{
  return (id)-[ListViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("model"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ListViewControllerAccessibility;
  -[ListViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[ListViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "safeValueForKey:", CFSTR("reloadData"));

}

- (BOOL)_accessibilityIsDateInCurrentYear:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  v4 = a3;
  objc_opt_class();
  -[ListViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BE13FF0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendarDateWithDate:timeZone:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "calendarDateForYear");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "calendarDateForEndOfYear");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "compare:", v14) == -1)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v13, "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v4, "compare:", v15) != 1;

  }
  return v16;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ListViewControllerAccessibility;
  -[ListViewControllerAccessibility tableView:viewForHeaderInSection:](&v11, sel_tableView_viewForHeaderInSection_, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ListViewControllerAccessibility _axCalendarModel](self, "_axCalendarModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  v7 = v6;
  AXPerformSafeBlock();
  v8 = v10;

  return v8;
}

void __68__ListViewControllerAccessibility_tableView_viewForHeaderInSection___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dateForCachedOccurrencesInSection:usingFilter:", *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "safeBoolForKey:", CFSTR("showFilteredData")));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "_accessibilityIsDateInCurrentYear:"))
    _AXGetYearlessStringForDay();
  else
    _AXGetStringForDay();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setAccessibilityLabel:", v2);
  objc_msgSend(*(id *)(a1 + 48), "setIsAccessibilityElement:", 1);

}

@end
