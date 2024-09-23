@implementation EKEventDateEditItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKEventDateEditItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventDateEditItem"), CFSTR("_modernEndDateCell"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventDateEditItem"), CFSTR("_endDateIsBeforeStartDate"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventDateEditItem"), CFSTR("_datePickerChanged:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("EKEventDateEditItem"), CFSTR("EKEventEditItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventDateEditItem"), CFSTR("_rowForSubitem:"), "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKCalendarItemEditor"), CFSTR("tableSectionForEditItem:"), "Q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDateEditItem"), CFSTR("_startDatePickerCell"), "UITableViewCell");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDateEditItem"), CFSTR("_endDatePickerCell"), "UITableViewCell");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDateEditItem"), CFSTR("_startDatePicker"), "UIDatePicker");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDateEditItem"), CFSTR("_endDatePicker"), "UIDatePicker");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventDateEditItem"), CFSTR("_showInlineControls:forSubitem:includingInlineDatePicker:"), "v", "q", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDateEditItem"), CFSTR("_selectedSubitem"), "q");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDateEditItem"), CFSTR("_currentPickerMode"), "q");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventDateEditItemAccessibility;
  -[EKEventDateEditItemAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[EKEventDateEditItemAccessibility _axUpdateEndDateCellLabel](self, "_axUpdateEndDateCellLabel");
  -[EKEventDateEditItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_modernEndDateCell"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetAssignedValue:forKey:", self, CFSTR("AXEKEventDateEditItem"));

  -[EKEventDateEditItemAccessibility _accessibilitySetupDateCellForKey:](self, "_accessibilitySetupDateCellForKey:", CFSTR("_start"));
  -[EKEventDateEditItemAccessibility _accessibilitySetupDateCellForKey:](self, "_accessibilitySetupDateCellForKey:", CFSTR("_end"));
}

- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKEventDateEditItemAccessibility;
  -[EKEventDateEditItemAccessibility editor:didSelectSubitem:](&v7, sel_editor_didSelectSubitem_, a3);
  v6 = MEMORY[0x24BDAC760];
  AXPerformBlockAsynchronouslyOnMainThread();
  -[EKEventDateEditItemAccessibility _accessibilitySetupDateCellForKey:](self, "_accessibilitySetupDateCellForKey:", CFSTR("_start"), v6, 3221225472, __60__EKEventDateEditItemAccessibility_editor_didSelectSubitem___block_invoke, &unk_2501FCD68, self, a4);
  -[EKEventDateEditItemAccessibility _accessibilitySetupDateCellForKey:](self, "_accessibilitySetupDateCellForKey:", CFSTR("_end"));
}

void __60__EKEventDateEditItemAccessibility_editor_didSelectSubitem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v2 = MEMORY[0x24BDAC760];
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __60__EKEventDateEditItemAccessibility_editor_didSelectSubitem___block_invoke_2;
  v19 = &unk_2501FCD18;
  v3 = *(_QWORD *)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 32);
  v21 = &v23;
  v22 = v3;
  AXPerformSafeBlock();
  LOBYTE(v12) = 0;
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11 = v5;
  AXPerformSafeBlock();
  v6 = v13[3];

  _Block_object_dispose(&v12, 8);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v24[3], v6, v2, 3221225472, __60__EKEventDateEditItemAccessibility_editor_didSelectSubitem___block_invoke_3, &unk_2501FCD40);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v11, "safeValueForKey:", CFSTR("tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "cellForRowAtIndexPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v10);

  _Block_object_dispose(&v23, 8);
}

uint64_t __60__EKEventDateEditItemAccessibility_editor_didSelectSubitem___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_rowForSubitem:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __60__EKEventDateEditItemAccessibility_editor_didSelectSubitem___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "tableSectionForEditItem:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_datePickerChanged:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventDateEditItemAccessibility;
  -[EKEventDateEditItemAccessibility _datePickerChanged:](&v4, sel__datePickerChanged_, a3);
  -[EKEventDateEditItemAccessibility _axUpdateEndDateCellLabel](self, "_axUpdateEndDateCellLabel");
}

- (void)_showInlineControls:(int64_t)a3 forSubitem:(int64_t)a4 includingInlineDatePicker:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v12;
  objc_super v13;

  v5 = a5;
  v9 = -[EKEventDateEditItemAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_selectedSubitem"));
  v10 = -[EKEventDateEditItemAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_currentPickerMode"));
  v13.receiver = self;
  v13.super_class = (Class)EKEventDateEditItemAccessibility;
  -[EKEventDateEditItemAccessibility _showInlineControls:forSubitem:includingInlineDatePicker:](&v13, sel__showInlineControls_forSubitem_includingInlineDatePicker_, a3, a4, v5);
  if (v9 != a4 || v10 != a3)
  {
    if (a4 == 1)
    {
      v12 = CFSTR("_start");
    }
    else
    {
      if (a4 != 2)
      {
LABEL_10:
        UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
        return;
      }
      v12 = CFSTR("_end");
    }
    -[EKEventDateEditItemAccessibility _accessibilitySetupDateCellForKey:](self, "_accessibilitySetupDateCellForKey:", v12);
    goto LABEL_10;
  }
}

- (void)_axUpdateEndDateCellLabel
{
  __CFString *v3;
  id v4;

  -[EKEventDateEditItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_modernEndDateCell"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[EKEventDateEditItemAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_endDateIsBeforeStartDate")))
  {
    accessibilityLocalizedString(CFSTR("invalid.end.date"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_2501FDFB0;
  }
  objc_msgSend(v4, "_accessibilitySetAssignedValue:forKey:", v3, CFSTR("AXAddendumString"));

}

- (void)_accessibilitySetupDateCellForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("DatePickerCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDateEditItemAccessibility safeValueForKey:](self, "safeValueForKey:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("DatePicker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventDateEditItemAccessibility safeValueForKey:](self, "safeValueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axSafelyAddObject:", v8);

  objc_msgSend(v9, "setAccessibilityElements:", v6);
}

@end
