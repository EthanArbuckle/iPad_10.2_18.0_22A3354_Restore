@implementation CNQuickActionButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNQuickActionButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNQuickActionButton"), CFSTR("showTitle"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNQuickActionButton"), CFSTR("button"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNQuickActionButton"), CFSTR("action"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNQuickAction"), CFSTR("titleForContext:"), "@", "q", 0);

}

- (id)_labelText
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__4;
  v8 = __Block_byref_object_dispose__4;
  v9 = 0;
  AXPerformSafeBlock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __46__CNQuickActionButtonAccessibility__labelText__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("action"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleForContext:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)isAccessibilityElement
{
  return -[CNQuickActionButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showTitle"));
}

- (id)button
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNQuickActionButtonAccessibility;
  -[CNQuickActionButtonAccessibility button](&v6, sel_button);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNQuickActionButtonAccessibility _labelText](self, "_labelText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  return v3;
}

@end
