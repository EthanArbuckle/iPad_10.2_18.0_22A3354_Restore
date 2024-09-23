@implementation UICalendarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICalendarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const __CFString *v5;
  const char *v6;
  const __CFString *v7;
  const char *v8;
  id v9;
  id *v10;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v10 = location;
  v9 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UICalendarView");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICalendarView"), CFSTR("_setupViewHierarchy"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v4, CFSTR("_dataModel"), "_UICalendarDataModel");
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UICalendarDataModel"), CFSTR("visibleMonth"), 0);
  v8 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_setVisibleMonth:animated:updateDataSource:updateCollectionView:notifyDelegate:"), v3, v6, "B", "B", "B", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_configuedCellForCollectionView: indexPath: day:"), v6, v6, v6, 0);
  v7 = CFSTR("_UIDatePickerCalendarDay");
  v5 = CFSTR("_UIDatePickerCalendarDateComponent");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("date"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("components"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("month"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("isToday"), v8, 0);
  objc_storeStrong(v10, v9);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  UICalendarViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UICalendarViewAccessibility;
  -[UICalendarViewAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[UICalendarViewAccessibility _axMarkupSubviews](v4);
  -[UICalendarViewAccessibility _accessibilityUpdateVisibleMonth](v4, "_accessibilityUpdateVisibleMonth");
}

- (void)_axMarkupSubviews
{
  id v1;
  id v2;
  id v3;
  char v4;
  id v5;
  id v6;
  char v7;
  id v8;
  id v9;

  v9 = a1;
  if (a1)
  {
    v7 = 0;
    objc_opt_class();
    v1 = (id)objc_msgSend(v9, "safeValueForKey:", CFSTR("_collectionView"));
    v6 = (id)__UIAccessibilityCastAsClass();

    v5 = v6;
    objc_storeStrong(&v6, 0);
    v8 = v5;
    v4 = 0;
    objc_opt_class();
    v3 = (id)__UIAccessibilityCastAsSafeCategory();
    v2 = v3;
    objc_storeStrong(&v3, 0);
    -[UICollectionViewAccessibility _axSetShouldIgnorePromiseRegions:]((uint64_t)v2);

    objc_msgSend(v8, "setAccessibilityShouldBypassCollectionViewAccessibility:", 1);
    objc_storeStrong(&v8, 0);
  }
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)_accessibilityFuzzyHitTestElements
{
  return (id)-[UICalendarViewAccessibility _accessibleSubviews:](self, "_accessibleSubviews:", 1, a2, self);
}

- (void)_setupViewHierarchy
{
  objc_super v2;
  SEL v3;
  UICalendarViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UICalendarViewAccessibility;
  -[UICalendarViewAccessibility _setupViewHierarchy](&v2, sel__setupViewHierarchy);
  -[UICalendarViewAccessibility _axMarkupSubviews](v4);
}

- (id)_configuedCellForCollectionView:(id)a3 indexPath:(id)a4 day:(id)a5
{
  id v6;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  int v21;
  int v22;
  id (*v23)(id *);
  void *v24;
  id v25;
  objc_super v26;
  id v27;
  id v28;
  id v29;
  id location[2];
  UICalendarViewAccessibility *v31;

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  objc_storeStrong(&v29, a4);
  v28 = 0;
  objc_storeStrong(&v28, a5);
  v26.receiver = v31;
  v26.super_class = (Class)UICalendarViewAccessibility;
  v27 = -[UICalendarViewAccessibility _configuedCellForCollectionView:indexPath:day:](&v26, sel__configuedCellForCollectionView_indexPath_day_, location[0], v29, v28);
  v9 = v27;
  v10 = MEMORY[0x24BDAC760];
  v20 = MEMORY[0x24BDAC760];
  v21 = -1073741824;
  v22 = 0;
  v23 = __77__UICalendarViewAccessibility__configuedCellForCollectionView_indexPath_day___block_invoke;
  v24 = &unk_24FF3DFB0;
  v25 = v28;
  objc_msgSend(v9, "_setAccessibilityLabelBlock:", &v20);
  objc_initWeak(&v19, v31);
  v11 = v27;
  v12 = v10;
  v13 = -1073741824;
  v14 = 0;
  v15 = __77__UICalendarViewAccessibility__configuedCellForCollectionView_indexPath_day___block_invoke_2;
  v16 = &unk_24FF3DFD8;
  objc_copyWeak(&v18, &v19);
  v17 = v28;
  objc_msgSend(v11, "_setIsAccessibilityElementBlock:", &v12);
  v6 = v27;
  objc_storeStrong(&v17, 0);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v19);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v6;
}

id __77__UICalendarViewAccessibility__configuedCellForCollectionView_indexPath_day___block_invoke(id *a1)
{
  id v1;
  id v2;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16[3];

  v16[2] = a1;
  v16[1] = a1;
  v15 = 0;
  objc_opt_class();
  v10 = (id)objc_msgSend(a1[4], "safeValueForKey:", CFSTR("components"));
  v14 = (id)__UIAccessibilityCastAsClass();

  v13 = v14;
  objc_storeStrong(&v14, 0);
  v16[0] = v13;
  v6 = (id)objc_msgSend(v13, "calendar");
  v12 = (id)objc_msgSend(v6, "dateFromComponents:", v16[0]);

  v8 = (id)objc_msgSend(v16[0], "calendar");
  v7 = (id)objc_msgSend(v8, "timeZone");
  v11 = (id)AXDateStringForFormatWithTimeZone();

  if ((objc_msgSend(a1[4], "safeBoolForKey:", CFSTR("isToday")) & 1) != 0)
  {
    v5 = accessibilityLocalizedString(CFSTR("calendar.today"));
    v1 = (id)__UIAXStringForVariables();
    v2 = v11;
    v11 = v1;

  }
  v4 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v16, 0);
  return v4;
}

uint64_t __77__UICalendarViewAccessibility__configuedCellForCollectionView_indexPath_day___block_invoke_2(uint64_t a1)
{
  id v3;
  id v4;
  id WeakRetained;
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (id)objc_msgSend(WeakRetained, "safeValueForKeyPath:", CFSTR("_dataModel.visibleMonth"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("month"));
  v6 = objc_msgSend(v4, "isEqual:");

  return v6 & 1;
}

- (void)_setVisibleMonth:(id)a3 animated:(BOOL)a4 updateDataSource:(BOOL)a5 updateCollectionView:(BOOL)a6 notifyDelegate:(BOOL)a7
{
  objc_super v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  id location[2];
  UICalendarViewAccessibility *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = a4;
  v14 = a5;
  v13 = a6;
  v12 = a7;
  v11.receiver = v17;
  v11.super_class = (Class)UICalendarViewAccessibility;
  -[UICalendarViewAccessibility _setVisibleMonth:animated:updateDataSource:updateCollectionView:notifyDelegate:](&v11, sel__setVisibleMonth_animated_updateDataSource_updateCollectionView_notifyDelegate_, location[0], a4, a5, a6, a7);
  -[UICalendarViewAccessibility _accessibilityUpdateVisibleMonth](v17, "_accessibilityUpdateVisibleMonth");
  objc_storeStrong(location, 0);
}

- (void)_accessibilityUpdateVisibleMonth
{
  id v2;
  id v3;
  id v4;
  id v5;
  char v6;
  id v7[2];
  UICalendarViewAccessibility *v8;

  v8 = self;
  v7[1] = (id)a2;
  v6 = 0;
  objc_opt_class();
  v2 = (id)-[UICalendarViewAccessibility _accessibilityViewAncestorIsKindOf:](v8, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v5 = (id)__UIAccessibilityCastAsSafeCategory();

  v4 = v5;
  objc_storeStrong(&v5, 0);
  v7[0] = v4;
  v3 = 0;
  if (v4)
    objc_msgSend(v7[0], "_accessibilityClearChildren");
  if (!v7[0] || UIAccessibilityIsSwitchControlRunning())
    objc_storeStrong(&v3, (id)*MEMORY[0x24BDFEF20]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v3);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(v7, 0);
}

@end
