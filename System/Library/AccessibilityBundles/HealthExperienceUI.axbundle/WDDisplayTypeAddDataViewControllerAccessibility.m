@implementation WDDisplayTypeAddDataViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WDDisplayTypeAddDataViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WDDisplayTypeAddDataViewController"), CFSTR("_unitController"), "HKUnitPreferenceController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WDDisplayTypeAddDataViewController"), CFSTR("valueFieldManualEntryItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WDUnitPreferenceViewController"), CFSTR("_unitController"), "HKUnitPreferenceController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WDDisplayTypeAddDataViewController"), CFSTR("_displayType"), "HKDisplayType");

}

- (id)valueFieldManualEntryItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  char v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)WDDisplayTypeAddDataViewControllerAccessibility;
  -[WDDisplayTypeAddDataViewControllerAccessibility valueFieldManualEntryItem](&v21, sel_valueFieldManualEntryItem);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDisplayTypeAddDataViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_displayType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v14) = 0;
  -[WDDisplayTypeAddDataViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_unitController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v13 = MEMORY[0x24BDAC760];
  v8 = v7;
  v9 = v5;
  AXPerformSafeBlock();
  v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  __UIAccessibilitySafeClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    abort();
  objc_msgSend(v3, "setAccessibilityLabel:", v11, v13, 3221225472, __76__WDDisplayTypeAddDataViewControllerAccessibility_valueFieldManualEntryItem__block_invoke, &unk_250222628);

  return v3;
}

void __76__WDDisplayTypeAddDataViewControllerAccessibility_valueFieldManualEntryItem__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityNameForDisplayType:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
