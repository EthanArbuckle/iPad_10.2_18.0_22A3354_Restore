@implementation UIDatePickerCalendarTimeLabelAccessibility

uint64_t __77___UIDatePickerCalendarTimeLabelAccessibility__accessibilityResponderElement__block_invoke(id *a1, void *a2)
{
  const __CFString *v2;
  id v5;
  char v6;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = (id)objc_msgSend(location[0], "accessibilityIdentifier");
  if ((objc_msgSend(a1[4], "_axIsHoursEditing") & 1) != 0)
    v2 = CFSTR("Hours");
  else
    v2 = CFSTR("Minutes");
  v6 = objc_msgSend(v5, "isEqualToString:", v2);

  objc_storeStrong(location, 0);
  return v6 & 1;
}

uint64_t __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke(uint64_t a1)
{
  id v2;
  BOOL v3;
  id WeakRetained;
  char v6;
  char v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDF73A0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = 0;
  v6 = 0;
  if ((objc_msgSend(WeakRetained, "_axSelfIsFirstResponder") & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = 1;
    v6 = objc_msgSend(v8, "_axIsHoursEditing");
  }
  if ((v7 & 1) != 0)

  if ((v6 & 1) != 0)
    v9 |= *MEMORY[0x24BEBB198] | *MEMORY[0x24BEBB128];
  v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("inputScope")) != 0;

  if (!v3)
    return v9 | *MEMORY[0x24BDF73E8];
  return v9;
}

void __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_2(id *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v5[7];

  v5[6] = a1;
  v5[5] = a1;
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v1 = (id)objc_msgSend(WeakRetained, "safeStringForKey:", CFSTR("hourText"));
  v3 = (void *)objc_msgSend(v1, "integerValue");

  v5[4] = v3;
  v5[1] = a1[5];
  v5[2] = a1[6];
  v5[3] = v3;
  objc_copyWeak(v5, a1 + 4);
  AXPerformSafeBlock();
  objc_destroyWeak(v5);
}

void __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_3(uint64_t a1)
{
  id v1;
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;

  if (*(_QWORD *)(a1 + 48) >= *(_QWORD *)(a1 + 56) + 1)
    v4 = *(_QWORD *)(a1 + 56) + 1;
  else
    v4 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(a1 + 40) >= v4)
    v3 = *(_QWORD *)(a1 + 40);
  else
    v3 = v4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v3);
  objc_msgSend(WeakRetained, "setHourText:");

}

void __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v7[4];
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = a1;
  v14 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id)objc_msgSend(WeakRetained, "safeStringForKey:", CFSTR("hourText"));
  v5 = objc_msgSend(v3, "integerValue");

  v13 = v5;
  v12 = 0;
  v11 = 0;
  v11 = *(void **)(a1 + 40);
  v10 = 0;
  v9 = 0;
  v9 = *(void **)(a1 + 48);
  v8 = (void *)(v5 - 1);
  if ((uint64_t)v9 >= v5 - 1)
    v2 = v8;
  else
    v2 = v9;
  v7[3] = v2;
  v10 = v2;
  if ((uint64_t)v11 >= (uint64_t)v2)
    v1 = v11;
  else
    v1 = v10;
  v7[2] = v1;
  v12 = v1;
  objc_copyWeak(v7, (id *)(a1 + 32));
  v7[1] = v12;
  AXPerformSafeBlock();
  objc_destroyWeak(v7);
}

void __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_5(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "setHourText:");

}

id __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_6(uint64_t a1)
{
  id v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id)objc_msgSend(WeakRetained, "safeStringForKey:", CFSTR("hourText"));
  v4 = objc_msgSend(v2, "integerValue");

  v5 = (void *)MEMORY[0x24BDD17C8];
  v7 = (id)UIKitAccessibilityLocalizedString();
  v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
  v8 = (id)objc_msgSend(v5, "stringWithFormat:", v7, v6);

  return v8;
}

uint64_t __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_7(id *a1)
{
  id v2[3];

  v2[2] = a1;
  v2[1] = a1;
  objc_copyWeak(v2, a1 + 4);
  AXPerformSafeBlock();
  objc_destroyWeak(v2);
  return 1;
}

void __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_8(uint64_t a1)
{
  id v1;
  UIAccessibilityNotifications notification;
  id v3;
  id v4;
  id v6;
  id WeakRetained;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (id)objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("stateContext"));
  v8 = objc_msgSend(v6, "safeIntegerForKey:", CFSTR("currentState"));

  if (v8 != 3)
  {
    if (v8 == 1 || v8 == 6)
    {
      v4 = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(v4, "_stateMachineSendEvent:", 2);

    }
    v1 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v1, "_stateMachineSendEvent:", 2);

    notification = *MEMORY[0x24BDF71E8];
    v3 = (id)UIKitAccessibilityLocalizedString();
    UIAccessibilityPostNotification(notification, v3);

  }
}

uint64_t __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke(uint64_t a1)
{
  id v2;
  BOOL v3;
  id WeakRetained;
  char v6;
  char v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDF73A0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = 0;
  v6 = 0;
  if ((objc_msgSend(WeakRetained, "_axSelfIsFirstResponder") & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = 1;
    v6 = objc_msgSend(v8, "_axIsMinutesEditing");
  }
  if ((v7 & 1) != 0)

  if ((v6 & 1) != 0)
    v9 |= *MEMORY[0x24BEBB198] | *MEMORY[0x24BEBB128];
  v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("inputScope")) != 0;

  if (!v3)
    return v9 | *MEMORY[0x24BDF73E8];
  return v9;
}

void __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v7[4];
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = a1;
  v14 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id)objc_msgSend(WeakRetained, "safeStringForKey:", CFSTR("minuteText"));
  v5 = objc_msgSend(v3, "integerValue");

  v13 = v5;
  v12 = 0;
  v11 = 0;
  v11 = *(void **)(a1 + 40);
  v10 = 0;
  v9 = 0;
  v9 = *(void **)(a1 + 48);
  v8 = (void *)(v5 + 1);
  if ((uint64_t)v9 >= v5 + 1)
    v2 = v8;
  else
    v2 = v9;
  v7[3] = v2;
  v10 = v2;
  if ((uint64_t)v11 >= (uint64_t)v2)
    v1 = v11;
  else
    v1 = v10;
  v7[2] = v1;
  v12 = v1;
  objc_copyWeak(v7, (id *)(a1 + 32));
  v7[1] = v12;
  AXPerformSafeBlock();
  objc_destroyWeak(v7);
}

void __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_3(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "setMinuteText:");

}

void __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v7[4];
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = a1;
  v14 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id)objc_msgSend(WeakRetained, "safeStringForKey:", CFSTR("minuteText"));
  v5 = objc_msgSend(v3, "integerValue");

  v13 = v5;
  v12 = 0;
  v11 = 0;
  v11 = *(void **)(a1 + 40);
  v10 = 0;
  v9 = 0;
  v9 = *(void **)(a1 + 40);
  v8 = (void *)(v5 - 1);
  if ((uint64_t)v9 >= v5 - 1)
    v2 = v8;
  else
    v2 = v9;
  v7[3] = v2;
  v10 = v2;
  if ((uint64_t)v11 >= (uint64_t)v2)
    v1 = v11;
  else
    v1 = v10;
  v7[2] = v1;
  v12 = v1;
  objc_copyWeak(v7, (id *)(a1 + 32));
  v7[1] = v12;
  AXPerformSafeBlock();
  objc_destroyWeak(v7);
}

void __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_5(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "setMinuteText:");

}

id __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_6(uint64_t a1)
{
  id v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id)objc_msgSend(WeakRetained, "safeStringForKey:", CFSTR("minuteText"));
  v4 = objc_msgSend(v2, "integerValue");

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (id)UIKitAccessibilityLocalizedString();
  v7 = (id)objc_msgSend(v5, "stringWithFormat:", v4);

  return v7;
}

uint64_t __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_7(id *a1)
{
  id v2[3];

  v2[2] = a1;
  v2[1] = a1;
  objc_copyWeak(v2, a1 + 4);
  AXPerformSafeBlock();
  objc_destroyWeak(v2);
  return 1;
}

void __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_8(uint64_t a1)
{
  id v1;
  UIAccessibilityNotifications notification;
  id v3;
  id v4;
  id v6;
  id WeakRetained;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (id)objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("stateContext"));
  v8 = objc_msgSend(v6, "safeIntegerForKey:", CFSTR("currentState"));

  if (v8 != 4)
  {
    if (v8 == 1 || v8 == 6)
    {
      v4 = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(v4, "_stateMachineSendEvent:", 3);

    }
    v1 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v1, "_stateMachineSendEvent:", 3);

    notification = *MEMORY[0x24BDF71E8];
    v3 = (id)UIKitAccessibilityLocalizedString();
    UIAccessibilityPostNotification(notification, v3);

  }
}

@end
