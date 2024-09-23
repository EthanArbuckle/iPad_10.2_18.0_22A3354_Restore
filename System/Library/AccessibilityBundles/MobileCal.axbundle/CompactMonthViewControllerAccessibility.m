@implementation CompactMonthViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CompactMonthViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CompactMonthWeekView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CompactMonthViewController"), CFSTR("InfiniteScrollViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("InfiniteScrollViewController"), CFSTR("showDate: animated: completionBlock:"), "v", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompactMonthWeekView"), CFSTR("_today"), "CompactMonthWeekDayNumber");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("InfiniteScrollViewController"), CFSTR("_views"), "NSMutableArray");

}

- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CompactMonthViewControllerAccessibility;
  -[CompactMonthViewControllerAccessibility showDate:animated:completionBlock:](&v6, sel_showDate_animated_completionBlock_, a3, a4, a5);
  if (-[CompactMonthViewControllerAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("_AXShouldFocusOnTodayStorageKey")))AXPerformBlockOnMainThreadAfterDelay();
}

void __77__CompactMonthViewControllerAccessibility_showDate_animated_completionBlock___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("view"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityFindSubviewDescendant:", &__block_literal_global_1);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v1) = *MEMORY[0x24BEBB030];
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_today"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v1, v2);

}

BOOL __77__CompactMonthViewControllerAccessibility_showDate_animated_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  NSClassFromString(CFSTR("CompactMonthWeekView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("_today"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
