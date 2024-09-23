@implementation CNPropertyRelatedNameCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPropertyRelatedNameCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPropertyCell"), CFSTR("copy:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNPropertyRelatedNameCell"), CFSTR("CNPropertyCell"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)CNPropertyRelatedNameCellAccessibility;
  -[CNPropertyRelatedNameCellAccessibility _accessibilityLoadAccessibilityInformation](&v13, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("copy.name.action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __84__CNPropertyRelatedNameCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v10 = &unk_2501D8390;
  objc_copyWeak(&v11, &location);
  v5 = (void *)objc_msgSend(v3, "initWithName:actionHandler:", v4, &v7);

  v14[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1, v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyRelatedNameCellAccessibility setAccessibilityCustomActions:](self, "setAccessibilityCustomActions:", v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

uint64_t __84__CNPropertyRelatedNameCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __84__CNPropertyRelatedNameCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "copy:", 0);

}

@end
