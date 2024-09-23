@implementation AVTAttributeEditorSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTAttributeEditorSectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAttributeEditorSectionHeaderView"), CFSTR("displayString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAttributeEditorSectionHeaderView"), CFSTR("accessoryButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAttributeEditorSectionHeaderView"), CFSTR("createAccessoryButtonIfNeeded"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTAttributeEditorSectionHeaderViewAccessibility;
  -[AVTAttributeEditorSectionHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[AVTAttributeEditorSectionHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessoryButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v4);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __94__AVTAttributeEditorSectionHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_250181FD8;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

id __94__AVTAttributeEditorSectionHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[AVTAttributeEditorSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("displayString"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTAttributeEditorSectionHeaderViewAccessibility;
  return *MEMORY[0x24BDF73C0] | -[AVTAttributeEditorSectionHeaderViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_accessibilitySupplementaryHeaderViews
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[AVTAttributeEditorSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessoryButton"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v9[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVTAttributeEditorSectionHeaderViewAccessibility;
    -[AVTAttributeEditorSectionHeaderViewAccessibility _accessibilitySupplementaryHeaderViews](&v8, sel__accessibilitySupplementaryHeaderViews);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)createAccessoryButtonIfNeeded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTAttributeEditorSectionHeaderViewAccessibility;
  -[AVTAttributeEditorSectionHeaderViewAccessibility createAccessoryButtonIfNeeded](&v3, sel_createAccessoryButtonIfNeeded);
  -[AVTAttributeEditorSectionHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
