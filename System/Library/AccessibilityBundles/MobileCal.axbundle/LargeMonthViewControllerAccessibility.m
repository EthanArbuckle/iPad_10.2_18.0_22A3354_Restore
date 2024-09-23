@implementation LargeMonthViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LargeMonthViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("LargeMonthWeekView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("LargeMonthViewController"), CFSTR("InfiniteScrollViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("InfiniteScrollViewController"), CFSTR("showDate: animated: completionBlock:"), "v", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LargeMonthWeekView"), CFSTR("todayDay"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LargeMonthWeekView"), CFSTR("dayIndexForToday"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LargeMonthWeekView"), CFSTR("_dayNumberLabels"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LargeMonthViewController"), CFSTR("_draggedStartDate"), "EKCalendarDate");

}

- (id)_axTopWeekViewWithTopPoint:(CGPoint)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[LargeMonthViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_views"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(MEMORY[0x24BEBADC8], "options");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setShouldOnlyIncludeElementsWithVisibleFrame:", 1);
        objc_msgSend(v7, "_accessibilityLeafDescendantsWithCount:options:", 1, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
        {
          v4 = v7;

          goto LABEL_11;
        }

      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LargeMonthViewControllerAccessibility;
  -[LargeMonthViewControllerAccessibility showDate:animated:completionBlock:](&v6, sel_showDate_animated_completionBlock_, a3, a4, a5);
  if (-[LargeMonthViewControllerAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("_AXShouldFocusOnTodayStorageKey")))AXPerformBlockOnMainThreadAfterDelay();
}

void __75__LargeMonthViewControllerAccessibility_showDate_animated_completionBlock___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("view"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityFindSubviewDescendant:", &__block_literal_global_4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeValueForKey:", CFSTR("_dayNumberLabels"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("dayIndexForToday"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", objc_msgSend(v3, "integerValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], v4);
}

BOOL __75__LargeMonthViewControllerAccessibility_showDate_animated_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  NSClassFromString(CFSTR("LargeMonthWeekView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("todayDay"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue") != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
