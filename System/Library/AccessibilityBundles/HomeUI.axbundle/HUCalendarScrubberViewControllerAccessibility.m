@implementation HUCalendarScrubberViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUCalendarScrubberViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUCalendarScrubberViewController"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUCalendarScrubberViewController"), CFSTR("_dataSource"), "HUCalendarScrubberDataSource");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUCalendarScrubberDataSource"), CFSTR("dateAtIndexPath:"), "@", 0);

}

- (void)_axLoadAccessibilityInformationForCalendarCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17[8];
  id location;
  id *p_location;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  location = 0;
  p_location = &location;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v8 = MEMORY[0x24BDAC760];
  v17[1] = (id)MEMORY[0x24BDAC760];
  v17[2] = (id)3221225472;
  v17[3] = __108__HUCalendarScrubberViewControllerAccessibility__axLoadAccessibilityInformationForCalendarCell_atIndexPath___block_invoke;
  v17[4] = &unk_2502345D0;
  v17[7] = &location;
  v17[5] = self;
  v9 = v7;
  v17[6] = v9;
  AXPerformSafeBlock();
  v10 = p_location[5];

  _Block_object_dispose(&location, 8);
  AXDateStringForFormat();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v11);

  objc_initWeak(&location, v6);
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __108__HUCalendarScrubberViewControllerAccessibility__axLoadAccessibilityInformationForCalendarCell_atIndexPath___block_invoke_2;
  v16[3] = &unk_2502345F8;
  objc_copyWeak(v17, &location);
  objc_msgSend(v6, "_setAccessibilityTraitsBlock:", v16);
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __108__HUCalendarScrubberViewControllerAccessibility__axLoadAccessibilityInformationForCalendarCell_atIndexPath___block_invoke_3;
  v14[3] = &unk_250234568;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v6, "_setAccessibilityValueBlock:", v14);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __108__HUCalendarScrubberViewControllerAccessibility__axLoadAccessibilityInformationForCalendarCell_atIndexPath___block_invoke_4;
  v12[3] = &unk_250234568;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v6, "_setAccessibilityHintBlock:", v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

}

void __108__HUCalendarScrubberViewControllerAccessibility__axLoadAccessibilityInformationForCalendarCell_atIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_dataSource"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __108__HUCalendarScrubberViewControllerAccessibility__axLoadAccessibilityInformationForCalendarCell_atIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  int v4;
  _QWORD *v5;
  id v6;
  char v7;

  v1 = *MEMORY[0x24BDF73B0];
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "isSelected");

  if (v4)
  {
    v5 = (_QWORD *)MEMORY[0x24BDF7400];
    return *v5 | v1;
  }
  v6 = objc_loadWeakRetained(v2);
  v7 = objc_msgSend(v6, "isUserInteractionEnabled");

  if ((v7 & 1) == 0)
  {
    v5 = (_QWORD *)MEMORY[0x24BDF73E8];
    return *v5 | v1;
  }
  return v1;
}

id __108__HUCalendarScrubberViewControllerAccessibility__axLoadAccessibilityInformationForCalendarCell_atIndexPath___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isUserInteractionEnabled"))
  {
    accessibilityHomeUILocalizedString(CFSTR("camera.calendar.cell.clips.available"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id __108__HUCalendarScrubberViewControllerAccessibility__axLoadAccessibilityInformationForCalendarCell_atIndexPath___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isUserInteractionEnabled"))
  {
    accessibilityHomeUILocalizedString(CFSTR("camera.calendar.cell.hint"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUCalendarScrubberViewControllerAccessibility;
  v6 = a4;
  -[HUCalendarScrubberViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v9, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberViewControllerAccessibility _axLoadAccessibilityInformationForCalendarCell:atIndexPath:](self, "_axLoadAccessibilityInformationForCalendarCell:atIndexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

@end
