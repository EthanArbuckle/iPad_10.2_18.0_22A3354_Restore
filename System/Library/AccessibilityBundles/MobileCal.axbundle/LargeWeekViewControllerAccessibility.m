@implementation LargeWeekViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LargeWeekViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("WeekAllDayView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WeekAllDayView"), CFSTR("_dayIndexForToday"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LargeWeekViewController"), CFSTR("selectDate: animated:"), "v", "@", "B", 0);

}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LargeWeekViewControllerAccessibility;
  -[LargeWeekViewControllerAccessibility selectDate:animated:](&v5, sel_selectDate_animated_, a3, a4);
  if (-[LargeWeekViewControllerAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("_AXShouldFocusOnTodayStorageKey")))AXPerformBlockOnMainThreadAfterDelay();
}

void __60__LargeWeekViewControllerAccessibility_selectDate_animated___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("view"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityFindSubviewDescendant:", &__block_literal_global_5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "safeValueForKey:", CFSTR("_dayIndexForToday"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__LargeWeekViewControllerAccessibility_selectDate_animated___block_invoke_3;
  v6[3] = &__block_descriptor_40_e8_B16__0_8l;
  v6[4] = v4;
  objc_msgSend(v2, "_accessibilityFindDescendant:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], v5);

}

BOOL __60__LargeWeekViewControllerAccessibility_selectDate_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  NSClassFromString(CFSTR("WeekAllDayView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("_dayIndexForToday"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue") != -1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

BOOL __60__LargeWeekViewControllerAccessibility_selectDate_animated___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "dayIndex") == *(_QWORD *)(a1 + 32);

  return v4;
}

@end
