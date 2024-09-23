@implementation DayNavigationWeekScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DayNavigationWeekScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DayNavigationWeekScrollView"), CFSTR("_weekStartForDate:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DayNavigationWeekScrollView"), CFSTR("selectedDate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DayNavigationWeekScrollView"), CFSTR("setSelectedDate: animated:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DayNavigationWeekScrollView"), CFSTR("didFinishScrolling"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DayNavigationWeekScrollView"), CFSTR("navigationView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DayNavigationWeekScrollView"), CFSTR("_cells"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DayNavigationView"), CFSTR("dayNavigationWeekScrollView:selectedDateChanged:"), "v", "@", "@", 0);

}

- (id)_axVisibleCells
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  BOOL (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v26 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[DayNavigationWeekScrollViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cells"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __59__DayNavigationWeekScrollViewAccessibility__axVisibleCells__block_invoke;
  v20 = &unk_25027D580;
  v21 = v3;
  v22 = v5;
  v23 = v7;
  v24 = v9;
  v25 = v11;
  v13 = v3;
  objc_msgSend(v12, "ax_filteredArrayUsingBlock:", &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_, v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

BOOL __59__DayNavigationWeekScrollViewAccessibility__axVisibleCells__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  _BOOL8 v13;
  double v14;
  double v15;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v3 = a2;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v4, "convertRect:toView:", *(_QWORD *)(a1 + 32));
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  v19 = CGRectIntersection(v18, *(CGRect *)(a1 + 40));
  v9 = v19.origin.x;
  v10 = v19.origin.y;
  v11 = v19.size.width;
  v12 = v19.size.height;
  if (CGRectIsNull(v19))
  {
    v13 = 0;
  }
  else
  {
    v20.origin.x = v9;
    v20.origin.y = v10;
    v20.size.width = v11;
    v20.size.height = v12;
    v17 = CGRectGetWidth(v20);
    v21.origin.x = v9;
    v21.origin.y = v10;
    v21.size.width = v11;
    v21.size.height = v12;
    v14 = v17 * CGRectGetHeight(v21);
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v15 = CGRectGetWidth(v22);
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    v13 = v14 > v15 * CGRectGetHeight(v23) * 0.5;
  }

  return v13;
}

- (int64_t)accessibilityElementCount
{
  void *v2;
  int64_t v3;

  -[DayNavigationWeekScrollViewAccessibility _axVisibleCells](self, "_axVisibleCells");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[DayNavigationWeekScrollViewAccessibility _axVisibleCells](self, "_axVisibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[DayNavigationWeekScrollViewAccessibility _axVisibleCells](self, "_axVisibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_accessibilityScrollStatus
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  AXPerformSafeBlock();
  v2 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("week.scroll.status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _AXGetStringsForDate((void *)v8[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v7, 8);
  return v5;
}

void __70__DayNavigationWeekScrollViewAccessibility__accessibilityScrollStatus__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "safeValueForKey:", CFSTR("selectedDate"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_weekStartForDate:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)setSelectedDate:(id)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DayNavigationWeekScrollViewAccessibility;
  -[DayNavigationWeekScrollViewAccessibility setSelectedDate:animated:](&v4, sel_setSelectedDate_animated_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  double v8;
  void *v9;
  id v10;
  void *v12;

  objc_opt_class();
  -[DayNavigationWeekScrollViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = a3 == 4 || a3 == 1;
  v8 = 604800.0;
  if (v7)
    v8 = -604800.0;
  objc_msgSend(v6, "dateByAddingTimeInterval:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DayNavigationWeekScrollViewAccessibility setSelectedDate:animated:](self, "setSelectedDate:animated:", v9, 1);
  v12 = v9;
  v10 = v9;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self);

  return 1;
}

void __64__DayNavigationWeekScrollViewAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "didFinishScrolling");
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("navDelegate"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dayNavigationWeekScrollView:selectedDateChanged:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
