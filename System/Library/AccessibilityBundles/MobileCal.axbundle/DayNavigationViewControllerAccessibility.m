@implementation DayNavigationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DayNavigationViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("DayViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DayNavigationViewController"), CFSTR("setSelectedDate: animated:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DayNavigationViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DayViewController"), CFSTR("dayNavigationViewController: didSelectDate:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DayNavigationViewController"), CFSTR("_navigationView"), "DayNavigationView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DayNavigationView"), CFSTR("_calendar"), "NSCalendar");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DayNavigationView"), CFSTR("_selectedDate"), "NSDate");

}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  UIAccessibilityNotifications v9;
  __CFString *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  -[DayNavigationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_navigationView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_selectedDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_calendar"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 1)
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v8, "setWeekOfYear:", -1);
      v9 = *MEMORY[0x24BDF71E8];
      v10 = CFSTR("day.scrubber.previous.week");
    }
    else
    {
      if (a3 != 2)
      {
        LOBYTE(v8) = 0;
        goto LABEL_13;
      }
      v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v8, "setWeekOfYear:", 1);
      v9 = *MEMORY[0x24BDF71E8];
      v10 = CFSTR("day.scrubber.next.week");
    }
    accessibilityLocalizedString(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v9, v11);

    if (v8)
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x3032000000;
      v24 = __Block_byref_object_copy__0;
      v25 = __Block_byref_object_dispose__0;
      v26 = 0;
      v19 = v7;
      v8 = v8;
      v20 = v6;
      AXPerformSafeBlock();
      v12 = (id)v22[5];

      _Block_object_dispose(&v21, 8);
      v13 = v12;
      v18 = v13;
      AXPerformSafeBlock();
      -[DayNavigationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        NSClassFromString(CFSTR("DayViewController"));
        if ((objc_opt_isKindOfClass() & 1) == 0)
          _AXAssert();
      }
      v15 = v13;
      v16 = v14;
      AXPerformSafeBlock();

      LOBYTE(v8) = 1;
      goto LABEL_14;
    }
LABEL_13:
    v15 = 0;
LABEL_14:

    goto LABEL_15;
  }
  _AXAssert();
  LOBYTE(v8) = 0;
LABEL_15:

  return (char)v8;
}

void __64__DayNavigationViewControllerAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dateByAddingComponents:toDate:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __64__DayNavigationViewControllerAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelectedDate:animated:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __64__DayNavigationViewControllerAccessibility_accessibilityScroll___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dayNavigationViewController:didSelectDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
