@implementation WDUnitPreferenceViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WDUnitPreferenceViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WDUnitPreferenceViewController"), CFSTR("_rows"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WDUnitPreferenceViewController"), CFSTR("_unitController"), "HKUnitPreferenceController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_WDUnitPreferenceViewControllerRow"), CFSTR("unit"), "@", 0);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  char v29;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)WDUnitPreferenceViewControllerAccessibility;
  -[WDUnitPreferenceViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v30, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = 0;
  -[WDUnitPreferenceViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_rows"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v7, "row");
  if (v11 < objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "safeValueForKey:", CFSTR("unit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[WDUnitPreferenceViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_unitController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy_;
    v27 = __Block_byref_object_dispose_;
    v28 = 0;
    v22 = MEMORY[0x24BDAC760];
    v17 = v16;
    v18 = v15;
    AXPerformSafeBlock();
    v19 = (id)v24[5];

    _Block_object_dispose(&v23, 8);
    __UIAccessibilitySafeClass();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      abort();
    objc_msgSend(v8, "setAccessibilityLabel:", v20, v22, 3221225472, __79__WDUnitPreferenceViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke, &unk_250229AD8);

  }
  return v8;
}

void __79__WDUnitPreferenceViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityNameForUnit:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
