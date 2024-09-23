@implementation UICalendarHeaderViewAccessibility

void __60___UICalendarHeaderViewAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
  objc_msgSend(v2, "headerViewDidStepForward:", *(_QWORD *)(a1 + 32));

}

void __60___UICalendarHeaderViewAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
  objc_msgSend(v2, "headerViewDidStepBackward:", *(_QWORD *)(a1 + 32));

}

void __59___UICalendarHeaderViewAccessibility_setExpanded_animated___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications notification;
  id v3;
  char v4;
  id v5;
  id v6;
  id v7;
  char v8;
  id v9[3];

  v9[2] = (id)a1;
  v9[1] = (id)a1;
  v8 = 0;
  objc_opt_class();
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v7 = (id)__UIAccessibilityCastAsSafeCategory();

  v6 = v7;
  objc_storeStrong(&v7, 0);
  v9[0] = v6;
  if (v6)
    objc_msgSend(v9[0], "_accessibilityClearChildren");
  notification = *MEMORY[0x24BDF72C8];
  v4 = 0;
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_monthYearButton"));
    v4 = 1;
    UIAccessibilityPostNotification(notification, v5);
  }
  else
  {
    UIAccessibilityPostNotification(notification, *(id *)(a1 + 32));
  }
  if ((v4 & 1) != 0)

  objc_storeStrong(v9, 0);
}

id __60___UICalendarHeaderViewAccessibility__axMarkupMonthSelector__block_invoke(uint64_t a1)
{
  id v1;
  id WeakRetained;
  char v4;
  id v5;
  char v6;
  id v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = 0;
  v4 = 0;
  if ((objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isExpanded")) & 1) != 0)
  {
    v7 = accessibilityLocalizedString(CFSTR("calendar.hide.year.picker"));
    v6 = 1;
    v1 = v7;
  }
  else
  {
    v5 = accessibilityLocalizedString(CFSTR("calendar.show.year.picker"));
    v4 = 1;
    v1 = v5;
  }
  v8 = v1;
  if ((v4 & 1) != 0)

  if ((v6 & 1) != 0)
  return v8;
}

__CFString *__60___UICalendarHeaderViewAccessibility__axMarkupMonthSelector__block_invoke_2(uint64_t a1)
{
  __CFString *v1;
  id WeakRetained;
  __CFString *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isExpanded")) & 1) != 0)
    v1 = CFSTR("DatePicker.Hide");
  else
    v1 = CFSTR("DatePicker.Show");
  v4 = v1;

  return v4;
}

id __60___UICalendarHeaderViewAccessibility__axMarkupMonthSelector__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id)objc_msgSend(WeakRetained, "accessibilityValue");

  return v3;
}

double __60___UICalendarHeaderViewAccessibility__axMarkupMonthSelector__block_invoke_4(uint64_t a1)
{
  double v1;
  id v3;
  id WeakRetained;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id)objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("_monthYearLabel"));
  objc_msgSend(v3, "accessibilityActivationPoint");
  v5 = v1;

  return v5;
}

@end
