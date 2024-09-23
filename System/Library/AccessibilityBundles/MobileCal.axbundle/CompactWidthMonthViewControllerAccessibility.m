@implementation CompactWidthMonthViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CompactWidthMonthViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CompactMonthWeekView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CompactWidthMonthViewController"), CFSTR("InfiniteScrollViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CompactWidthMonthViewController"), CFSTR("MonthViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CompactWidthMonthViewController"), CFSTR("showDate: animated: completionBlock:"), "v", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("InfiniteScrollViewController"), CFSTR("scrollView"), "@", 0);
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "^{CGPoint=dd}");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("N%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("InfiniteScrollViewController"), CFSTR("willEndDraggingWithVelocity: targetContentOffset:"), "v", "{CGPoint=dd}", objc_msgSend(v7, "UTF8String"), 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("InfiniteScrollViewController"), CFSTR("MainViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MainViewController"), CFSTR("model"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUIKCalendarModel"), CFSTR("selectedDate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompactMonthWeekView"), CFSTR("_today"), "CompactMonthWeekDayNumber");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompactWidthMonthViewController"), CFSTR("_dividedListMode"), "B");

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
  v13[2] = __82__CompactWidthMonthViewControllerAccessibility_showDate_animated_completionBlock___block_invoke;
  v13[3] = &unk_25027D4B8;
  v13[4] = self;
  v14 = v8;
  v9 = v8;
  v10 = a3;
  v11 = (void *)MEMORY[0x234914B7C](v13);
  v12.receiver = self;
  v12.super_class = (Class)CompactWidthMonthViewControllerAccessibility;
  -[CompactWidthMonthViewControllerAccessibility showDate:animated:completionBlock:](&v12, sel_showDate_animated_completionBlock_, v10, v5, v11);

}

void __82__CompactWidthMonthViewControllerAccessibility_showDate_animated_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  if (objc_msgSend(*(id *)(a1 + 32), "_accessibilityBoolValueForKey:", CFSTR("_AXShouldFocusOnTodayStorageKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("view"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilityFindSubviewDescendant:", &__block_literal_global_3);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "safeValueForKey:", CFSTR("_today"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], v4);

    }
    else
    {
      _AXAssert();
    }

  }
}

BOOL __82__CompactWidthMonthViewControllerAccessibility_showDate_animated_completionBlock___block_invoke_2(uint64_t a1, void *a2)
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

- (BOOL)accessibilityScroll:(int64_t)a3
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  CompactWidthMonthViewControllerAccessibility *v16;
  int64_t v17;

  v5 = -[CompactWidthMonthViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_dividedListMode"));
  if ((unint64_t)(a3 - 3) <= 1 && v5)
  {
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __68__CompactWidthMonthViewControllerAccessibility_accessibilityScroll___block_invoke;
    v15 = &unk_25027D508;
    v16 = self;
    v17 = a3;
    AXPerformSafeBlock();
    -[CompactWidthMonthViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("model"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("selectedDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AXDateStringForFormat();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _AXAssert();
      v9 = 0;
    }
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72E0], v9);

    return 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CompactWidthMonthViewControllerAccessibility;
    return -[CompactWidthMonthViewControllerAccessibility accessibilityScroll:](&v11, sel_accessibilityScroll_, a3);
  }
}

void __68__CompactWidthMonthViewControllerAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("scrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3010000000;
  v12 = 0;
  v10 = &unk_23276EEF7;
  v11 = 0;
  v6 = MEMORY[0x24BDAC760];
  v4 = v3;
  AXPerformSafeBlock();
  if (v2 == 3)
    v5 = -1.0;
  else
    v5 = 1.0;
  v13 = *((_OWORD *)v8 + 2);

  _Block_object_dispose(&v7, 8);
  objc_msgSend(*(id *)(a1 + 32), "willEndDraggingWithVelocity:targetContentOffset:", &v13, 0.0, v5, v6, 3221225472, __68__CompactWidthMonthViewControllerAccessibility_accessibilityScroll___block_invoke_2, &unk_25027D4E0);

}

uint64_t __68__CompactWidthMonthViewControllerAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "contentOffset");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

@end
