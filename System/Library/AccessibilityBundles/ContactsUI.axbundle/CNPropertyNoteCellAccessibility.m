@implementation CNPropertyNoteCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPropertyNoteCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPropertyNoteCell"), CFSTR("labelLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPropertyNoteCell"), CFSTR("textView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNPropertyNoteCellAccessibility;
  -[CNPropertyNoteCellAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  -[CNPropertyNoteCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __77__CNPropertyNoteCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8 = &unk_2501D8408;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", &v5);

  -[CNPropertyNoteCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelLabel"), v5, v6, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

id __77__CNPropertyNoteCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("labelLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CNPropertyNoteCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[CNPropertyNoteCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
