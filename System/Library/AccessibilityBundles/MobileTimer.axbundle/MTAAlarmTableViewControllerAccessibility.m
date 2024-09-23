@implementation MTAAlarmTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAAlarmTableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MTAAlarmTableViewController"), CFSTR("UITableViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmTableViewController"), CFSTR("dataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmTableViewController"), CFSTR("_isAlarmsSection:"), "B", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmTableViewController"), CFSTR("_isWakeAlarmSection:"), "B", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmTableViewController"), CFSTR("tableView:viewForHeaderInSection:"), "@", "@", "q", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTAAlarmTableViewControllerAccessibility;
  -[MTAAlarmTableViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[MTAAlarmTableViewControllerAccessibility _axSetDetailLabelsForVisibleCells](self, "_axSetDetailLabelsForVisibleCells");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTAAlarmTableViewControllerAccessibility;
  -[MTAAlarmTableViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[MTAAlarmTableViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_axSetDetailLabelsForVisibleCells
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  int v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  MTAAlarmTableViewControllerAccessibility *v32;
  void *v33;
  uint64_t *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  LOBYTE(v22) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v21, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleRows");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v36;
    v4 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v22 = 0;
        v23 = &v22;
        v24 = 0x2020000000;
        LOBYTE(v25) = 0;
        v28 = v4;
        v29 = 3221225472;
        v30 = __77__MTAAlarmTableViewControllerAccessibility__axSetDetailLabelsForVisibleCells__block_invoke;
        v31 = &unk_2502B70D8;
        v33 = v6;
        v34 = &v22;
        v32 = self;
        AXPerformSafeBlock();
        v7 = *((unsigned __int8 *)v23 + 24);
        _Block_object_dispose(&v22, 8);
        if (v7)
        {
          -[MTAAlarmTableViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dataSource"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 0;
          v23 = &v22;
          v24 = 0x3032000000;
          v25 = __Block_byref_object_copy_;
          v26 = __Block_byref_object_dispose_;
          v27 = 0;
          v9 = v8;
          AXPerformSafeBlock();
          v10 = (id)v23[5];

          _Block_object_dispose(&v22, 8);
          objc_msgSend(v21, "tableView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "cellForRowAtIndexPath:", v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v22) = 0;
          objc_opt_class();
          __UIAccessibilityCastAsSafeCategory();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((_BYTE)v22)
            abort();
          v14 = v13;
          objc_msgSend(v13, "_axSetDetailLabelForAlarm:", v10);

        }
        v22 = 0;
        v23 = &v22;
        v24 = 0x2020000000;
        LOBYTE(v25) = 0;
        AXPerformSafeBlock();
        v15 = *((unsigned __int8 *)v23 + 24);
        _Block_object_dispose(&v22, 8);
        if (v15)
        {
          objc_msgSend(v21, "tableView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "headerViewForSection:", objc_msgSend(v6, "section"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          -[MTAAlarmTableViewControllerAccessibility _axSetHeaderLabelForSleepSection:](self, "_axSetHeaderLabelForSleepSection:", v17);
        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v20);
  }

}

uint64_t __77__MTAAlarmTableViewControllerAccessibility__axSetDetailLabelsForVisibleCells__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isAlarmsSection:", objc_msgSend(*(id *)(a1 + 40), "section"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __77__MTAAlarmTableViewControllerAccessibility__axSetDetailLabelsForVisibleCells__block_invoke_198(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "alarmAtRow:", objc_msgSend(*(id *)(a1 + 40), "row"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __77__MTAAlarmTableViewControllerAccessibility__axSetDetailLabelsForVisibleCells__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isWakeAlarmSection:", objc_msgSend(*(id *)(a1 + 40), "section"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_axSetHeaderLabelForSleepSection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "_accessibilityDescendantOfType:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v3, "contentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
  objc_msgSend(v6, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v8);

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MTAAlarmTableViewControllerAccessibility;
  -[MTAAlarmTableViewControllerAccessibility tableView:viewForHeaderInSection:](&v15, sel_tableView_viewForHeaderInSection_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  AXPerformSafeBlock();
  LODWORD(a4) = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  if ((_DWORD)a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      LOBYTE(v11) = 0;
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v8 = objc_claimAutoreleasedReturnValue();
      if ((_BYTE)v11)
        abort();
      v9 = (void *)v8;
      -[MTAAlarmTableViewControllerAccessibility _axSetHeaderLabelForSleepSection:](self, "_axSetHeaderLabelForSleepSection:", v8);

    }
  }

  return v7;
}

uint64_t __77__MTAAlarmTableViewControllerAccessibility_tableView_viewForHeaderInSection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isWakeAlarmSection:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
